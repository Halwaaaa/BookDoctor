import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:bookdoctor/core/constant/config.dart';
import 'package:bookdoctor/featuers/Auth/persenation/controol/singControl.dart';
import 'package:bookdoctor/featuers/Auth/persenation/widget/bobyAwesomeDailog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

AwesomeDialog awesomeDialogview(
  BuildContext context,
) {
  SingContrrol singContrrol = Get.find();
  return AwesomeDialog(
      dismissOnBackKeyPress: false,
      context: context,
      btnOkOnPress: () async {
        await singContrrol.cancelSenedCv().then((value) {
          Get.back();
        });
      },
      btnOkText: "الغاء العملية ",
      body: GetBuilder<SingContrrol>(builder: (contrrol) {
        return bobyAwesomeDailog(
          contrrol: contrrol,
        );
      }));
}
