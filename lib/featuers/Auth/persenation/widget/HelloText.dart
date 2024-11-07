import 'package:flutter/material.dart';

class HelloText extends StatelessWidget {
  const HelloText({
    super.key,
    required this.TitleText,
    required this.SubTitleText,
  });
  final String TitleText;
  final String SubTitleText;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 20,
        ),
        Text(
          TitleText,
          style: const TextStyle(fontSize: 20, fontFamily: 'jannah'),
        ),
        Text(
          SubTitleText,
          style: const TextStyle(
              fontSize: 15, fontFamily: 'jannah', color: Color(0xFFb4b4b4)),
        ),
        const SizedBox(
          height: 20,
        ),
      ],
    );
  }
}
