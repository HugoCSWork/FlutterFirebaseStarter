
import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_service_errors.freezed.dart';

@freezed
class AuthServiceError with _$AuthServiceError {
  const factory AuthServiceError.cancelledByUser() = CancelledByUser;
  const factory AuthServiceError.serviceError() = ServerError;
  const factory AuthServiceError.emailAlreadyInUse() = EmailAlreadyInUse;
  const factory AuthServiceError.invalidEmailAndPassword() = InvalidEmailAndPassword;
  const factory AuthServiceError.unexpected() = Unexpected;
}