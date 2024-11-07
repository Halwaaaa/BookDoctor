import 'package:bookdoctor/core/componted/DafultTextFormFiled.dart';
import 'package:bookdoctor/featuers/Auth/persenation/controol/RiveControll.dart';
import 'package:bookdoctor/featuers/Auth/persenation/controol/loginControll.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TextFormFiledOfLogin extends StatelessWidget {
  const TextFormFiledOfLogin({
    super.key,
    required this.loginControll,
    required this.riveControll,
  });

  final LoginControll loginControll;
  final RiveControll riveControll;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: loginControll.KeyFormLogin,
      child: Column(
        children: [
          DafulteTextForm(
            controller: loginControll.emailControll,
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
            controller: loginControll.passwordControll,
            title: "كلمة السر",
            onTap: () {},
            OnFouc: () {
              riveControll.IsPassword?.value = true;
            },
            NotFouc: () {
              riveControll.IsPassword?.change(false);
            },
            validator: loginControll.config.validator,
          ),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
