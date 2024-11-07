import 'dart:developer';
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
import 'package:flutter/material.dart';

class SingReposImplo extends SingRepo {
  SingRemoteDataSousrce singRemoteDataSousrce;

  SingReposImplo({
    required this.singRemoteDataSousrce,
  });
  @override
  Future<Either<faluires, void>> SendFeaTuredAskToSing(
      ModlesAskToSing askToSing) async {
    try {
      log('cccc');

      await singRemoteDataSousrce.SendFeaTuredAskToSing(askToSing).timeout(
        const Duration(seconds: 100),
      );

      return right(null);
    } catch (e) {
      if (e is FirebaseException) {
        return left(faluiresfiebase.erorr(e));
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
  Future<Either<faluires, UploadTask>> SenedFeaTuredCV(
      File filecv, String uid, BuildContext context) async {
    try {
      UploadTask result =
          await singRemoteDataSousrce.SenedFeaTuredCV(filecv, uid, context);
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
