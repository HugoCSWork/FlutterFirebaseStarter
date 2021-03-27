part of 'forgotten_password_bloc.dart';

@freezed
class ForgottenPasswordEvent with _$ForgottenPasswordEvent {
  const factory ForgottenPasswordEvent.passwordReset() = PasswordReset;
  const factory ForgottenPasswordEvent.emailChanged(String email) =
      EmailChanged;
}
