import 'package:bookdoctor/core/componted/DafultTextFormFiled.dart';
import 'package:bookdoctor/core/constant/config.dart';
import 'package:bookdoctor/featuers/Auth/persenation/controol/singControl.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class itemInformation extends StatelessWidget {
  itemInformation({
    super.key,
    required this.config,
    required,
  });

  final Config config;
  ContrrolSing contrrolSing = Get.find();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
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
            title: "الاسم ",
            validator: config.validator,
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
            controller: contrrolSing.passWordControol,
            title: "كلمة السر ",
            validator: config.validator,
          ),
        ),
        const SizedBox(
          height: 20,
        ),

        IconButton(onPressed: () {}, icon: const Icon(Icons.arrow_left))
      ],
    );
  }
}
