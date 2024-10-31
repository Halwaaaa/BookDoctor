import 'package:bookdoctor/core/componted/DafiltAwssdailog.dart';
import 'package:bookdoctor/core/componted/DafultTextFormFiled.dart';
import 'package:bookdoctor/core/constant/config.dart';
import 'package:bookdoctor/core/servers/permsionFilesServers.dart';
import 'package:bookdoctor/featuers/Auth/persenation/controol/RiveControll.dart';
import 'package:bookdoctor/featuers/Auth/persenation/controol/singControl.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:get/get_core/src/get_main.dart';

class itemInformation2 extends StatefulWidget {
  const itemInformation2({
    super.key,
    required this.config,
    required,
  });

  final Config config;

  @override
  State<itemInformation2> createState() => _itemInformationState();
}

class _itemInformationState extends State<itemInformation2>
    with SingleTickerProviderStateMixin {
  SingContrrol contrrolSing = Get.find();
  RiveControll riveControll = Get.find();

  @override
  void initState() {
    // TODO: implement initState
    AnimatedInit();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: contrrolSing.keyForm2,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          DafulteTextForm(
            controller: contrrolSing.emailControol,
            OnFouc: () {
              riveControll.isFocus!.value = true;
            },
            NotFouc: () {
              riveControll.isFocus!.value = false;
            },
            title: "البريد الكتروني",
            validator: (password) {
              if (password!.isEmpty) {
                return "الحقل مطلوب";
              }
              if (!password.isEmail) {
                return "الحقل المطلوب ايميل";
              }
              return null;
            },
          ),
          const SizedBox(
            height: 20,
          ),
          DafulteTextForm(
            controller: contrrolSing.passWordControol,
            title: "كلمة السر",
            onTap: () {},
            OnFouc: () {
              riveControll.IsPassword?.value = true;
            },
            NotFouc: () {
              riveControll.IsPassword?.change(false);
            },
            validator: widget.config.validator,
          ),
          const SizedBox(
            height: 20,
          ),
          DafulteTextForm(
            controller: contrrolSing.REpassWordControol,
            title: "اعادة كلمة السر ",
            onTap: () {},
            OnFouc: () {
              riveControll.IsPassword?.value = true;
            },
            NotFouc: () {
              riveControll.IsPassword?.change(false);
            },
            validator: (ERpassword) {
              if (ERpassword!.isEmpty) {
                return "الحقل مطلوب";
              }

              if (ERpassword.toString() != contrrolSing.passWordControol.text) {
                return 'يجب تتطابق كلمة السر ';
              }
              return null;
            },
          ),
          const SizedBox(
            height: 20,
          ),
          GetBuilder<SingContrrol>(
            builder: (controller) {
              return Visibility(
                visible: controller.index != 0 ? false : true,
                child: IconButton(
                    alignment: AlignmentDirectional.topStart,
                    onPressed: () {
                      controller.ControolAnimatedAlign(riveControll, context);
                    },
                    icon: const Icon(Icons.arrow_right)),
              );
            },
          )
        ],
      ),
    );
  }

  void AnimatedInit() {}
}
