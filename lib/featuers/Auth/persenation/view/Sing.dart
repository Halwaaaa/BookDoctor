import 'package:bookdoctor/core/componted/DafultBoutton.dart';
import 'package:bookdoctor/core/componted/DafultTextFormFiled.dart';
import 'package:bookdoctor/core/constant/config.dart';
import 'package:bookdoctor/featuers/Auth/persenation/controol/singControl.dart';
import 'package:bookdoctor/featuers/Auth/persenation/widget/AppBarSing.dart';
import 'package:bookdoctor/featuers/Auth/persenation/widget/HelloText.dart';
import 'package:bookdoctor/featuers/Auth/persenation/widget/customInformationSing.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SingView extends StatelessWidget {
  const SingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ContrrolSing contrrolSing = Get.find();
    Config config = Config();

    //  print()
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 40,
            ),
            const AppBarSing(),
            const HelloText(),
            const SizedBox(
              height: 40,
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Form(
                //key: cubit.keyform,
                child: CustaminformaionAccount(config: config),
              ),
            ),
            Boutton(
              hieght: 50,
              wdith: 150,
              isLoding: false,
              titil: "سجل",
              ontap: () {
                contrrolSing.CreateAccout();
                // cubit.TapSin(context);
              },
            ),
            const SizedBox(
              height: 40,
            )
          ],
        ),
      ),
    );
  }
}
