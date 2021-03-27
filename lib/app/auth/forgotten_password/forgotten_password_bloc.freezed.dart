// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'forgotten_password_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$ForgottenPasswordEventTearOff {
  const _$ForgottenPasswordEventTearOff();

  PasswordReset passwordReset() {
    return const PasswordReset();
  }

  EmailChanged emailChanged(String email) {
    return EmailChanged(
      email,
    );
  }
}

/// @nodoc
const $ForgottenPasswordEvent = _$ForgottenPasswordEventTearOff();

/// @nodoc
mixin _$ForgottenPasswordEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() passwordReset,
    required TResult Function(String email) emailChanged,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? passwordReset,
    TResult Function(String email)? emailChanged,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PasswordReset value) passwordReset,
    required TResult Function(EmailChanged value) emailChanged,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PasswordReset value)? passwordReset,
    TResult Function(EmailChanged value)? emailChanged,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ForgottenPasswordEventCopyWith<$Res> {
  factory $ForgottenPasswordEventCopyWith(ForgottenPasswordEvent value,
          $Res Function(ForgottenPasswordEvent) then) =
      _$ForgottenPasswordEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$ForgottenPasswordEventCopyWithImpl<$Res>
    implements $ForgottenPasswordEventCopyWith<$Res> {
  _$ForgottenPasswordEventCopyWithImpl(this._value, this._then);

  final ForgottenPasswordEvent _value;
  // ignore: unused_field
  final $Res Function(ForgottenPasswordEvent) _then;
}

/// @nodoc
abstract class $PasswordResetCopyWith<$Res> {
  factory $PasswordResetCopyWith(
          PasswordReset value, $Res Function(PasswordReset) then) =
      _$PasswordResetCopyWithImpl<$Res>;
}

/// @nodoc
class _$PasswordResetCopyWithImpl<$Res>
    extends _$ForgottenPasswordEventCopyWithImpl<$Res>
    implements $PasswordResetCopyWith<$Res> {
  _$PasswordResetCopyWithImpl(
      PasswordReset _value, $Res Function(PasswordReset) _then)
      : super(_value, (v) => _then(v as PasswordReset));

  @override
  PasswordReset get _value => super._value as PasswordReset;
}

/// @nodoc
class _$PasswordReset implements PasswordReset {
  const _$PasswordReset();

  @override
  String toString() {
    return 'ForgottenPasswordEvent.passwordReset()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is PasswordReset);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() passwordReset,
    required TResult Function(String email) emailChanged,
  }) {
    return passwordReset();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? passwordReset,
    TResult Function(String email)? emailChanged,
    required TResult orElse(),
  }) {
    if (passwordReset != null) {
      return passwordReset();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PasswordReset value) passwordReset,
    required TResult Function(EmailChanged value) emailChanged,
  }) {
    return passwordReset(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PasswordReset value)? passwordReset,
    TResult Function(EmailChanged value)? emailChanged,
    required TResult orElse(),
  }) {
    if (passwordReset != null) {
      return passwordReset(this);
    }
    return orElse();
  }
}

abstract class PasswordReset implements ForgottenPasswordEvent {
  const factory PasswordReset() = _$PasswordReset;
}

/// @nodoc
abstract class $EmailChangedCopyWith<$Res> {
  factory $EmailChangedCopyWith(
          EmailChanged value, $Res Function(EmailChanged) then) =
      _$EmailChangedCopyWithImpl<$Res>;
  $Res call({String email});
}

/// @nodoc
class _$EmailChangedCopyWithImpl<$Res>
    extends _$ForgottenPasswordEventCopyWithImpl<$Res>
    implements $EmailChangedCopyWith<$Res> {
  _$EmailChangedCopyWithImpl(
      EmailChanged _value, $Res Function(EmailChanged) _then)
      : super(_value, (v) => _then(v as EmailChanged));

  @override
  EmailChanged get _value => super._value as EmailChanged;

  @override
  $Res call({
    Object? email = freezed,
  }) {
    return _then(EmailChanged(
      email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
class _$EmailChanged implements EmailChanged {
  const _$EmailChanged(this.email);

  @override
  final String email;

  @override
  String toString() {
    return 'ForgottenPasswordEvent.emailChanged(email: $email)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is EmailChanged &&
            (identical(other.email, email) ||
                const DeepCollectionEquality().equals(other.email, email)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(email);

  @JsonKey(ignore: true)
  @override
  $EmailChangedCopyWith<EmailChanged> get copyWith =>
      _$EmailChangedCopyWithImpl<EmailChanged>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() passwordReset,
    required TResult Function(String email) emailChanged,
  }) {
    return emailChanged(email);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? passwordReset,
    TResult Function(String email)? emailChanged,
    required TResult orElse(),
  }) {
    if (emailChanged != null) {
      return emailChanged(email);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PasswordReset value) passwordReset,
    required TResult Function(EmailChanged value) emailChanged,
  }) {
    return emailChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PasswordReset value)? passwordReset,
    TResult Function(EmailChanged value)? emailChanged,
    required TResult orElse(),
  }) {
    if (emailChanged != null) {
      return emailChanged(this);
    }
    return orElse();
  }
}

abstract class EmailChanged implements ForgottenPasswordEvent {
  const factory EmailChanged(String email) = _$EmailChanged;

  String get email => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $EmailChangedCopyWith<EmailChanged> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
class _$ForgottenPasswordStateTearOff {
  const _$ForgottenPasswordStateTearOff();

  _ForgottenPasswordState call(
      {required EmailAddress emailAddress,
      required AutovalidateMode showErrorMessages,
      required bool isSubmitting,
      required Option<Either<AuthServiceError, Unit>> authFailureOrSuccess}) {
    return _ForgottenPasswordState(
      emailAddress: emailAddress,
      showErrorMessages: showErrorMessages,
      isSubmitting: isSubmitting,
      authFailureOrSuccess: authFailureOrSuccess,
    );
  }
}

/// @nodoc
const $ForgottenPasswordState = _$ForgottenPasswordStateTearOff();

/// @nodoc
mixin _$ForgottenPasswordState {
  EmailAddress get emailAddress => throw _privateConstructorUsedError;
  AutovalidateMode get showErrorMessages => throw _privateConstructorUsedError;
  bool get isSubmitting => throw _privateConstructorUsedError;
  Option<Either<AuthServiceError, Unit>> get authFailureOrSuccess =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ForgottenPasswordStateCopyWith<ForgottenPasswordState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ForgottenPasswordStateCopyWith<$Res> {
  factory $ForgottenPasswordStateCopyWith(ForgottenPasswordState value,
          $Res Function(ForgottenPasswordState) then) =
      _$ForgottenPasswordStateCopyWithImpl<$Res>;
  $Res call(
      {EmailAddress emailAddress,
      AutovalidateMode showErrorMessages,
      bool isSubmitting,
      Option<Either<AuthServiceError, Unit>> authFailureOrSuccess});
}

/// @nodoc
class _$ForgottenPasswordStateCopyWithImpl<$Res>
    implements $ForgottenPasswordStateCopyWith<$Res> {
  _$ForgottenPasswordStateCopyWithImpl(this._value, this._then);

  final ForgottenPasswordState _value;
  // ignore: unused_field
  final $Res Function(ForgottenPasswordState) _then;

  @override
  $Res call({
    Object? emailAddress = freezed,
    Object? showErrorMessages = freezed,
    Object? isSubmitting = freezed,
    Object? authFailureOrSuccess = freezed,
  }) {
    return _then(_value.copyWith(
      emailAddress: emailAddress == freezed
          ? _value.emailAddress
          : emailAddress // ignore: cast_nullable_to_non_nullable
              as EmailAddress,
      showErrorMessages: showErrorMessages == freezed
          ? _value.showErrorMessages
          : showErrorMessages // ignore: cast_nullable_to_non_nullable
              as AutovalidateMode,
      isSubmitting: isSubmitting == freezed
          ? _value.isSubmitting
          : isSubmitting // ignore: cast_nullable_to_non_nullable
              as bool,
      authFailureOrSuccess: authFailureOrSuccess == freezed
          ? _value.authFailureOrSuccess
          : authFailureOrSuccess // ignore: cast_nullable_to_non_nullable
              as Option<Either<AuthServiceError, Unit>>,
    ));
  }
}

/// @nodoc
abstract class _$ForgottenPasswordStateCopyWith<$Res>
    implements $ForgottenPasswordStateCopyWith<$Res> {
  factory _$ForgottenPasswordStateCopyWith(_ForgottenPasswordState value,
          $Res Function(_ForgottenPasswordState) then) =
      __$ForgottenPasswordStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {EmailAddress emailAddress,
      AutovalidateMode showErrorMessages,
      bool isSubmitting,
      Option<Either<AuthServiceError, Unit>> authFailureOrSuccess});
}

/// @nodoc
class __$ForgottenPasswordStateCopyWithImpl<$Res>
    extends _$ForgottenPasswordStateCopyWithImpl<$Res>
    implements _$ForgottenPasswordStateCopyWith<$Res> {
  __$ForgottenPasswordStateCopyWithImpl(_ForgottenPasswordState _value,
      $Res Function(_ForgottenPasswordState) _then)
      : super(_value, (v) => _then(v as _ForgottenPasswordState));

  @override
  _ForgottenPasswordState get _value => super._value as _ForgottenPasswordState;

  @override
  $Res call({
    Object? emailAddress = freezed,
    Object? showErrorMessages = freezed,
    Object? isSubmitting = freezed,
    Object? authFailureOrSuccess = freezed,
  }) {
    return _then(_ForgottenPasswordState(
      emailAddress: emailAddress == freezed
          ? _value.emailAddress
          : emailAddress // ignore: cast_nullable_to_non_nullable
              as EmailAddress,
      showErrorMessages: showErrorMessages == freezed
          ? _value.showErrorMessages
          : showErrorMessages // ignore: cast_nullable_to_non_nullable
              as AutovalidateMode,
      isSubmitting: isSubmitting == freezed
          ? _value.isSubmitting
          : isSubmitting // ignore: cast_nullable_to_non_nullable
              as bool,
      authFailureOrSuccess: authFailureOrSuccess == freezed
          ? _value.authFailureOrSuccess
          : authFailureOrSuccess // ignore: cast_nullable_to_non_nullable
              as Option<Either<AuthServiceError, Unit>>,
    ));
  }
}

/// @nodoc
class _$_ForgottenPasswordState implements _ForgottenPasswordState {
  const _$_ForgottenPasswordState(
      {required this.emailAddress,
      required this.showErrorMessages,
      required this.isSubmitting,
      required this.authFailureOrSuccess});

  @override
  final EmailAddress emailAddress;
  @override
  final AutovalidateMode showErrorMessages;
  @override
  final bool isSubmitting;
  @override
  final Option<Either<AuthServiceError, Unit>> authFailureOrSuccess;

  @override
  String toString() {
    return 'ForgottenPasswordState(emailAddress: $emailAddress, showErrorMessages: $showErrorMessages, isSubmitting: $isSubmitting, authFailureOrSuccess: $authFailureOrSuccess)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _ForgottenPasswordState &&
            (identical(other.emailAddress, emailAddress) ||
                const DeepCollectionEquality()
                    .equals(other.emailAddress, emailAddress)) &&
            (identical(other.showErrorMessages, showErrorMessages) ||
                const DeepCollectionEquality()
                    .equals(other.showErrorMessages, showErrorMessages)) &&
            (identical(other.isSubmitting, isSubmitting) ||
                const DeepCollectionEquality()
                    .equals(other.isSubmitting, isSubmitting)) &&
            (identical(other.authFailureOrSuccess, authFailureOrSuccess) ||
                const DeepCollectionEquality()
                    .equals(other.authFailureOrSuccess, authFailureOrSuccess)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(emailAddress) ^
      const DeepCollectionEquality().hash(showErrorMessages) ^
      const DeepCollectionEquality().hash(isSubmitting) ^
      const DeepCollectionEquality().hash(authFailureOrSuccess);

  @JsonKey(ignore: true)
  @override
  _$ForgottenPasswordStateCopyWith<_ForgottenPasswordState> get copyWith =>
      __$ForgottenPasswordStateCopyWithImpl<_ForgottenPasswordState>(
          this, _$identity);
}

abstract class _ForgottenPasswordState implements ForgottenPasswordState {
  const factory _ForgottenPasswordState(
      {required EmailAddress emailAddress,
      required AutovalidateMode showErrorMessages,
      required bool isSubmitting,
      required Option<Either<AuthServiceError, Unit>>
          authFailureOrSuccess}) = _$_ForgottenPasswordState;

  @override
  EmailAddress get emailAddress => throw _privateConstructorUsedError;
  @override
  AutovalidateMode get showErrorMessages => throw _privateConstructorUsedError;
  @override
  bool get isSubmitting => throw _privateConstructorUsedError;
  @override
  Option<Either<AuthServiceError, Unit>> get authFailureOrSuccess =>
      throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$ForgottenPasswordStateCopyWith<_ForgottenPasswordState> get copyWith =>
      throw _privateConstructorUsedError;
}
