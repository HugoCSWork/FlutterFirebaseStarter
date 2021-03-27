import 'package:dartz/dartz.dart';
import 'package:flutter_firebase_setup/domain/auth/auth_value_objects.dart';
import 'package:flutter_firebase_setup/domain/core/value_failures.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'sign_up.freezed.dart';

@freezed
abstract class SignUpModel implements _$SignUpModel {
  const factory SignUpModel({
    required EmailAddress email,
    required Password password,
  }) = _SignUpModel;

  const SignUpModel._();

  factory SignUpModel.empty() =>
      SignUpModel(email: EmailAddress(''), password: Password(''));

  Option<ValueFailure<dynamic>> get failureOption {
    return email.failureOrUnit
        .andThen(password.failureOrUnit)
        .fold((l) => some(l), (_) => none());
  }
}
