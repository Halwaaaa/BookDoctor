import 'package:bookdoctor/core/componted/DafultBoutton.dart';
import 'package:bookdoctor/core/componted/DafultTextFormFiled.dart';
import 'package:bookdoctor/core/constant/config.dart';
import 'package:bookdoctor/core/utles/constant.dart';
import 'package:bookdoctor/featuers/Auth/persenation/controol/RiveControll.dart';
import 'package:bookdoctor/featuers/Auth/persenation/controol/singControl.dart';
import 'package:bookdoctor/featuers/Auth/persenation/widget/AppBarSing.dart';
import 'package:bookdoctor/featuers/Auth/persenation/widget/HelloText.dart';
import 'package:bookdoctor/featuers/Auth/persenation/widget/TextDivider.dart';
import 'package:bookdoctor/featuers/Auth/persenation/widget/customInformationSing.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';

class SingView extends StatefulWidget {
  const SingView({Key? key}) : super(key: key);

  @override
  State<SingView> createState() => _SingViewState();
}

class _SingViewState extends State<SingView>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<Alignment> AlignAnimation;
  late Animation<double> doubleAnimation;
  late Animation<Icon> IconDataAnimation;
  @override
  void initState() {
    InitAnimatedAlign();
    // TODO: implement initState
    super.initState();
  }

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
                  const HelloText(),
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
                          TextSecand: 'سجل دخول'),
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
                    return Container(
                      height: MediaQuery.sizeOf(context).height,
                      width: MediaQuery.sizeOf(context).height,
                      color: Colors.white.withOpacity(0.4),
                    );
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

  void InitAnimatedAlign() {
    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );
    final curvedAnimation = CurvedAnimation(
      parent: controller,
      curve: Curves.easeOutBack, // يمكنك تعديل هذا المنحنى حسب الحاجة
    );
    AlignAnimation = AlignmentTween(
      begin: Alignment.bottomRight,
      end: Alignment.bottomLeft,
    ).animate(curvedAnimation);
    doubleAnimation = Tween<double>(begin: 0, end: 1).animate(curvedAnimation);
  }
}
