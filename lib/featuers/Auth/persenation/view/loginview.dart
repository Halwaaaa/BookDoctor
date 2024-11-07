<<<<<<< HEAD
import 'package:flutter/material.dart';

class loginview extends StatelessWidget {
  const loginview({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
=======
import 'package:bookdoctor/core/componted/DafultBoutton.dart';
import 'package:bookdoctor/core/componted/DafultTextFormFiled.dart';
import 'package:bookdoctor/core/constant/config.dart';
import 'package:bookdoctor/core/utles/router.dart';
import 'package:bookdoctor/featuers/Auth/persenation/controol/RiveControll.dart';
import 'package:bookdoctor/featuers/Auth/persenation/controol/loginControll.dart';
import 'package:bookdoctor/featuers/Auth/persenation/widget/AppBarSing.dart';
import 'package:bookdoctor/featuers/Auth/persenation/widget/HelloText.dart';
import 'package:bookdoctor/featuers/Auth/persenation/widget/LodingWidget.dart';
import 'package:bookdoctor/featuers/Auth/persenation/widget/TextDivider.dart';
import 'package:bookdoctor/featuers/Auth/persenation/widget/textForgetPassword.dart';
import 'package:bookdoctor/featuers/Auth/persenation/widget/textFormFiledOfLogin.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Loginview extends StatelessWidget {
  const Loginview({super.key});

  @override
  Widget build(BuildContext context) {
    LoginControll loginControll = Get.find();
    RiveControll riveControll = Get.find();

    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            child: IntrinsicHeight(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  const AppBarSing(),
                  const HelloText(
                    TitleText: '!! اهلا بعودتك',
                    SubTitleText: 'سجل دخولك لحسابك ',
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.symmetric(
                        horizontal: 20, vertical: 20),
                    child: TextFormFiledOfLogin(
                        loginControll: loginControll,
                        riveControll: riveControll),
                  ),

                  const Flexible(
                    child: Padding(
                      padding: EdgeInsets.all(10),
                      child: Center(child: TextForgtPassword()),
                    ),
                  ),
                  Flexible(
                    child: Center(
                      child: TextAuth(
                        TextFirst: 'ليس لديك حساب !',
                        TextSecand: 'انشا جساب',
                        onEnter: () {
                          Get.offAllNamed(Routers.Rsing);
                        },
                        isdark: false,
                      ),
                    ),
                  ),
                  const Expanded(
                    child: SizedBox(
                      height: 30,
                    ),
                  ),

                  GetBuilder<LoginControll>(builder: (controll) {
                    return Center(
                      child: Boutton(
                        hieght: 50,
                        wdith: 150,
                        isLoding: controll.loding,
                        titil: "سجل",
                        ontap: () {
                          controll.loginWithFirebase(context);
                        },
                      ),
                    );
                  }),
                  const Expanded(
                    child: SizedBox(
                      height: 30,
                    ),
                  ),
                  //TextFormFiledOfLogin(),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            child: GetBuilder<LoginControll>(
              builder: (controller) {
                if (controller.loding == true) {
                  return const LodingWidget();
                }

                return const SizedBox.shrink();
              },
            ),
          ),
        ],
      ),
    );
>>>>>>> Auth
  }
}
