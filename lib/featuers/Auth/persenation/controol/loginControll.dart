import 'dart:developer';

import 'package:bookdoctor/core/componted/DafiltAwssdailog.dart';
import 'package:bookdoctor/core/constant/config.dart';
import 'package:bookdoctor/core/errors/faliure.dart';
import 'package:bookdoctor/core/servers/SharedPrefrance.dart';
import 'package:bookdoctor/core/utles/Eumes.dart';
import 'package:bookdoctor/core/utles/Get_it.dart';
import 'package:bookdoctor/core/utles/router.dart';
import 'package:bookdoctor/featuers/Auth/Data/Repoes/LoginRrpoImp.dart';
import 'package:bookdoctor/featuers/Auth/domin/Entitty/LoginEntity.dart';
import 'package:bookdoctor/featuers/Auth/domin/Entitty/checkIfEmailEntity.dart';
import 'package:bookdoctor/featuers/Auth/domin/Repos/LoingRepo.dart';
import 'package:bookdoctor/featuers/Auth/domin/UseCase/SendFeaTuredLoginUaseCase.dart';
import 'package:bookdoctor/featuers/Auth/domin/UseCase/SendFeaTuredLoginUseCase.dart';
import 'package:bookdoctor/featuers/Auth/persenation/controol/RiveControll.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class LoginControll extends GetxController {
  late TextEditingController emailControll;
  late TextEditingController passwordControll;
  late checkIfEmailRegisteredWithGoogle checkEmail;
  late EntitycheckIfEmailRegistered ifEmailRegistered;

  late bool loding;
  late get_it get;
  late Config config;
  late SendFeaTuredLoginUaseCase sendFeaTuredLoginUaseCase;
  var KeyFormLogin = GlobalKey<FormState>();
  late SharedPrefranceSr sharedPrefranceSr;
  late LoingRepo loginRepo;
  @override
  void onInit() {
    oninit();
    super.onInit();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    emailControll.dispose();
    passwordControll.dispose();
  }

  void oninit() {
    emailControll = TextEditingController();
    passwordControll = TextEditingController();
    config = Config();
    get = get_it();
    sharedPrefranceSr = Get.find();
    loginRepo = get.getIt<LoginRepoImp>();
    sendFeaTuredLoginUaseCase = get.getIt<SendFeaTuredLoginUaseCase>();
    checkEmail = get.getIt<checkIfEmailRegisteredWithGoogle>();

    loding = false;
  }

  void _loginTrue() {
    loding = true;
    update();
  }

  void _loginFalse() {
    loding = false;
    update();
  }

  void loginWithFirebase(BuildContext context) {
    if (KeyFormLogin.currentState!.validate()) {
      _loginTrue();
      _HaveAccout(context);
    }
  }

  void _askTologin(BuildContext context, EntityLogin entityLogin) {
    sendFeaTuredLoginUaseCase.call(entityLogin)?.then((Result) {
      _loginFalse();
      Result.bimap((faluires f) {
        DafultAwssomeDialog(context, massges: f.masseges).show();
      }, (UserCredential userCredential) async {
        await sharedPrefranceSr.setUid(userCredential.user!.uid);
        await sharedPrefranceSr.setEmail(emailControll.text);
        Get.offAllNamed(Routers.RAwaitForPermassionToSing);
      });
    });
  }

  Future<bool?> _HaveAccout(
    BuildContext context,
  ) async {
    ifEmailRegistered = EntitycheckIfEmailRegistered(
      Email: emailControll.text,
      passWord: passwordControll.text,
    );
    await checkEmail.call(ifEmailRegistered)?.then((value) {
      _loginFalse();
      value.bimap((l) {
        DafultAwssomeDialog(context, massges: l.masseges).show();
      }, (bool haveAcount) {
        _cheakUser(haveAcount, context);
      });
    });
    return null;
  }

  void _cheakUser(bool haveAcount, BuildContext context) {
    if (haveAcount) {
      EntityLogin entityLogin = get.getIt<EntityLogin>(
          param1: emailControll.text, param2: passwordControll.text);

      _askTologin(context, entityLogin);
    } else {
      DafultAwssomeDialog(context, massges: "no user found").show();
    }
  }

  void getPermsionOfUser(String uid) {
    loginRepo.GetPermtionOfyser(uid).then((result) {
      result.bimap((faluires f) {}, (PermtionOfSing permtionOfSing) async {
        if (permtionOfSing == PermtionOfSing.AGEY) {
          await sharedPrefranceSr.setPermation(true);
          Get.offAllNamed(Routers.RMain);
        } else if (permtionOfSing == PermtionOfSing.DINE) {}
      });
    });
  }
}
