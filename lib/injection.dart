import 'package:flutter_firebase_setup/injection.config.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';


final GetIt getIt = GetIt.instance;

@injectableInit
void configureInjection(String env) {
  $initGetIt(getIt, environment: env);
}

abstract class Env {
  static const dev = 'dev';
  static const prod = 'prod';
}