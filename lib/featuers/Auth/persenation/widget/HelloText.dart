import 'package:flutter/material.dart';

class HelloText extends StatelessWidget {
  const HelloText({
    super.key,
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
          height: 20,
        ),
      ],
    );
  }
}
