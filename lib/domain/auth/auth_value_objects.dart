import 'package:dartz/dartz.dart';
import 'package:flutter_firebase_setup/domain/auth/auth_value_validators.dart';
import 'package:flutter_firebase_setup/domain/core/value_failures.dart';
import 'package:flutter_firebase_setup/domain/core/value_objects.dart';

class EmailAddress extends ValueObject<String>{
  @override
  final Either<ValueFailure<String>, String> value;

  factory EmailAddress(String input) {
    return EmailAddress._(validateEmailAddress(input));
  }

  const EmailAddress._(this.value);
}

class Password extends ValueObject<String>{
  @override
  final Either<ValueFailure<String>, String> value;

  factory Password(String input) {
    return Password._(validatePassword(input));
  }

  const Password._(this.value);
}