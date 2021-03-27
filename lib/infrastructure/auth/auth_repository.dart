import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_firebase_setup/domain/auth/auth_service_errors/auth_service_errors.dart';
import 'package:flutter_firebase_setup/domain/auth/auth_value_objects.dart';
import 'package:flutter_firebase_setup/domain/auth/i_auth_facade.dart';
import 'package:flutter_firebase_setup/domain/auth/sign_in/sign_in.dart';
import 'package:flutter_firebase_setup/domain/auth/sign_up/sign_up.dart';
import 'package:flutter_firebase_setup/infrastructure/auth/auth_shared.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: IAuthFacade, env: [Environment.prod])
class AuthRepository implements IAuthFacade {
  final FirebaseAuthHelpers _firebaseAuthHelpers;
  AuthRepository(this._firebaseAuthHelpers);

  @override
  Future<Either<AuthServiceError, Unit>> registerWithEmailAndPassword(
      {required SignUpModel signUpModel}) async {
    return await _firebaseAuthHelpers.registerWithEmailAndPassword(signUpModel);
  }

  @override
  Future<Either<AuthServiceError, Unit>> signInWithEmailAndPassword(
      {required SignInModel signInModel}) async {
    return await _firebaseAuthHelpers.loginWithEmailAndPassword(signInModel);
  }

  @override
  Future<Either<AuthServiceError, Unit>> signInWithGoogle() async {
    return await _firebaseAuthHelpers.signInWithGoogle();
  }

  @override
  Future<Either<AuthServiceError, Unit>> resetPasswordEmail(
      {required EmailAddress email}) async {
    return await _firebaseAuthHelpers.sendPasswordReset(email);
  }

  @override
  Future<Option<User>> getSignedInUser() async {
    return await _firebaseAuthHelpers.getSignedInUser();
  }

  @override
  Future<void> signOut() async {
    return await _firebaseAuthHelpers.signOut();
  }
}
