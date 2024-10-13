import 'package:bookdoctor/core/componted/DafiltAwssdailog.dart';
import 'package:bookdoctor/featuers/Auth/Data/RemotleDataSource/SingRemote.dart';
import 'package:bookdoctor/featuers/Auth/Data/RepoesImp/SingRepoImpo.dart';
import 'package:bookdoctor/featuers/Auth/domin/Entitty/checkIfEmailEntity.dart';
import 'package:bookdoctor/featuers/Auth/domin/Repos/SingRepo.dart';
import 'package:bookdoctor/featuers/Auth/domin/UseCase/SendFeaTuredLoginUseCase.dart';
import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SingContrrol extends GetxController {
  late TextEditingController passWordControol;
  late TextEditingController emailControol;
  late int index;

  // ignore: prefer_typing_uninitialized_variables
  late checkIfEmailRegisteredWithGoogle checkEmail;
  late EntitycheckIfEmailRegistered ifEmailRegistered;
  late SingReposImplo singReposImplo;
  late CarouselSliderController carouselController;
  late IconData icon;
  @override
  void onInit() {
    initStauts();

    super.onInit();
  }

  @override
  void onClose() {
    passWordControol.dispose();
    emailControol.dispose();

    super.onClose();
  }

  void changedIndex(int newIndex) {
    index = newIndex;
    update();
  }

  void initStauts() {
    index = 0;
    icon = Icons.arrow_right;

    carouselController = CarouselSliderController();
    passWordControol = TextEditingController();
    emailControol = TextEditingController();
    singReposImplo =
        SingReposImplo(singRemoteDataSousrce: SingRemoteDataSousrceImp());
    checkEmail = checkIfEmailRegisteredWithGoogle(singRepo: singReposImplo);
  }

  void ControolAnimatedAlign(AnimationController controller) {
    if (index == 0) {
      controller.forward();
      carouselController
          .nextPage(duration: const Duration(milliseconds: 500))
          .then((value) {
        icon = Icons.arrow_left;
      });
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
    HaveAccout(context);
  }

  Future<void> HaveAccout(BuildContext context) async {
    ifEmailRegistered = EntitycheckIfEmailRegistered(
      Email: emailControol.text,
      passWord: passWordControol.text,
    );
    await checkEmail.call(ifEmailRegistered)?.then((value) {
      value.bimap((l) {
        DafultAwssomeDialog(context, massges: l.masseges).show();
      }, (r) {
        DafultAwssomeDialog(context, massges: r.toString()).show();
      });
    });
  }
}
