import 'package:bookdoctor/core/componted/DafiltAwssdailog.dart';
import 'package:bookdoctor/featuers/Auth/persenation/controol/singControl.dart';
import 'package:bookdoctor/featuers/Auth/persenation/view/loginview.dart';
import 'package:bookdoctor/featuers/Auth/persenation/widget/DetailsSened.dart';
import 'package:bookdoctor/featuers/Auth/persenation/widget/eroorSened.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AwssomeDailogView extends StatelessWidget {
  const AwssomeDailogView({super.key});

  @override
  Widget build(BuildContext context) {
    Stream<TaskSnapshot> taskSnapshotStream =
        Get.arguments['Stream<TaskSnapshot>'];
    return Scaffold(
        body: StreamBuilder(
      stream: taskSnapshotStream,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        }
        if (snapshot.data?.state == TaskState.running) {
          return const DetailsSened();
        } else if (snapshot.data?.state == TaskState.success) {
          return const loginview();
        }
        return const eroorSened();
      },
    ));
  }
}
