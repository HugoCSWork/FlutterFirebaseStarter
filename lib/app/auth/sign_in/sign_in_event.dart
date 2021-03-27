part of 'sign_in_bloc.dart';

@freezed
class SignInEvent with _$SignInEvent {
  const factory SignInEvent.emailChanged(String email) = _EmailChanged;
  const factory SignInEvent.passwordChanged(String password) = _PasswordChanged;
  const factory SignInEvent.obscureChanged(bool isObscure) = _ObscureChanged;
  const factory SignInEvent.signInEmailAndPasswordPressed() =
      _SignInWithEmailAndPasswordPressed;

  const factory SignInEvent.signInWithGoogle() = _SignInWithGoogle;
}
