import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_firebase_setup/app/auth/sign_up/sign_up_bloc.dart';
import 'package:flutter_firebase_setup/pages/auth/shared/form_widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SignUpImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(24, 0, 24, 0),
      child: SvgPicture.asset(
        "assets/images/register_green.svg",
        height: MediaQuery.of(context).size.height * 0.35,
      ),
    );
  }
}

class SignUpEmailField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return EmailField(
      onChanged: (value) =>
          context.read<SignUpBloc>().add(SignUpEvent.emailChanged(value)),
      validator: (_) =>
          context.read<SignUpBloc>().state.signUpModel.email.value.fold(
                (failure) => failure.maybeMap(
                  auth: (value) => value.f.maybeMap(
                    invalidEmail: (_) => 'Invalid Email Address',
                    orElse: () => null,
                  ),
                  orElse: () => null,
                ),
                (_) => null,
              ),
    );
  }
}

class SignUpPasswordField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignUpBloc, SignUpState>(
        buildWhen: (prev, curr) => prev.isObscure != curr.isObscure,
        builder: (context, state) {
          return PasswordField(
            isObscure: state.isObscure,
            onPressed: () {
              context
                  .read<SignUpBloc>()
                  .add(SignUpEvent.obscureChanged(!state.isObscure));
            },
            onChanged: (value) => context
                .read<SignUpBloc>()
                .add(SignUpEvent.passwordChanged(value)),
            validator: (_) => context
                .read<SignUpBloc>()
                .state
                .signUpModel
                .password
                .value
                .fold(
                  (failure) => failure.maybeMap(
                    auth: (value) => value.f.maybeMap(
                      invalidPassword: (_) => 'Invalid Password',
                      orElse: () => null,
                    ),
                    orElse: () => null,
                  ),
                  (_) => null,
                ),
          );
        });
  }
}

class RegisterButton extends StatelessWidget {
  final bool isSubmitting;

  const RegisterButton({Key? key, required this.isSubmitting})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AuthButton(
        onPressed: () {
          context.read<SignUpBloc>().add(
                const SignUpEvent.signUpEmailAndPasswordPressed(),
              );
        },
        buttonText: isSubmitting ? 'Registering...' : 'Register');
  }
}
