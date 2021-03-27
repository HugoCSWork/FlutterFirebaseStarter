import 'package:another_flushbar/flushbar_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_firebase_setup/app/auth/sign_in/sign_in_bloc.dart';
import 'package:flutter_firebase_setup/pages/auth/shared/form_widgets.dart';
import 'package:flutter_firebase_setup/pages/auth/sign_in/widgets/sign_in_widgets.dart';
import 'package:flutter_firebase_setup/pages/home/homepage.dart';
import 'package:flutter_firebase_setup/pages/shared/loading_in_progress.dart';

class SignInForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignInBloc, SignInState>(
      listener: (context, state) {
        state.authFailureOrSuccess.fold(
            () {},
            (either) => either.fold(
                    (error) => {
                          FlushbarHelper.createError(
                              message: error.map(
                                  cancelledByUser: (_) => 'Cancelled by User',
                                  serviceError: (_) => 'Error with Service',
                                  emailAlreadyInUse: (_) =>
                                      'Email already in use',
                                  invalidEmailAndPassword: (_) =>
                                      'Invalid email and password combination',
                                  unexpected: (_) =>
                                      'Unexpected error, contact support')).show(
                              context),
                        }, (_) async {
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => HomePage()),
                      (Route<dynamic> route) => false);
                }));
      },
      builder: (context, state) {
        return Stack(children: <Widget>[
          SafeArea(
            child: Form(
              autovalidateMode: state.showErrorMessages,
              child: Center(
                child: SingleChildScrollView(
                  child: AbsorbPointer(
                    absorbing: state.isSubmitting,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        SignInImage(),
                        SignInEmailField(),
                        SignInPasswordField(),
                        ForgottenPassword(),
                        LoginButton(isSubmitting: state.isSubmitting),
                        OrDivider(),
                        GoogleSignInButton(),
                        AlreadyHaveAnAccountCheck(),
                        SizedBox(height: 16)
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          LoadingInProgress(isSaving: state.isSubmitting),
        ]);
      },
    );
  }
}

class SubmitButton extends StatelessWidget {
  const SubmitButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: () {
          context.read<SignInBloc>().add(
                const SignInEvent.signInEmailAndPasswordPressed(),
              );
        },
        child: const Text("Click Me"));
  }
}
