import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_firebase_setup/app/auth/sign_in/sign_in_bloc.dart';
import 'package:flutter_firebase_setup/pages/auth/forgotten_password/forgotten_password_scaffold.dart';
import 'package:flutter_firebase_setup/pages/auth/shared/form_widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class SignInImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(24, 0, 24, 0),
      child: SvgPicture.asset(
        "assets/images/login_green.svg",
        height: MediaQuery.of(context).size.height * 0.35,
      ),
    );
  }
}

class SignInEmailField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return EmailField(
      onChanged: (value) =>
          context.read<SignInBloc>().add(SignInEvent.emailChanged(value)),
      validator: (value) =>
          context.read<SignInBloc>().state.signInModel.email.value.fold(
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

class SignInPasswordField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignInBloc, SignInState>(
        buildWhen: (prev, curr) => prev.isObscure != curr.isObscure,
        builder: (context, state) {
          return PasswordField(
            isObscure: state.isObscure,
            onPressed: () {
              context
                  .read<SignInBloc>()
                  .add(SignInEvent.obscureChanged(!state.isObscure));
            },
            onChanged: (value) => context
                .read<SignInBloc>()
                .add(SignInEvent.passwordChanged(value)),
            validator: (_) => context
                .read<SignInBloc>()
                .state
                .signInModel
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

class ForgottenPassword extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 0, 0, 8),
      child: SizedBox(
        width: double.infinity,
        child: GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ForgottenPasswordScaffold()));
          },
          child: Text(
            'Forgotten Password?',
            style: TextStyle(
              color: Theme.of(context).brightness == Brightness.light
                  ? Colors.grey[700]
                  : Colors.white,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.left,
          ),
        ),
      ),
    );
  }
}

class LoginButton extends StatelessWidget {
  final bool isSubmitting;

  const LoginButton({Key? key, required this.isSubmitting}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AuthButton(
        onPressed: () {
          context.read<SignInBloc>().add(
                const SignInEvent.signInEmailAndPasswordPressed(),
              );
        },
        buttonText: isSubmitting ? 'Logging in...' : 'Login');
  }
}

class OrDivider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 12),
      width: MediaQuery.of(context).size.width * 0.8,
      child: Row(
        children: <Widget>[
          Expanded(
            child: Divider(
              color: Theme.of(context).brightness == Brightness.light
                  ? Colors.grey[700]
                  : Colors.white,
              height: 1.5,
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              "OR",
              style: TextStyle(
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Expanded(
            child: Divider(
              color: Theme.of(context).brightness == Brightness.light
                  ? Colors.grey[700]
                  : Colors.white,
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }
}

class GoogleSignInButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor: Theme.of(context).brightness == Brightness.light
            ? MaterialStateProperty.all(Colors.white)
            : MaterialStateProperty.all(Color(0xFFF4285F4)),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(40),
          ),
        ),
      ),
      onPressed: () {
        context.read<SignInBloc>().add(
              const SignInEvent.signInWithGoogle(),
            );
      },
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ClipOval(
              child: Image(
                image: AssetImage("assets/images/google_icon.png"),
                height: 22.0,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16),
              child: Text(
                'Sign in with Google',
                style: GoogleFonts.roboto(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  color: Theme.of(context).brightness == Brightness.light
                      ? Colors.grey[600]
                      : Colors.white,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
