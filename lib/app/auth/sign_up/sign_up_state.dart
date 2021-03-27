part of 'sign_up_bloc.dart';

@freezed
class SignUpState with _$SignUpState {
  const factory SignUpState(
      {required SignUpModel signUpModel,
      required AutovalidateMode showErrorMessages,
      required bool isSubmitting,
      required bool isObscure,
      required Option<Either<AuthServiceError, Unit>>
          authFailureOrSuccess}) = _SignUpState;

  factory SignUpState.initial() => SignUpState(
      signUpModel: SignUpModel.empty(),
      isSubmitting: false,
      isObscure: true,
      authFailureOrSuccess: none(),
      showErrorMessages: AutovalidateMode.disabled);
}
