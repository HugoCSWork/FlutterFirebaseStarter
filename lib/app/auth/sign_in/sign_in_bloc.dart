import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_firebase_setup/domain/auth/auth_service_errors/auth_service_errors.dart';
import 'package:flutter_firebase_setup/domain/auth/auth_value_objects.dart';
import 'package:flutter_firebase_setup/domain/auth/i_auth_facade.dart';
import 'package:flutter_firebase_setup/domain/auth/sign_in/sign_in.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'sign_in_bloc.freezed.dart';
part 'sign_in_event.dart';
part 'sign_in_state.dart';

@injectable
class SignInBloc extends Bloc<SignInEvent, SignInState> {
  final IAuthFacade _authFacade;
  SignInBloc(this._authFacade) : super(SignInState.initial());

  @override
  Stream<SignInState> mapEventToState(
    SignInEvent event,
  ) async* {
    yield* event.map(
      emailChanged: (e) async* {
        yield state.copyWith(
          signInModel: state.signInModel.copyWith(email: EmailAddress(e.email)),
        );
      },
      passwordChanged: (e) async* {
        yield state.copyWith(
          signInModel:
              state.signInModel.copyWith(password: Password(e.password)),
        );
      },
      obscureChanged: (e) async* {
        yield state.copyWith(
          isObscure: e.isObscure,
        );
      },
      signInEmailAndPasswordPressed: (e) async* {
        Either<AuthServiceError, Unit>? failureOrSuccess;

        yield state.copyWith(
          isSubmitting: true,
          authFailureOrSuccess: none(),
        );

        if (state.signInModel.failureOption.isNone()) {
          failureOrSuccess = await _authFacade.signInWithEmailAndPassword(
              signInModel: state.signInModel);
        }

        yield state.copyWith(
            isSubmitting: false,
            showErrorMessages: AutovalidateMode.always,
            authFailureOrSuccess: optionOf(failureOrSuccess));
      },
      signInWithGoogle: (_SignInWithGoogle value) async* {
        yield state.copyWith(
          isSubmitting: true,
          authFailureOrSuccess: none(),
        );

        final failureOrSuccess = await _authFacade.signInWithGoogle();

        yield state.copyWith(
          isSubmitting: false,
          authFailureOrSuccess: some(failureOrSuccess),
        );
      },
    );
  }
}
