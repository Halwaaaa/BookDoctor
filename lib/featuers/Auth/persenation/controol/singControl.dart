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
import 'package:bookdoctor/featuers/Auth/persenation/widget/awssomeDaiog.dart';
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
  late int initPages;

  late int index;
  late int bytesTransferred;
  late int totalLenghtFile;
  late int AnimatedBytesTransferred;

  // ignore: prefer_typing_uninitialized_variables
  late checkIfEmailRegisteredWithGoogle checkEmail;
  late EntitycheckIfEmailRegistered ifEmailRegistered;
  late SingReposImplo singReposImplo;
  File? FileStorge;
  late CarouselSliderController carouselController;
  RxString massges = 'uploadfile'.obs;

  late IconData icon;
  late UploadTask uploadTask;
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
    AnimatedBytesTransferred = 0;
    Loding = false;
    sharedPrefrance = Get.find();
    sharedPrefrance.sharedPreferences?.getString('UID') == null
        ? initPages = 0
        : initPages = 1;

    totalLenghtFile = 1;
    bytesTransferred = 1;

    FileController = TextEditingController();
    PhoneController = TextEditingController();
    partController = TextEditingController();
    NameController = TextEditingController();

    carouselController = CarouselSliderController();
    passWordControol = TextEditingController();
    emailControol = TextEditingController();
    cvController = TextEditingController();
    get = get_it();

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
    if (keyForm1.currentState!.validate()) {
      riveControll.timer?.cancel();
      riveControll.login_fail!.value = false;
      lodingTrue();
      //  if (await HaveAccout(context, riveControll) == true) {
      print("kkkkkkkkkkkkkkkkkkkkkkkkkkk");
      _AskToSing(context, sharedPrefrance.sharedPreferences?.getString('UID'),
          riveControll);
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

  Future<void> _AskToSing(BuildContext context, String? uidDoctor,
      RiveControll riveControllr) async {
    lodingTrue();
    ModlesAskToSing modlesAskToSing = ModlesAskToSing(
        email: emailControol.text,
        name: NameController.text,
        part: partController.text,
        phone: PhoneController.text,
        Uid: uidDoctor);
    await asktosing.call(modlesAskToSing).then((value) {
      log('lll');
      lodingFalse();
      value.bimap(
        (faluires g) => {
          print("gggggggggggggggggggggggggggggg"),
          riveControllr.FailedStatues(),
          DafultAwssomeDialog(context, massges: g.masseges).show(),
        },
        (r) {
          print(r.id);
          _SenedCVToFirebase(context, uidDoctor!);
        },
      );
    });
  }

  void _SenedCVToFirebase(
    BuildContext context,
    String uid,
  ) {
    log("cv");
    singReposImplo.SenedFeaTuredCV(FileStorge!, uid, context).then((value) {
      value.bimap((faluires) {
        DafultAwssomeDialog(context, massges: faluires.masseges);
        print(faluires.masseges);
      }, ((UploadTask uploadTask1) {
        uploadTask = uploadTask1;
        AwesomeDialog awesomeDialog = awesomeDialogview(context);

        awesomeDialog.show();
        _cvSendListen(
          uploadTask,
          awesomeDialog,
          context,
        );
      }));
    });
  }

  void _cvSendListen(UploadTask uploadTask, AwesomeDialog awesomeDialog,
      BuildContext context) {
    uploadTask.snapshotEvents.first.then((value) {
      totalLenghtFile = value.totalBytes;
      update();
    });

    uploadTask.snapshotEvents.listen((event) async {
      await Future.delayed(const Duration(milliseconds: 300));

      if (event.state == TaskState.running) {
        AnimatedBytesTransferred = event.bytesTransferred - bytesTransferred;
        bytesTransferred = event.bytesTransferred;

        update();
      } else if (event.state == TaskState.success) {
        log("success");
        awesomeDialog.dismiss();
        DafultAwssomeDialog(context, massges: event.state.name).show();
      } else if (event.state == TaskState.error) {
        log("error");
        awesomeDialog.dismiss();
        DafultAwssomeDialog(context, massges: event.state.name);
      }
    });
  }

  Future<void> cancelSenedCv() async {
    await uploadTask.cancel();
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

  void getCvFromMobile(BuildContext context) {
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
