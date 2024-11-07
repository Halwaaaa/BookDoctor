import 'dart:io';

import 'package:bookdoctor/core/errors/faliure.dart';
import 'package:bookdoctor/featuers/Auth/Data/Modles/ModlesAskToSing.dart';
import 'package:bookdoctor/featuers/Auth/domin/Entitty/AsktoEntity.dart';
import 'package:bookdoctor/featuers/Auth/domin/Entitty/checkIfEmailEntity.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

abstract class SingRepo {
<<<<<<< HEAD
  Future<Either<faluires, DocumentReference>> SendFeaTuredAskToSing(
=======
  Future<Either<faluires, void>> SendFeaTuredAskToSing(
>>>>>>> Auth
      ModlesAskToSing askToSing);

  Future<Either<faluires, UploadTask>> SenedFeaTuredCV(
      File filecv, String uid, BuildContext context);

  Future<Either<faluires, bool>> checkIfEmailRegisteredWithGoogle(
      EntitycheckIfEmailRegistered emailRegistered);

  Future<Either<faluires, UserCredential>> SingWithFirebase(
      EntitycheckIfEmailRegistered emailRegistered);
}
