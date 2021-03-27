part of 'sign_in_bloc.dart';

@freezed
class SignInState with _$SignInState {
  const factory SignInState(
      {required SignInModel signInModel,
      required AutovalidateMode showErrorMessages,
      required bool isSubmitting,
      required bool isObscure,
      required Option<Either<AuthServiceError, Unit>>
          authFailureOrSuccess}) = _SignInState;

  factory SignInState.initial() => SignInState(
      signInModel: SignInModel.empty(),
      isSubmitting: false,
      isObscure: true,
      authFailureOrSuccess: none(),
      showErrorMessages: AutovalidateMode.disabled);
}
