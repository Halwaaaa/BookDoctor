// ignore_for_file: depend_on_referenced_packages

import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:bookdoctor/core/componted/DafiltAwssdailog.dart';
import 'package:bookdoctor/core/errors/faliure.dart';
import 'package:bookdoctor/core/servers/SharedPrefrance.dart';
import 'package:bookdoctor/core/servers/permsionFilesServers.dart';
import 'package:bookdoctor/core/utles/Get_it.dart';
import 'package:bookdoctor/core/utles/router.dart';
import 'package:bookdoctor/featuers/Auth/Data/Modles/ModlesAskToSing.dart';
import 'package:bookdoctor/featuers/Auth/Data/RemotleDataSource/SingRemote.dart';
import 'package:bookdoctor/featuers/Auth/Data/Repoes/SingRepo.dart';
import 'package:bookdoctor/featuers/Auth/Data/RepoesImp/SingRepoImpo.dart';
import 'package:bookdoctor/featuers/Auth/domin/Entitty/checkIfEmailEntity.dart';
import 'package:bookdoctor/featuers/Auth/domin/Repos/SingRepo.dart';
import 'package:bookdoctor/featuers/Auth/domin/UseCase/AskToSingFeaTuredUseCase.dart';
import 'package:bookdoctor/featuers/Auth/domin/UseCase/SendFeaTuredLoginUseCase.dart';
import 'package:bookdoctor/featuers/Auth/persenation/controol/RiveControll.dart';
import 'package:bookdoctor/featuers/Auth/persenation/view/awssomeDailog.dart';
import 'package:carousel_slider/carousel_controller.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';

import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:rive/rive.dart';
import 'package:get_it/get_it.dart';

class SingContrrol extends GetxController {
  late TextEditingController passWordControol;
  late TextEditingController emailControol;
  late TextEditingController FileController;
  late TextEditingController partController;
  late TextEditingController cvController;
  late TextEditingController NameController;
  late TextEditingController PhoneController;
  late SharedPrefrance sharedPrefrance;
  var keyForm1 = GlobalKey<FormState>();
  var keyForm2 = GlobalKey<FormState>();

  late int index;

  // ignore: prefer_typing_uninitialized_variables
  late checkIfEmailRegisteredWithGoogle checkEmail;
  late EntitycheckIfEmailRegistered ifEmailRegistered;
  late SingReposImplo singReposImplo;
  File? FileStorge;
  late CarouselSliderController carouselController;
  RxString massges = 'uploadfile'.obs;

  late IconData icon;
  late bool Loding;
  late get_it get;
  late AskToSingFeaTuredUseCase asktosing;
  @override
  void onInit() {
    initStauts();

    super.onInit();
  }

  @override
  void onClose() {
    passWordControol.dispose();
    emailControol.dispose();
    cvController.dispose();
    PhoneController.dispose();
    partController.dispose();
    FileController.dispose();
    NameController.dispose();
    carouselController.reactive.dispose();

    super.onClose();
  }

  void changedIndex(int newIndex) {
    index = newIndex;
    update();
  }

  void lodingTrue() {
    Loding = true;
    update();
  }

  void lodingFalse() {
    Loding = false;
    update();
  }

  void initStauts() {
    index = 0;
    icon = Icons.arrow_right;
    Loding = false;
    sharedPrefrance = Get.find();

    FileController = TextEditingController();
    PhoneController = TextEditingController();
    partController = TextEditingController();
    NameController = TextEditingController();

    carouselController = CarouselSliderController();
    passWordControol = TextEditingController();
    emailControol = TextEditingController();
    cvController = TextEditingController();
    get = get_it();
    get.dispose();

    singReposImplo = get.getIt<SingReposImplo>();
    asktosing = get_it().getIt<AskToSingFeaTuredUseCase>();

    checkEmail = get.getIt<checkIfEmailRegisteredWithGoogle>();
  }

  void ControolAnimatedAlign(AnimationController controller,
      RiveControll riveControll, BuildContext context) {
    if (index == 0) {
      if (keyForm2.currentState!.validate()) {
        riveControll.timer?.cancel();
        riveControll.login_fail!.value = false;
        lodingTrue();
        singWithFirbse(context);
      } else {
        riveControll.FailedStatues();
      }
    } else {
      controller.reverse();
      carouselController
          .previousPage(duration: const Duration(milliseconds: 500))
          .then((value) {
        icon = Icons.arrow_right;
      });
    }
  }

  Future<void> SenedAskToSing(
      BuildContext context, RiveControll riveControll) async {
    print("jjj");
    if (keyForm2.currentState!.validate()) {
      //  if (await HaveAccout(context, riveControll) == true) {
      print("kkkkkkkkkkkkkkkkkkkkkkkkkkk");
      singWithFirbse(context);
      // }
    }
    //  }
  }

  Future<void> singWithFirbse(BuildContext context) async {
    ifEmailRegistered = EntitycheckIfEmailRegistered(
        Email: emailControol.text, passWord: passWordControol.text);
    Either<faluires, UserCredential> result =
        await singReposImplo.SingWithFirebase(ifEmailRegistered);
    lodingFalse();
    result.bimap((faluires f) {
      DafultAwssomeDialog(context, massges: f.masseges).show();
    }, (UserCredential userCredential) {
      sharedPrefrance.sharedPreferences
          ?.setString('UID', userCredential.user!.uid);
      carouselController
          .nextPage(duration: const Duration(milliseconds: 500))
          .then((value) {
        icon = Icons.arrow_left;
      });
    });
  }

  void AskToSing(BuildContext context, String? uidDoctor) {
    ModlesAskToSing modlesAskToSing = ModlesAskToSing(
        email: emailControol.text,
        name: NameController.text,
        part: partController.text,
        phone: PhoneController.text,
        Uid: "ll");
    asktosing.call(modlesAskToSing).then((value) {
      lodingFalse();
      value.bimap(
        (faluires g) =>
            {print("gggggggggggggggggggggggggggggg"), print(g.masseges)},
        (r) {
          print(r.id);
          SenedCVToFirebase(context, uidDoctor!);
        },
      );
    });
  }

  void SenedCVToFirebase(
    BuildContext context,
    String uid,
  ) {
    singReposImplo.SenedFeaTuredCV(FileStorge!, uid, context).then((value) {
      value.bimap((faluires) {
        DafultAwssomeDialog(context, massges: faluires.masseges);
        print(faluires.masseges);
      }, ((Stream<TaskSnapshot> taskSnapshot) {
        Get.offAllNamed(Routers.Rawssemdailog,
            arguments: {'Stream<TaskSnapshot>': taskSnapshot});
        // AwesomeDialog awesomeDialog =
        //     DafultAwssomeDialog(context, massges: massges.value);

        // awesomeDialog.show();
        // //  DafultAwssomeDialog(context, massges: massges.value).show();
        // taskSnapshot.listen((event) {
        //   // navigator?.pop(context);
        //   awesomeDialog.dismiss();

        //   massges.value = "${event.bytesTransferred}of${event.totalBytes}";
        //   awesomeDialog = DafultAwssomeDialog(context, massges: massges.value);
        //   awesomeDialog.show();

        //   //  DafultAwssomeDialog(context, massges: massges.value).show();
//        });
      }));
    });
  }

  Future<bool?> HaveAccout(
      BuildContext context, RiveControll riveControll) async {
    ifEmailRegistered = EntitycheckIfEmailRegistered(
      Email: emailControol.text,
      passWord: passWordControol.text,
    );
    await checkEmail.call(ifEmailRegistered)?.then((value) {
      lodingFalse();
      value.bimap((l) {
        DafultAwssomeDialog(context, massges: l.masseges).show();
        return false;
      }, (r) {
        return true;
      });
    });
    return null;
  }

  void getCv(BuildContext context) {
    ServersPermsionFiles.requestStoragePermission().then((value) async {
      await FilePicker.platform.pickFiles(
        onFileLoading: (p0) {
          log(p0.obs.string);
        },
        type: FileType.custom,
        allowedExtensions: ['pdf'],
      ).then((value) async {
        await SaveFile(value);
      }).catchError((eroo) {});
    }).catchError((error) {
      DafultAwssomeDialog(context, massges: error.toString());
    });
  }

  Future<void> SaveFile(FilePickerResult? value) async {
    if (value != null && value.files.single.path != null) {
      final filePath = value.files.single.path!;
      FileStorge = File(filePath);
      FileController.text = value.files.single.name.removeAllWhitespace;
    }
  }
}
