// ignore_for_file: depend_on_referenced_packages

import 'dart:developer';
import 'dart:io';

import 'package:bookdoctor/core/componted/DafiltAwssdailog.dart';
import 'package:bookdoctor/core/servers/permsionFilesServers.dart';
import 'package:bookdoctor/featuers/Auth/Data/RemotleDataSource/SingRemote.dart';
import 'package:bookdoctor/featuers/Auth/Data/RepoesImp/SingRepoImpo.dart';
import 'package:bookdoctor/featuers/Auth/domin/Entitty/checkIfEmailEntity.dart';
import 'package:bookdoctor/featuers/Auth/domin/UseCase/SendFeaTuredLoginUseCase.dart';
import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';

import 'package:get/get.dart';

class SingContrrol extends GetxController {
  late TextEditingController passWordControol;
  late TextEditingController emailControol;
  late TextEditingController FileController;
  late TextEditingController partController;
  late TextEditingController cvController;
  late TextEditingController NameController;
  var keyForm1 = GlobalKey<FormState>();
  var keyForm2 = GlobalKey<FormState>();

  late int index;

  // ignore: prefer_typing_uninitialized_variables
  late checkIfEmailRegisteredWithGoogle checkEmail;
  late EntitycheckIfEmailRegistered ifEmailRegistered;
  late SingReposImplo singReposImplo;
  File? FileStorge;
  late CarouselSliderController carouselController;
  late IconData icon;
  late bool Loding;
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

    FileController = TextEditingController();
    partController = TextEditingController();
    NameController = TextEditingController();

    carouselController = CarouselSliderController();
    passWordControol = TextEditingController();
    emailControol = TextEditingController();
    cvController = TextEditingController();

    singReposImplo =
        SingReposImplo(singRemoteDataSousrce: SingRemoteDataSousrceImp());
    checkEmail = checkIfEmailRegisteredWithGoogle(singRepo: singReposImplo);
  }

  void ControolAnimatedAlign(AnimationController controller) {
    if (index == 0) {
      if (keyForm1.currentState!.validate()) {
        controller.forward();
        carouselController
            .nextPage(duration: const Duration(milliseconds: 500))
            .then((value) {
          icon = Icons.arrow_left;
        });
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

  void CreateAccout(BuildContext context) {
    print("jjj");
    if (keyForm2.currentState!.validate()) {
      lodingTrue();
      HaveAccout(context);
    }
  }

  Future<void> HaveAccout(BuildContext context) async {
    ifEmailRegistered = EntitycheckIfEmailRegistered(
      Email: emailControol.text,
      passWord: passWordControol.text,
    );
    await checkEmail.call(ifEmailRegistered)?.then((value) {
      lodingFalse();
      value.bimap((l) {
        DafultAwssomeDialog(context, massges: l.masseges).show();
      }, (r) {
        DafultAwssomeDialog(context, massges: r.toString()).show();
      });
    });
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
