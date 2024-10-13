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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        // DafulteTextForm(
        //     //controller: cubit.EmailControol,
        //     title: "البريد الكتروني",
        //     validator: config.validator),
        // const SizedBox(
        //   height: 20,
        // ),
        Flexible(
          child: DafulteTextForm(
            controller: contrrolSing.emailControol,
            title: "البريد الكتروني",
            validator: widget.config.validator,
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Flexible(
          child: DafulteTextForm(
            controller: contrrolSing.passWordControol,
            title: "كلمة السر",
            onTap: () {},
            OnFouc: () {
              riveControll.IsPassword?.change(true);
            },
            NotFouc: () {
              riveControll.IsPassword?.change(false);
            },
            validator: widget.config.validator,
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Flexible(
          child: DafulteTextForm(
            readonly: true,
            onTap: () {
              contrrolSing.getCv(context);
            },
            controller: contrrolSing.cvController,
            title: " cv",
            validator: widget.config.validator,
          ),
        ),
        const SizedBox(
          height: 20,
        ),
      ],
    );
  }

  void AnimatedInit() {}
}
