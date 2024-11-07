<<<<<<< HEAD
=======
import 'dart:developer';
import 'dart:ffi';
>>>>>>> Auth
import 'dart:io';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:bookdoctor/core/componted/DafiltAwssdailog.dart';
import 'package:bookdoctor/core/errors/faliure.dart';
import 'package:bookdoctor/featuers/Auth/Data/Modles/ModlesAskToSing.dart';
import 'package:bookdoctor/featuers/Auth/domin/Entitty/AsktoEntity.dart';
import 'package:bookdoctor/featuers/Auth/domin/Entitty/checkIfEmailEntity.dart';
// ignore: depend_on_referenced_packages
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class SingRemoteDataSousrce {
<<<<<<< HEAD
  Future<DocumentReference> SendFeaTuredAskToSing(ModlesAskToSing askToSing);
=======
  Future<void> SendFeaTuredAskToSing(ModlesAskToSing askToSing);
>>>>>>> Auth

  Future<bool> checkIfEmailRegisteredWithGoogle(
      EntitycheckIfEmailRegistered emailRegistered);
  Future<UploadTask> SenedFeaTuredCV(
      File filecv, String uid, BuildContext context);

  Future<UserCredential> SingWithFireBase(
      EntitycheckIfEmailRegistered emailRegistered);
}

class SingRemoteDataSousrceImp extends SingRemoteDataSousrce {
  @override
<<<<<<< HEAD
  Future<DocumentReference> SendFeaTuredAskToSing(
      ModlesAskToSing askToSing) async {
    return await FirebaseFirestore.instance
        .collection("DoctorAskToSing")
        .add(askToSing.ToMap());
=======
  Future<void> SendFeaTuredAskToSing(ModlesAskToSing askToSing) async {
    return await FirebaseFirestore.instance
        .collection("DoctorAskToSing")
        .doc(askToSing.Uid)
        .set(askToSing.ToMap());
>>>>>>> Auth
  }

  @override
  Future<bool> checkIfEmailRegisteredWithGoogle(
      EntitycheckIfEmailRegistered emailRegistered) async {
<<<<<<< HEAD
=======
    log(emailRegistered.Email!);
>>>>>>> Auth
    // TODO: implement checkIfEmailRegisteredWithGoogle
    List<String>? data = await FirebaseAuth.instance
        .fetchSignInMethodsForEmail(emailRegistered.Email!);

    if (data.isNotEmpty) {
      return false;
    }
<<<<<<< HEAD
=======
    log("${data}llll");
>>>>>>> Auth
    return true;
  }

  @override
  Future<UploadTask> SenedFeaTuredCV(
      File filecv, String uid, BuildContext context) async {
    final storageRef = FirebaseStorage.instance.ref(uid);
    final uploadTask = storageRef.putFile(filecv);
    return uploadTask;
  }

  // ignore: non_constant_identifier_names
  @override
  Future<UserCredential> SingWithFireBase(
      EntitycheckIfEmailRegistered emailRegistered) async {
    return await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailRegistered.Email!, password: emailRegistered.passWord!);
  }
}
