import 'package:flutter/material.dart';

class TextFieldContainer extends StatelessWidget {
  final Widget child;

  const TextFieldContainer({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.symmetric(vertical: 10),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        child: child);
  }
}

class TextFormInput extends StatelessWidget {
  final Icon? icon;
  final String labelText;
  final bool autoCorrect;
  final bool roundedBorders;
  final bool obscureText;
  final Function(String) onChanged;
  final String? Function(dynamic) validator;
  final int errorMaxLines;
  final IconButton? suffixButton;
  final TextInputAction? textInputAction;

  const TextFormInput(
      {Key? key,
      this.icon,
      required this.onChanged,
      required this.validator,
      required this.labelText,
      this.obscureText = false,
      this.errorMaxLines = 5,
      this.autoCorrect = false,
      this.roundedBorders = true,
      this.suffixButton = null,
      this.textInputAction = TextInputAction.done})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        decoration: InputDecoration(
            prefixIcon: icon ?? null,
            border: roundedBorders
                ? OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  )
                : null,
            suffixIcon: suffixButton,
            labelText: labelText,
            errorMaxLines: errorMaxLines),
        autocorrect: autoCorrect,
        onChanged: onChanged,
        validator: validator,
        obscureText: obscureText,
        textInputAction: textInputAction,
        onEditingComplete: () => FocusScope.of(context).nextFocus());
  }
}
