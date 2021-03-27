import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_firebase_setup/domain/auth/auth_service_errors/auth_service_errors.dart';
import 'package:flutter_firebase_setup/domain/auth/auth_value_objects.dart';
import 'package:flutter_firebase_setup/domain/auth/sign_in/sign_in.dart';
import 'package:flutter_firebase_setup/domain/auth/sign_up/sign_up.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:injectable/injectable.dart';

@injectable
class FirebaseAuthHelpers {
  final FirebaseAuth _firebaseAuth;
  final GoogleSignIn _googleSignIn;

  FirebaseAuthHelpers(this._firebaseAuth, this._googleSignIn);

  Future<Either<AuthServiceError, Unit>> registerWithEmailAndPassword(
      SignUpModel model) async {
    try {
      final emailTrimmed = model.email.getOrCrash().trim();
      final passwordTrimmed = model.password.getOrCrash().trim();
      await _firebaseAuth.createUserWithEmailAndPassword(
          email: emailTrimmed, password: passwordTrimmed);

      return right(unit);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        return left(const AuthServiceError.emailAlreadyInUse());
      } else {
        return left(const AuthServiceError.serviceError());
      }
    } on Exception catch (_) {
      return left(const AuthServiceError.unexpected());
    }
  }

  Future<Either<AuthServiceError, Unit>> loginWithEmailAndPassword(
      SignInModel model) async {
    try {
      final emailTrimmed = model.email.getOrCrash().trim();
      final passwordTrimmed = model.password.getOrCrash().trim();
      await _firebaseAuth.signInWithEmailAndPassword(
          email: emailTrimmed, password: passwordTrimmed);

      return right(unit);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found' ||
          e.code == 'invalid-email' ||
          e.code == 'wrong-password') {
        return left(const AuthServiceError.invalidEmailAndPassword());
      } else {
        return left(const AuthServiceError.serviceError());
      }
    } on Exception catch (_) {
      return left(const AuthServiceError.unexpected());
    }
  }

  Future<Either<AuthServiceError, Unit>> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      if (googleUser == null) {
        return left(AuthServiceError.cancelledByUser());
      }
      final googleAuthentication = await googleUser.authentication;
      final authCredential = GoogleAuthProvider.credential(
          accessToken: googleAuthentication.accessToken,
          idToken: googleAuthentication.idToken);
      await _firebaseAuth.signInWithCredential(authCredential);
      return right(unit);
    } on FirebaseAuthException catch (_) {
      return left(const AuthServiceError.serviceError());
    } on Exception catch (_) {
      return left(const AuthServiceError.unexpected());
    }
  }

  Future<Either<AuthServiceError, Unit>> sendPasswordReset(
      EmailAddress email) async {
    try {
      await _firebaseAuth.sendPasswordResetEmail(email: email.getOrCrash());
      return right(unit);
    } on FirebaseAuthException catch (_) {
      return left(const AuthServiceError.serviceError());
    } on Exception catch (_) {
      return left(const AuthServiceError.unexpected());
    }
  }

  Future<Option<User>> getSignedInUser() async =>
      optionOf(_firebaseAuth.currentUser);

  Future<void> signOut() => Future.wait([
        _firebaseAuth.signOut(),
        _googleSignIn.signOut(),
      ]);
}
