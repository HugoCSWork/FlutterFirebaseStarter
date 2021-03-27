part of 'forgotten_password_bloc.dart';

@freezed
class ForgottenPasswordState with _$ForgottenPasswordState {
  const factory ForgottenPasswordState({
    required EmailAddress emailAddress,
    required AutovalidateMode showErrorMessages,
    required bool isSubmitting,
    required Option<Either<AuthServiceError, Unit>> authFailureOrSuccess,
  }) = _ForgottenPasswordState;

  factory ForgottenPasswordState.initial() => ForgottenPasswordState(
        emailAddress: EmailAddress(''),
        showErrorMessages: AutovalidateMode.disabled,
        isSubmitting: false,
        authFailureOrSuccess: none(),
      );
}
