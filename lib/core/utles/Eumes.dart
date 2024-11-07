import 'package:dartz/dartz_streaming.dart';

enum PermtionOfSing { REQ, DINE, AGEY, EX }

extension LoadingStatusExtension on PermtionOfSing {
  String get text {
    switch (this) {
      case PermtionOfSing.REQ:
        return "req";
      case PermtionOfSing.DINE:
        return "dine";
      case PermtionOfSing.AGEY:
        return "agry";

      case PermtionOfSing.EX:
        return "No User";
    }
  }
}
