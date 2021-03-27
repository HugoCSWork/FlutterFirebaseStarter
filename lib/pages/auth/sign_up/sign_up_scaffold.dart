import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_firebase_setup/app/auth/sign_up/sign_up_bloc.dart';
import 'package:flutter_firebase_setup/injection.dart';
import 'package:flutter_firebase_setup/pages/auth/sign_up/sign_up_form.dart';

class SignUpScaffold extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => getIt<SignUpBloc>(),
        child: Scaffold(body: SignUpForm()));
  }
}
