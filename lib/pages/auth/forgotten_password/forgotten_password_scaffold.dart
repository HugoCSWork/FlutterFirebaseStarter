import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_firebase_setup/app/auth/forgotten_password/forgotten_password_bloc.dart';
import 'package:flutter_firebase_setup/injection.dart';
import 'package:flutter_firebase_setup/pages/auth/forgotten_password/forgotten_password_form.dart';

class ForgottenPasswordScaffold extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => getIt<ForgottenPasswordBloc>(),
        child: ForgottenPasswordForm());
  }
}
