import 'dart:developer';

import 'package:bookdoctor/core/componted/DafultLodingWidget.dart';
import 'package:bookdoctor/core/servers/SharedPrefrance.dart';
import 'package:bookdoctor/core/utles/router.dart';
import 'package:bookdoctor/featuers/Auth/Data/Modles/ModlesAskToSing.dart';
import 'package:bookdoctor/featuers/Auth/persenation/view/dineView.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AwaitForPermassionToSingView extends StatelessWidget {
  const AwaitForPermassionToSingView({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    final wdith = MediaQuery.sizeOf(context).width;
    SharedPrefranceSr sharedPrefrance = Get.find();

    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection("DoctorAskToSing")
            .where("Uid",
                isEqualTo: sharedPrefrance.sharedPreferences?.get('UID'))
            .snapshots(),
        builder: (context, snapshot) {
          log(sharedPrefrance.sharedPreferences!.get('UID').toString());

          if (snapshot.connectionState == ConnectionState.waiting) {
            DafultLodingWidget(
              height: height,
              width: wdith,
            );
          } else if (snapshot.hasData && snapshot.data!.docs.isNotEmpty) {
            var doc = snapshot.data!.docs.first;
            print(doc.data());
            ModlesAskToSing informationSingUser =
                ModlesAskToSing.FromJson(doc.data());

            if (informationSingUser.Sataus == 'Yes') {
              sharedPrefrance.setPermation(true).then((value) {
                Get.offAllNamed(Routers.RMain);
                // return const Center(child: Text("yes"));
              });
            } else if (informationSingUser.Sataus == 'No') {
              sharedPrefrance.setPermation(false);
              return const DineView();
            }
            return const Center(child: Text("بانتظار موافقة المشرف"));
          }
          return const Center(child: Text(""));
        },
      ),
    );
  }
}
