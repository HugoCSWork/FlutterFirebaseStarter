// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'sign_in.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$SignInModelTearOff {
  const _$SignInModelTearOff();

  _SignInModel call({required EmailAddress email, required Password password}) {
    return _SignInModel(
      email: email,
      password: password,
    );
  }
}

/// @nodoc
const $SignInModel = _$SignInModelTearOff();

/// @nodoc
mixin _$SignInModel {
  EmailAddress get email => throw _privateConstructorUsedError;
  Password get password => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SignInModelCopyWith<SignInModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SignInModelCopyWith<$Res> {
  factory $SignInModelCopyWith(
          SignInModel value, $Res Function(SignInModel) then) =
      _$SignInModelCopyWithImpl<$Res>;
  $Res call({EmailAddress email, Password password});
}

/// @nodoc
class _$SignInModelCopyWithImpl<$Res> implements $SignInModelCopyWith<$Res> {
  _$SignInModelCopyWithImpl(this._value, this._then);

  final SignInModel _value;
  // ignore: unused_field
  final $Res Function(SignInModel) _then;

  @override
  $Res call({
    Object? email = freezed,
    Object? password = freezed,
  }) {
    return _then(_value.copyWith(
      email: email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as EmailAddress,
      password: password == freezed
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as Password,
    ));
  }
}

/// @nodoc
abstract class _$SignInModelCopyWith<$Res>
    implements $SignInModelCopyWith<$Res> {
  factory _$SignInModelCopyWith(
          _SignInModel value, $Res Function(_SignInModel) then) =
      __$SignInModelCopyWithImpl<$Res>;
  @override
  $Res call({EmailAddress email, Password password});
}

/// @nodoc
class __$SignInModelCopyWithImpl<$Res> extends _$SignInModelCopyWithImpl<$Res>
    implements _$SignInModelCopyWith<$Res> {
  __$SignInModelCopyWithImpl(
      _SignInModel _value, $Res Function(_SignInModel) _then)
      : super(_value, (v) => _then(v as _SignInModel));

  @override
  _SignInModel get _value => super._value as _SignInModel;

  @override
  $Res call({
    Object? email = freezed,
    Object? password = freezed,
  }) {
    return _then(_SignInModel(
      email: email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as EmailAddress,
      password: password == freezed
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as Password,
    ));
  }
}

/// @nodoc
class _$_SignInModel extends _SignInModel {
  const _$_SignInModel({required this.email, required this.password})
      : super._();

  @override
  final EmailAddress email;
  @override
  final Password password;

  @override
  String toString() {
    return 'SignInModel(email: $email, password: $password)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _SignInModel &&
            (identical(other.email, email) ||
                const DeepCollectionEquality().equals(other.email, email)) &&
            (identical(other.password, password) ||
                const DeepCollectionEquality()
                    .equals(other.password, password)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(email) ^
      const DeepCollectionEquality().hash(password);

  @JsonKey(ignore: true)
  @override
  _$SignInModelCopyWith<_SignInModel> get copyWith =>
      __$SignInModelCopyWithImpl<_SignInModel>(this, _$identity);
}

abstract class _SignInModel extends SignInModel {
  const factory _SignInModel(
      {required EmailAddress email,
      required Password password}) = _$_SignInModel;
  const _SignInModel._() : super._();

  @override
  EmailAddress get email => throw _privateConstructorUsedError;
  @override
  Password get password => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$SignInModelCopyWith<_SignInModel> get copyWith =>
      throw _privateConstructorUsedError;
}
