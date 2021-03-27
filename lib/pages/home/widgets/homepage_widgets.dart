import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_firebase_setup/app/auth/auth_bloc.dart';
import 'package:flutter_firebase_setup/pages/auth/shared/form_widgets.dart';
import 'package:flutter_firebase_setup/pages/auth/sign_in/sign_in_scaffold.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomePageImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(24, 0, 24, 0),
      child: SvgPicture.asset(
        "assets/images/home_green.svg",
        height: MediaQuery.of(context).size.height * 0.35,
      ),
    );
  }
}

class LogoutButton extends StatelessWidget {
  final bool isSubmitting;

  const LogoutButton({Key? key, required this.isSubmitting}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AuthButton(
        onPressed: () {
          context.read<AuthBloc>().add(AuthEvent.signOut());
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => SignInScaffold()),
              (Route<dynamic> route) => false);
        },
        buttonText: isSubmitting ? 'Logging out...' : 'Logout');
    // );
  }
}
