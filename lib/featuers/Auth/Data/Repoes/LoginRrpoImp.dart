import 'package:bookdoctor/core/errors/faliure.dart';
import 'package:bookdoctor/core/utles/Eumes.dart';
import 'package:bookdoctor/featuers/Auth/Data/RemotleDataSource/LoginRemtoe.dart';
import 'package:bookdoctor/featuers/Auth/domin/Entitty/LoginEntity.dart';
import 'package:bookdoctor/featuers/Auth/domin/Repos/LoingRepo.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginRepoImp extends LoingRepo {
  final LoginRemtoeImplo loginRemtoeImplo;
  LoginRepoImp(this.loginRemtoeImplo);
  // ignore: non_constant_identifier_names, non_constant_identifier_names
  @override
  Future<Either<faluires, PermtionOfSing>> GetPermtionOfyser(String Uid) async {
    PermtionOfSing permtionOfSing;
    try {
      permtionOfSing = await loginRemtoeImplo.GetPermtionOfyser(Uid);

      return right(permtionOfSing);
    } catch (erorr) {
      if (erorr is FirebaseException) {
        return left(faluiresfiebase.erorr(erorr));
      }
      return left(unknowfaluires(masseges: erorr.toString()));
    }
  }

  @override
  Future<Either<faluires, UserCredential>> SendFeaTuredLogin(
      EntityLogin entityLogin) async {
    UserCredential userCredential;
    // TODO: implement SendFeaTuredLogin
    try {
      userCredential = await loginRemtoeImplo.SendFeaTuredLogin(entityLogin);

      return right(userCredential);
    } catch (erorr) {
      if (erorr is FirebaseAuthException) {
        return left(faluiresfiebasesing.fromFierbaseAuthEroor(erorr));
      } else if (erorr is FirebaseException) {
        return left(faluiresfiebase(masseges: "pass word not corret"));
      }
      return left(unknowfaluires(masseges: erorr.toString()));
    }
  }
}
