import 'package:bookdoctor/featuers/Auth/Data/RemotleDataSource/SingRemote.dart';
import 'package:bookdoctor/featuers/Auth/Data/RepoesImp/SingRepoImpo.dart';
import 'package:bookdoctor/featuers/Auth/domin/Entitty/checkIfEmailEntity.dart';
import 'package:bookdoctor/featuers/Auth/domin/Repos/SingRepo.dart';
import 'package:bookdoctor/featuers/Auth/domin/UseCase/SendFeaTuredLoginUseCase.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ContrrolSing extends GetxController {
  late TextEditingController passWordControol;
  late TextEditingController emailControol;
  // ignore: prefer_typing_uninitialized_variables
  late checkIfEmailRegisteredWithGoogle checkEmail;
  late EntitycheckIfEmailRegistered ifEmailRegistered;
  late SingReposImplo singReposImplo;
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

  void initStauts() {
    passWordControol = TextEditingController();
    emailControol = TextEditingController();
    singReposImplo =
        SingReposImplo(singRemoteDataSousrce: SingRemoteDataSousrceImp());
    checkEmail = checkIfEmailRegisteredWithGoogle(singRepo: singReposImplo);
  }

  void CreateAccout() {
    print("jjj");
    HaveAccout();
  }

  Future<void> HaveAccout() async {
    ifEmailRegistered = EntitycheckIfEmailRegistered(
      Email: emailControol.text,
      passWord: passWordControol.text,
    );
    await checkEmail.call(ifEmailRegistered)?.then((value) {
      value.bimap((l) {
        print(l.masseges);
      }, (r) => null);
    });
  }
}
