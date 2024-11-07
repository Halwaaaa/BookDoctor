import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class TextForgtPassword extends StatelessWidget {
  const TextForgtPassword({
    super.key,
    this.onTap,
  });

  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
          recognizer: TapGestureRecognizer()..onTap = onTap,
          text: "هل نسيت كلمة السر",
          style: const TextStyle(
            fontSize: 10,
            color: Color.fromRGBO(255, 0, 0, 1),
          ),
          children: const []),
    );
  }
}
