import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_firebase_setup/app/auth/forgotten_password/forgotten_password_bloc.dart';
import 'package:flutter_firebase_setup/pages/auth/shared/form_widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ForgottenPasswordImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(24, 0, 24, 16),
      child: SvgPicture.asset(
        "assets/images/lost_green.svg",
        height: MediaQuery.of(context).size.height * 0.35,
      ),
    );
  }
}

class ForgottenPasswordEmailField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return EmailField(
      onChanged: (value) => context
          .read<ForgottenPasswordBloc>()
          .add(ForgottenPasswordEvent.emailChanged(value)),
      validator: (value) =>
          context.read<ForgottenPasswordBloc>().state.emailAddress.value.fold(
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

class ForgottenPasswordButton extends StatelessWidget {
  final bool isSubmitting;

  const ForgottenPasswordButton({Key? key, required this.isSubmitting})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      width: size.width * 0.8,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(29),
        child: TextButton(
          style: ButtonStyle(
            padding: MaterialStateProperty.all(
                const EdgeInsets.symmetric(vertical: 20, horizontal: 40)),
          ),
          onPressed: () {
            context.read<ForgottenPasswordBloc>().add(
                  const ForgottenPasswordEvent.passwordReset(),
                );
          },
          child: Text(
            isSubmitting ? 'Sending...' : 'Send',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
