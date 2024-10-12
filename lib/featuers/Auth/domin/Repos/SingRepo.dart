import 'package:bookdoctor/core/errors/faliure.dart';
import 'package:bookdoctor/featuers/Auth/domin/Entitty/AsktoEntity.dart';
import 'package:bookdoctor/featuers/Auth/domin/Entitty/checkIfEmailEntity.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class SingRepo {
  Future<Either<faluires, UserCredential>> SendFeaTuredAskToSing(
      EntityAskToSing askToSingEntity);

  Future<Either<faluires, bool>> checkIfEmailRegisteredWithGoogle(
      EntitycheckIfEmailRegistered emailRegistered);
}
