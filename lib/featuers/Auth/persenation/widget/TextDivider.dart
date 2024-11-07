import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
<<<<<<< HEAD
import 'package:get/get.dart';

class TextAuth extends StatelessWidget {
  TextAuth({
=======

class TextAuth extends StatelessWidget {
  const TextAuth({
>>>>>>> Auth
    super.key,
    required this.isdark,
    required this.TextFirst,
    required this.TextSecand,
    this.onEnter,
  });
  final bool isdark;
  final String TextFirst;
  final String TextSecand;
<<<<<<< HEAD
  Function()? onEnter;
=======
  final Function()? onEnter;
>>>>>>> Auth

  @override
  Widget build(BuildContext context) {
    return IntrinsicWidth(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        // mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              // width: double.infinity,
              child: Text.rich(TextSpan(
                  text: TextFirst,
                  style: TextStyle(
                      color: isdark
                          ? const Color.fromRGBO(243, 233, 245, 1)
                          : Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.w700),
                  children: [
                    TextSpan(
                      // onEnter: onEnter,

                      text: TextSecand,
                      style: const TextStyle(
                        color: Color.fromRGBO(60, 35, 103, 1),
                      ),
                      recognizer: TapGestureRecognizer()..onTap = onEnter,
                    )
                  ])),
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          const Expanded(
              child: Divider(
            thickness: 1,
            color: Colors.black,
          ))
        ],
      ),
    );
  }
}
