import 'dart:io';

import 'package:bookdoctor/core/errors/faliure.dart';
import 'package:bookdoctor/featuers/Auth/Data/Modles/ModlesAskToSing.dart';
import 'package:bookdoctor/featuers/Auth/Data/RemotleDataSource/SingRemote.dart';
import 'package:bookdoctor/featuers/Auth/domin/Entitty/AsktoEntity.dart';
import 'package:bookdoctor/featuers/Auth/domin/Entitty/checkIfEmailEntity.dart';
import 'package:bookdoctor/featuers/Auth/domin/Repos/SingRepo.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';

class SingReposImplo extends SingRepo {
  SingRemoteDataSousrce singRemoteDataSousrce;

  SingReposImplo({
    required this.singRemoteDataSousrce,
  });
  @override
  Future<Either<faluires, DocumentReference>> SendFeaTuredAskToSing(
      ModlesAskToSing askToSing) async {
    try {
      DocumentReference Resut =
          await singRemoteDataSousrce.SendFeaTuredAskToSing(askToSing);

      return right(Resut);
    } catch (e) {
      if (e is FirebaseAuthException) {
        return left(faluiresfiebasesing.fromFierbaseAuthEroor(e));
      }
      return left(unknowfaluires(masseges: e.toString()));
    }
  }

  @override
  Future<Either<faluires, bool>> checkIfEmailRegisteredWithGoogle(
      EntitycheckIfEmailRegistered emailRegistered) async {
    {
      try {
        bool Reslut = await singRemoteDataSousrce
            .checkIfEmailRegisteredWithGoogle(emailRegistered);
        return right(Reslut);
      } catch (e) {
        if (e is FirebaseAuthException) {
          return left(faluiresfiebasesing.fromFierbaseAuthEroor(e));
        }
        return left(unknowfaluires(masseges: e.toString()));
      }
    }
  }

  @override
  Future<Either<faluires, TaskSnapshot>> SenedFeaTuredCV(File filecv) async {
    try {
      TaskSnapshot result = await singRemoteDataSousrce.SenedFeaTuredCV(filecv);
      return right(result);
    } catch (erorr) {
      if (erorr is FirebaseException) {
        return left(faluiresfiebase.erorr(erorr));
      }
      return left(unknowfaluires(masseges: erorr.toString()));
    }
  }

  @override
  Future<Either<faluires, UserCredential>> SingWithFirebase(
      EntitycheckIfEmailRegistered emailRegistered) async {
    try {
      UserCredential credential =
          await singRemoteDataSousrce.SingWithFireBase(emailRegistered);
      return right(credential);
    } catch (erorr) {
      if (erorr is FirebaseException) {
        return left(faluiresfiebase.erorr(erorr));
      } else if (erorr is FirebaseAuthException) {
        return left(faluiresfiebasesing.fromFierbaseAuthEroor(erorr));
      }
      return left(unknowfaluires(masseges: erorr.toString()));
    }
  }
}
