import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_firebase_setup/app/auth/auth_bloc.dart';
import 'package:flutter_firebase_setup/pages/auth/sign_in/sign_in_scaffold.dart';
import 'package:flutter_firebase_setup/pages/home/homepage.dart';

class SplashPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        state.map(
          initial: (_) {},
          authenticated: (_) {
            return Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => HomePage()),
                (Route<dynamic> route) => false);
          },
          unauthenticated: (_) {
            return Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => SignInScaffold()),
                (Route<dynamic> route) => false);
          },
        );
      },
      child: const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
