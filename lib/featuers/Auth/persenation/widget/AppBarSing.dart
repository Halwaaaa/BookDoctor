import 'package:bookdoctor/core/utles/AssetImages.dart';
import 'package:bookdoctor/featuers/Auth/persenation/controol/RiveControll.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rive/rive.dart';

class AppBarSing extends StatelessWidget {
  const AppBarSing({super.key});

  @override
  Widget build(BuildContext context) {
    RiveControll riveControll = Get.find();
    return Stack(
      alignment: Alignment.center,
      children: [
        SizedBox(
          height: 100,
          child: GetBuilder<RiveControll>(builder: (controll) {
            print("object");
            return RiveAnimation.asset(
              //  fit: BoxFit.cover,
              AssestImages.Dlogin,
              artboard: 'Login',
              onInit: (artboard) {
                controll.onInitRive(artboard);
              },
            );
          }),
        ),
      ],
    );
  }
}
