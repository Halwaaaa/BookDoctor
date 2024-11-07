import 'package:flutter/material.dart';

class HelloText extends StatelessWidget {
  const HelloText({
    super.key,
<<<<<<< HEAD
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        SizedBox(
          height: 20,
        ),
        Text(
          '!! هياا لنبدأ',
          style: TextStyle(fontSize: 20, fontFamily: 'jannah'),
        ),
        Text(
          'أنشأ حسابك للتواصل مع طبيبك. ',
          style: TextStyle(
              fontSize: 15, fontFamily: 'jannah', color: Color(0xFFb4b4b4)),
        ),
        SizedBox(
=======
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
>>>>>>> Auth
          height: 20,
        ),
      ],
    );
  }
}
