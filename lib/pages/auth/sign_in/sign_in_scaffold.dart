import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_firebase_setup/app/auth/sign_in/sign_in_bloc.dart';
import 'package:flutter_firebase_setup/injection.dart';
import 'package:flutter_firebase_setup/pages/auth/sign_in/sign_in_form.dart';

class SignInScaffold extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => getIt<SignInBloc>(),
        child: Scaffold(body: SignInForm()));
  }
}
