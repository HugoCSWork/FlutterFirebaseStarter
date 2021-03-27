import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_firebase_setup/domain/auth/auth_service_errors/auth_service_errors.dart';
import 'package:flutter_firebase_setup/domain/auth/auth_value_objects.dart';
import 'package:flutter_firebase_setup/domain/auth/i_auth_facade.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'forgotten_password_bloc.freezed.dart';
part 'forgotten_password_event.dart';
part 'forgotten_password_state.dart';

@injectable
class ForgottenPasswordBloc
    extends Bloc<ForgottenPasswordEvent, ForgottenPasswordState> {
  final IAuthFacade _authFacade;

  ForgottenPasswordBloc(this._authFacade)
      : super(ForgottenPasswordState.initial());

  @override
  Stream<ForgottenPasswordState> mapEventToState(
    ForgottenPasswordEvent event,
  ) async* {
    yield* event.map(
      emailChanged: (e) async* {
        yield state.copyWith(
          emailAddress: EmailAddress(e.email),
          authFailureOrSuccess: none(),
        );
      },
      passwordReset: (e) async* {
        Either<AuthServiceError, Unit>? failureOrSuccess;

        yield state.copyWith(
          isSubmitting: true,
          authFailureOrSuccess: none(),
        );

        if (state.emailAddress.isValid()) {
          failureOrSuccess =
              await _authFacade.resetPasswordEmail(email: state.emailAddress);
        }

        yield state.copyWith(
            isSubmitting: false,
            showErrorMessages: AutovalidateMode.always,
            authFailureOrSuccess: optionOf(failureOrSuccess));
      },
    );
  }
}
