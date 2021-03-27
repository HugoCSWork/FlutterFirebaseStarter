import 'package:another_flushbar/flushbar_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_firebase_setup/app/auth/sign_up/sign_up_bloc.dart';
import 'package:flutter_firebase_setup/pages/auth/shared/form_widgets.dart';
import 'package:flutter_firebase_setup/pages/auth/sign_up/widgets/sign_up_widgets.dart';
import 'package:flutter_firebase_setup/pages/home/homepage.dart';
import 'package:flutter_firebase_setup/pages/shared/loading_in_progress.dart';

class SignUpForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignUpBloc, SignUpState>(listener: (context, state) {
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
    }, builder: (context, state) {
      return Stack(
        children: [
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
                        SignUpImage(),
                        SignUpEmailField(),
                        SignUpPasswordField(),
                        RegisterButton(isSubmitting: state.isSubmitting),
                        AlreadyHaveAnAccountCheck(login: false),
                        SizedBox(height: 16)
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          LoadingInProgress(isSaving: state.isSubmitting),
        ],
      );
    });
  }
}
