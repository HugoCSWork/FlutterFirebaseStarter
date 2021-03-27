import 'package:another_flushbar/flushbar_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_firebase_setup/app/auth/forgotten_password/forgotten_password_bloc.dart';
import 'package:flutter_firebase_setup/pages/auth/forgotten_password/widgets/forgotten_password_widgets.dart';
import 'package:flutter_firebase_setup/pages/shared/loading_in_progress.dart';

class ForgottenPasswordForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ForgottenPasswordBloc, ForgottenPasswordState>(
        listener: (context, state) {
      state.authFailureOrSuccess.fold(
          () {},
          (either) => either.fold(
              (error) => {
                    FlushbarHelper.createError(
                        message: error.map(
                            cancelledByUser: (_) => 'Cancelled by User',
                            serviceError: (_) => 'Error with Service',
                            emailAlreadyInUse: (_) => 'Email already in use',
                            invalidEmailAndPassword: (_) =>
                                'Invalid email and password combination',
                            unexpected: (_) =>
                                'Unexpected error, contact support')).show(
                        context),
                  },
              (_) => FlushbarHelper.createSuccess(
                      message: 'Password reset email has been sent.')
                  .show(context)));
    }, builder: (context, state) {
      return Stack(
        children: <Widget>[
          Scaffold(
              appBar: AppBar(
                centerTitle: true,
                title: Text('Reset Password'),
              ),
              body: SafeArea(
                  child: Form(
                autovalidateMode: state.showErrorMessages,
                child: Center(
                  child: SingleChildScrollView(
                    child: AbsorbPointer(
                      absorbing: state.isSubmitting,
                      child: Column(
                        children: <Widget>[
                          ForgottenPasswordImage(),
                          ForgottenPasswordEmailField(),
                          ForgottenPasswordButton(
                              isSubmitting: state.isSubmitting)
                        ],
                      ),
                    ),
                  ),
                ),
              ))),
          LoadingInProgress(isSaving: state.isSubmitting),
        ],
      );
    });
  }
}
