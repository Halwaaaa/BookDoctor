import 'package:bookdoctor/core/componted/DafultBoutton.dart';
import 'package:bookdoctor/core/componted/DafultTextFormFiled.dart';
import 'package:bookdoctor/core/constant/config.dart';
import 'package:bookdoctor/core/utles/constant.dart';
import 'package:bookdoctor/featuers/Auth/persenation/controol/singControl.dart';
import 'package:bookdoctor/featuers/Auth/persenation/widget/AppBarSing.dart';
import 'package:bookdoctor/featuers/Auth/persenation/widget/HelloText.dart';
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
                child: CustaminformaionAccount(
                    config: config, singContrrol: contrrolSing),
              ),
            ),
            IconButton(
                onPressed: () {
                  contrrolSing.ControolAnimatedAlign(controller);
                },
                icon: AnimatedBuilder(
                    animation: controller,
                    builder: (context, child) => AlignTransition(
                        alignment: AlignAnimation,
                        child: Icon(contrrolSing.icon)))),
            GetBuilder<SingContrrol>(builder: (con) {
              return Visibility(
                visible: contrrolSing.index == 0 ? false : true,
                //replacement: const Text('lll'),
                child: Boutton(
                  hieght: 50,
                  wdith: 150,
                  isLoding: false,
                  titil: "سجل",
                  ontap: () {
                    contrrolSing.CreateAccout(context);
                    // cubit.TapSin(context);
                  },
                ),
              );
            }),
            const SizedBox(
              height: 40,
            )
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
