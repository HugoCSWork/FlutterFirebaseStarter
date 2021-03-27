import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_firebase_setup/domain/auth/auth_value_objects.dart';
import 'package:flutter_firebase_setup/domain/auth/sign_in/sign_in.dart';
import 'package:flutter_firebase_setup/domain/auth/sign_up/sign_up.dart';

import 'auth_service_errors/auth_service_errors.dart';

abstract class IAuthFacade {
  Future<Either<AuthServiceError, Unit>> registerWithEmailAndPassword(
      {required SignUpModel signUpModel});

  Future<Either<AuthServiceError, Unit>> signInWithEmailAndPassword(
      {required SignInModel signInModel});

  Future<Either<AuthServiceError, Unit>> signInWithGoogle();

  Future<Either<AuthServiceError, Unit>> resetPasswordEmail(
      {required EmailAddress email});

  Future<void> signOut();

  Future<Option<User>> getSignedInUser();
}
