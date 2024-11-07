import 'package:bookdoctor/core/componted/DafultBoutton.dart';
import 'package:bookdoctor/core/componted/DafultTextFormFiled.dart';
import 'package:bookdoctor/core/constant/config.dart';
import 'package:bookdoctor/core/utles/constant.dart';
import 'package:bookdoctor/core/utles/router.dart';
import 'package:bookdoctor/featuers/Auth/persenation/controol/RiveControll.dart';
import 'package:bookdoctor/featuers/Auth/persenation/controol/singControl.dart';
import 'package:bookdoctor/featuers/Auth/persenation/widget/AppBarSing.dart';
import 'package:bookdoctor/featuers/Auth/persenation/widget/HelloText.dart';
import 'package:bookdoctor/featuers/Auth/persenation/widget/LodingWidget.dart';
import 'package:bookdoctor/featuers/Auth/persenation/widget/TextDivider.dart';
import 'package:bookdoctor/featuers/Auth/persenation/widget/customInformationSing.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';

class SingView extends StatelessWidget {
  const SingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SingContrrol contrrolSing = Get.find();
    RiveControll riveControll = Get.find();

    Config config = Config();

    //  print()
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Stack(
          alignment: AlignmentDirectional.topStart,
          children: [
            IntrinsicHeight(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  const AppBarSing(),
                  const HelloText(
                    TitleText: '!! هياا لنبدأ',
                    SubTitleText: 'أنشأ حسابك للتواصل مع المرضى',
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Form(
                      //key: cubit.keyform,
                      child: CustaminformaionAccount(
                          config: config, singContrrol: contrrolSing),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Flexible(
                    child: Center(
                      child: TextAuth(
                        isdark: false,
                        TextFirst: 'هل لديك حساب بالفعل؟ ',
                        TextSecand: 'سجل دخول',
                        onEnter: () {
                          Get.offAllNamed(Routers.RLogin);
                        },
                      ),
                    ),
                  ),
                  const Flexible(
                    child: SizedBox(
                      height: 20,
                    ),
                  ),
                  GetBuilder<SingContrrol>(builder: (con) {
                    return Visibility(
                      visible: con.index == 0 ? false : true,
                      //replacement: const Text('lll'),
                      child: Center(
                        child: Boutton(
                          hieght: 50,
                          wdith: 150,
                          isLoding: con.Loding,
                          titil: "سجل",
                          ontap: () {
                            contrrolSing.SenedAskToSing(context, riveControll);
                            // cubit.TapSin(context);
                          },
                        ),
                      ),
                    );
                  }),
                  const Expanded(
                    child: SizedBox(
                      height: 20,
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: 0,
              child: GetBuilder<SingContrrol>(
                builder: (controller) {
                  if (contrrolSing.Loding == true) {
                    return const LodingWidget();
                  }

                  return const SizedBox.shrink();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
