import 'package:dartz/dartz.dart';
import 'package:flutter_firebase_setup/domain/auth/auth_value_objects.dart';
import 'package:flutter_firebase_setup/domain/core/value_failures.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'sign_in.freezed.dart';

@freezed
abstract class SignInModel implements _$SignInModel {
  const factory SignInModel({
    required EmailAddress email,
    required Password password,
  }) = _SignInModel;

  const SignInModel._();

  factory SignInModel.empty() =>
      SignInModel(email: EmailAddress(''), password: Password(''));

  Option<ValueFailure<dynamic>> get failureOption {
    return email.failureOrUnit
        .andThen(password.failureOrUnit)
        .fold((l) => some(l), (_) => none());
  }
}
