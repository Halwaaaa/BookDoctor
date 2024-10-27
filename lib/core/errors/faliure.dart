import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

abstract class faluires {
  final String masseges;

  faluires({required this.masseges});
}

class faluiresfiebasesing extends faluires {
  faluiresfiebasesing({required super.masseges});

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
  unknowfaluires({required super.masseges});
}

class faluiresInternet extends faluires {
  faluiresInternet({required super.masseges});
}

class faluiresHaveAccount extends faluires {
  faluiresHaveAccount({required super.masseges});
}

class faluiresfiebase extends faluires {
  faluiresfiebase({required super.masseges});
  factory faluiresfiebase.erorr(FirebaseException exception) =>
      faluiresfiebase(masseges: exception.message.toString());
}
