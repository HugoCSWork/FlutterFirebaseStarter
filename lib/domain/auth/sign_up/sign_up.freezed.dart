// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'sign_up.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$SignUpModelTearOff {
  const _$SignUpModelTearOff();

  _SignUpModel call({required EmailAddress email, required Password password}) {
    return _SignUpModel(
      email: email,
      password: password,
    );
  }
}

/// @nodoc
const $SignUpModel = _$SignUpModelTearOff();

/// @nodoc
mixin _$SignUpModel {
  EmailAddress get email => throw _privateConstructorUsedError;
  Password get password => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SignUpModelCopyWith<SignUpModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SignUpModelCopyWith<$Res> {
  factory $SignUpModelCopyWith(
          SignUpModel value, $Res Function(SignUpModel) then) =
      _$SignUpModelCopyWithImpl<$Res>;
  $Res call({EmailAddress email, Password password});
}

/// @nodoc
class _$SignUpModelCopyWithImpl<$Res> implements $SignUpModelCopyWith<$Res> {
  _$SignUpModelCopyWithImpl(this._value, this._then);

  final SignUpModel _value;
  // ignore: unused_field
  final $Res Function(SignUpModel) _then;

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
abstract class _$SignUpModelCopyWith<$Res>
    implements $SignUpModelCopyWith<$Res> {
  factory _$SignUpModelCopyWith(
          _SignUpModel value, $Res Function(_SignUpModel) then) =
      __$SignUpModelCopyWithImpl<$Res>;
  @override
  $Res call({EmailAddress email, Password password});
}

/// @nodoc
class __$SignUpModelCopyWithImpl<$Res> extends _$SignUpModelCopyWithImpl<$Res>
    implements _$SignUpModelCopyWith<$Res> {
  __$SignUpModelCopyWithImpl(
      _SignUpModel _value, $Res Function(_SignUpModel) _then)
      : super(_value, (v) => _then(v as _SignUpModel));

  @override
  _SignUpModel get _value => super._value as _SignUpModel;

  @override
  $Res call({
    Object? email = freezed,
    Object? password = freezed,
  }) {
    return _then(_SignUpModel(
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
class _$_SignUpModel extends _SignUpModel {
  const _$_SignUpModel({required this.email, required this.password})
      : super._();

  @override
  final EmailAddress email;
  @override
  final Password password;

  @override
  String toString() {
    return 'SignUpModel(email: $email, password: $password)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _SignUpModel &&
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
  _$SignUpModelCopyWith<_SignUpModel> get copyWith =>
      __$SignUpModelCopyWithImpl<_SignUpModel>(this, _$identity);
}

abstract class _SignUpModel extends SignUpModel {
  const factory _SignUpModel(
      {required EmailAddress email,
      required Password password}) = _$_SignUpModel;
  const _SignUpModel._() : super._();

  @override
  EmailAddress get email => throw _privateConstructorUsedError;
  @override
  Password get password => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$SignUpModelCopyWith<_SignUpModel> get copyWith =>
      throw _privateConstructorUsedError;
}
