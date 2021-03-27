import 'package:flutter/material.dart';
import 'package:flutter_firebase_setup/pages/auth/sign_in/sign_in_scaffold.dart';
import 'package:flutter_firebase_setup/pages/auth/sign_up/sign_up_scaffold.dart';
import 'package:flutter_firebase_setup/pages/shared/text_form_field.dart';

class EmailField extends StatelessWidget {
  final Function(String) onChanged;
  final String? Function(dynamic) validator;

  const EmailField({Key? key, required this.onChanged, required this.validator})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextFormInput(
        labelText: 'Email',
        icon: Icon(Icons.email),
        onChanged: onChanged,
        validator: validator,
        textInputAction: TextInputAction.next,
      ),
    );
  }
}

class PasswordField extends StatelessWidget {
  final Function(String) onChanged;
  final String? Function(dynamic) validator;
  final bool isObscure;
  final Function() onPressed;
  const PasswordField(
      {Key? key,
      required this.onChanged,
      required this.validator,
      required this.isObscure,
      required this.onPressed})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextFormInput(
          labelText: 'Password',
          icon: Icon(Icons.lock),
          obscureText: isObscure,
          onChanged: onChanged,
          suffixButton: IconButton(
              icon: isObscure
                  ? Icon(Icons.visibility_off)
                  : Icon(Icons.visibility),
              onPressed: onPressed),
          validator: validator),
    );
  }
}

class AlreadyHaveAnAccountCheck extends StatelessWidget {
  final bool login;
  const AlreadyHaveAnAccountCheck({
    Key? key,
    this.login = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            login ? "Don’t have an Account? " : "Already have an Account? ",
            style: TextStyle(
                color: Theme.of(context).brightness == Brightness.light
                    ? Colors.grey[700]
                    : Colors.white),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          login ? SignUpScaffold() : SignInScaffold()));
            },
            child: Text(
              login ? "Sign Up" : "Sign In",
              style: TextStyle(
                color: Theme.of(context).brightness == Brightness.light
                    ? Colors.grey[800]
                    : Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          )
        ],
      ),
    );
  }
}

class AuthButton extends StatelessWidget {
  final Function() onPressed;
  final String buttonText;
  const AuthButton(
      {Key? key, required this.onPressed, required this.buttonText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 18),
      width: size.width * 0.8,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(29),
        child: TextButton(
          style: ButtonStyle(
            padding: MaterialStateProperty.all(
                const EdgeInsets.symmetric(vertical: 20, horizontal: 40)),
          ),
          onPressed: onPressed,
          child: Text(
            buttonText,
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
