import 'package:bookdoctor/core/utles/Eumes.dart';
import 'package:bookdoctor/featuers/Auth/domin/Entitty/LoginEntity.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';

abstract class LoginRemtoe {
  Future<UserCredential> SendFeaTuredLogin(EntityLogin entityLogin);
  Future<PermtionOfSing> GetPermtionOfyser(String Uid);
}

class LoginRemtoeImplo extends LoginRemtoe {
  // ignore: non_constant_identifier_names
  @override
  Future<PermtionOfSing> GetPermtionOfyser(String Uid) async {
    // TODO: implement GetPermtionOfyser

    QuerySnapshot<Map<String, dynamic>> querySnapshot = await FirebaseFirestore
        .instance
        .collection("DoctorAskToSing")
        .where('Uid', isEqualTo: Uid)
        .get();
    return getPermtion(querySnapshot);
  }

  PermtionOfSing getPermtion(
      QuerySnapshot<Map<String, dynamic>> querySnapshot) {
    String? stauts = querySnapshot.docs.first.get('Sataus');

    if (stauts == 'No') {
      return PermtionOfSing.DINE;
    } else if (stauts == 'Yes') {
      return PermtionOfSing.AGEY;
    } else if (stauts == 'REQ') {
      return PermtionOfSing.AGEY;
    }
    return PermtionOfSing.EX;
  }

  @override
  Future<UserCredential> SendFeaTuredLogin(EntityLogin entityLogin) {
    // TODO: implement SendFeaTuredLogin
    return FirebaseAuth.instance.signInWithEmailAndPassword(
        email: entityLogin.email!, password: entityLogin.password!);
  }

  //     return null;
}
