// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:firebase_auth/firebase_auth.dart' as _i3;
import 'package:get_it/get_it.dart' as _i1;
import 'package:google_sign_in/google_sign_in.dart' as _i4;
import 'package:injectable/injectable.dart' as _i2;

import 'app/auth/auth_bloc.dart' as _i11;
import 'app/auth/forgotten_password/forgotten_password_bloc.dart' as _i12;
import 'app/auth/sign_in/sign_in_bloc.dart' as _i9;
import 'app/auth/sign_up/sign_up_bloc.dart' as _i10;
import 'domain/auth/i_auth_facade.dart' as _i6;
import 'infrastructure/auth/auth_repository.dart' as _i7;
import 'infrastructure/auth/auth_repository_dev.dart' as _i8;
import 'infrastructure/auth/auth_shared.dart' as _i5;
import 'infrastructure/core/firebase_injectable_module.dart' as _i13;

const String _prod = 'prod';
const String _dev = 'dev';
// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final firebaseInjectableModule = _$FirebaseInjectableModule();
  gh.lazySingleton<_i3.FirebaseAuth>(
      () => firebaseInjectableModule.firebaseAuth);
  gh.lazySingleton<_i4.GoogleSignIn>(
      () => firebaseInjectableModule.googleSignIn);
  gh.factory<_i5.FirebaseAuthHelpers>(() => _i5.FirebaseAuthHelpers(
      get<_i3.FirebaseAuth>(), get<_i4.GoogleSignIn>()));
  gh.lazySingleton<_i6.IAuthFacade>(
      () => _i7.AuthRepository(get<_i5.FirebaseAuthHelpers>()),
      registerFor: {_prod});
  gh.lazySingleton<_i6.IAuthFacade>(
      () => _i8.DevAuthRepository(get<_i5.FirebaseAuthHelpers>()),
      registerFor: {_dev});
  gh.factory<_i9.SignInBloc>(() => _i9.SignInBloc(get<_i6.IAuthFacade>()));
  gh.factory<_i10.SignUpBloc>(() => _i10.SignUpBloc(get<_i6.IAuthFacade>()));
  gh.factory<_i11.AuthBloc>(() => _i11.AuthBloc(get<_i6.IAuthFacade>()));
  gh.factory<_i12.ForgottenPasswordBloc>(
      () => _i12.ForgottenPasswordBloc(get<_i6.IAuthFacade>()));
  return get;
}

class _$FirebaseInjectableModule extends _i13.FirebaseInjectableModule {}
