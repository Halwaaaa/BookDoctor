import 'package:bookdoctor/core/errors/faliure.dart';
import 'package:bookdoctor/featuers/Auth/domin/Entitty/AsktoEntity.dart';
import 'package:bookdoctor/featuers/Auth/domin/Entitty/checkIfEmailEntity.dart';
// ignore: depend_on_referenced_packages
import 'package:firebase_auth/firebase_auth.dart';

abstract class SingRemoteDataSousrce {
  Future<bool> SendFeaTuredAskToSing(EntityAskToSing askToSingEntity);

  Future<bool> checkIfEmailRegisteredWithGoogle(
      EntitycheckIfEmailRegistered emailRegistered);
}

class SingRemoteDataSousrceImp extends SingRemoteDataSousrce {
  @override
  Future<bool> SendFeaTuredAskToSing(EntityAskToSing askToSingEntity) async {
    return true;
    //  await FirebaseAuth.instance
    // .createUserWithEmailAndPassword(
    //     email: askToSingEntity.email!, password: );
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
