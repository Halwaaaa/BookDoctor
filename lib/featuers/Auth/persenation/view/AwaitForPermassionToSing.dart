import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class AwaitForPermassionToSingView extends StatelessWidget {
  const AwaitForPermassionToSingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection("DoctorAskToSing")
            .snapshots()
            .asyncExpand((event) => null),
        builder: (context, snapshot) {
          return const Text("data");
        },
      ),
    );
  }
}
