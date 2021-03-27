import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_firebase_setup/domain/auth/auth_service_errors/auth_service_errors.dart';
import 'package:flutter_firebase_setup/domain/auth/auth_value_objects.dart';
import 'package:flutter_firebase_setup/domain/auth/i_auth_facade.dart';
import 'package:flutter_firebase_setup/domain/auth/sign_up/sign_up.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'sign_up_bloc.freezed.dart';
part 'sign_up_event.dart';
part 'sign_up_state.dart';

@injectable
class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  final IAuthFacade _authFacade;
  SignUpBloc(this._authFacade) : super(SignUpState.initial());

  @override
  Stream<SignUpState> mapEventToState(
    SignUpEvent event,
  ) async* {
    yield* event.map(
      emailChanged: (e) async* {
        yield state.copyWith(
          signUpModel: state.signUpModel.copyWith(email: EmailAddress(e.email)),
        );
      },
      passwordChanged: (e) async* {
        yield state.copyWith(
          signUpModel:
              state.signUpModel.copyWith(password: Password(e.password)),
        );
      },
      obscureChanged: (e) async* {
        yield state.copyWith(
          isObscure: e.isObscure,
        );
      },
      signUpEmailAndPasswordPressed: (e) async* {
        Either<AuthServiceError, Unit>? failureOrSuccess;

        yield state.copyWith(
          isSubmitting: true,
          authFailureOrSuccess: none(),
        );

        if (state.signUpModel.failureOption.isNone()) {
          failureOrSuccess = await _authFacade.registerWithEmailAndPassword(
              signUpModel: state.signUpModel);
        }

        yield state.copyWith(
            isSubmitting: false,
            showErrorMessages: AutovalidateMode.always,
            authFailureOrSuccess: optionOf(failureOrSuccess));
      },
    );
  }
}
