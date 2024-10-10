import 'package:bookdoctor/core/componted/DafultTextFormFiled.dart';
import 'package:bookdoctor/core/constant/config.dart';
import 'package:flutter/material.dart';

class itemInformation extends StatelessWidget {
  const itemInformation({
    super.key,
    required this.config,
  });

  final Config config;

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
            //controller: cubit.NameControol,
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
            //controller: cubit.PasswordControol,
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
