import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

abstract class faluires {}

class faluiresfiebasesing extends faluires {
  faluiresfiebasesing({required this.masseges});

  final String masseges;
  factory faluiresfiebasesing.fromFierbaseAuthEroor(
      FirebaseAuthException authException) {
    if (authException.message?.contains('403') == true) {
      return faluiresfiebasesing(masseges: 'الوقع غير فغال فى منطقتك');
    } else {
      return faluiresfiebasesing(masseges: authException.message.toString());
    }
  }
}

class unknowfaluires extends faluires {
  final String masseges;
  unknowfaluires({
    required this.masseges,
  });
}

class faluiresInternet extends faluires {
  final String masseges;
  faluiresInternet({required this.masseges});
}
