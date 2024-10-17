import 'package:bookdoctor/core/errors/faliure.dart';
import 'package:bookdoctor/featuers/Auth/Data/Modles/ModlesAskToSing.dart';
import 'package:bookdoctor/featuers/Auth/domin/Entitty/AsktoEntity.dart';
import 'package:bookdoctor/featuers/Auth/domin/Entitty/checkIfEmailEntity.dart';
// ignore: depend_on_referenced_packages
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

abstract class SingRemoteDataSousrce {
  Future<DocumentReference> SendFeaTuredAskToSing(ModlesAskToSing askToSing);

  Future<bool> checkIfEmailRegisteredWithGoogle(
      EntitycheckIfEmailRegistered emailRegistered);
}

class SingRemoteDataSousrceImp extends SingRemoteDataSousrce {
  @override
  Future<DocumentReference> SendFeaTuredAskToSing(
      ModlesAskToSing askToSing) async {
    return await FirebaseFirestore.instance
        .collection('Admain')
        .add(askToSing.ToMap())
        .then((value) {
      return value;
    });
  }

  @override
  Future<bool> checkIfEmailRegisteredWithGoogle(
      EntitycheckIfEmailRegistered emailRegistered) async {
    // TODO: implement checkIfEmailRegisteredWithGoogle
    List<String> data = await FirebaseAuth.instance
        .fetchSignInMethodsForEmail(emailRegistered.Email!);

    if (data.isNotEmpty) {
      return false;
    }
    return true;
  }
}
