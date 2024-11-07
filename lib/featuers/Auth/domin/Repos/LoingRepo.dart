import 'package:bookdoctor/core/errors/faliure.dart';
<<<<<<< HEAD
import 'package:bookdoctor/featuers/Auth/domin/Entitty/LoginEntity.dart';
import 'package:dartz/dartz.dart';

abstract class LoingRepo {
  Future<Either<faluires, bool>> SendFeaTuredLogin(EntityLogin);
=======
import 'package:bookdoctor/core/utles/Eumes.dart';
import 'package:bookdoctor/featuers/Auth/domin/Entitty/LoginEntity.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class LoingRepo {
  Future<Either<faluires, UserCredential>> SendFeaTuredLogin(
      EntityLogin entityLogin);
  Future<Either<faluires, PermtionOfSing>> GetPermtionOfyser(String Uid);
>>>>>>> Auth
}
