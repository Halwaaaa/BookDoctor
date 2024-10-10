import 'package:bookdoctor/core/utles/AssetImages.dart';
import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

class AppBarSing extends StatelessWidget {
  const AppBarSing({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        SizedBox(
          height: 100,
          child: RiveAnimation.asset(
            //  fit: BoxFit.cover,
            AssestImages.Dlogin,
          ),
        ),
      ],
    );
  }
}
