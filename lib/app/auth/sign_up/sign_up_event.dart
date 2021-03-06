part of 'sign_up_bloc.dart';

@freezed
class SignUpEvent with _$SignUpEvent {
  const factory SignUpEvent.emailChanged(String email) = _EmailChanged;
  const factory SignUpEvent.passwordChanged(String password) = _PasswordChanged;
  const factory SignUpEvent.obscureChanged(bool isObscure) = _ObscureChanged;

  const factory SignUpEvent.signUpEmailAndPasswordPressed() =
      _SignUpWithEmailAndPasswordPressed;
}
