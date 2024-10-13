import 'package:bookdoctor/core/componted/DafultTextFormFiled.dart';
import 'package:bookdoctor/core/constant/config.dart';
import 'package:bookdoctor/featuers/Auth/persenation/controol/singControl.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class itemInformation1 extends StatefulWidget {
  const itemInformation1({
    super.key,
    required this.config,
    required,
  });

  final Config config;

  @override
  State<itemInformation1> createState() => _itemInformationState();
}

class _itemInformationState extends State<itemInformation1>
    with SingleTickerProviderStateMixin {
  SingContrrol contrrolSing = Get.find();

  @override
  void initState() {
    // TODO: implement initState
    AnimatedInit();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: contrrolSing.keyForm1,
      child: Column(
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
              controller: contrrolSing.NameController,
              title: "الاسم ",
              validator: widget.config.validator,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Flexible(
            child: DafulteTextForm(
              //controller: cubit.phoneControol,
              title: "الهاتف",
              validator: (f) {
                if (f!.isEmpty) {
                  return "الحقل مطلوب";
                } else if (double.tryParse(f) == null) {
                  return 'الرجاء ادخال رقم صالح';
                }
                return null;
              },
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Flexible(
            child: DafulteTextForm(
              controller: contrrolSing.partController,
              title: "الاختصاص",
              validator: widget.config.validator,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }

  void AnimatedInit() {}
}
