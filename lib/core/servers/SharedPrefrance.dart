import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefranceSr extends GetxService {
  SharedPreferences? sharedPreferences;
  static const String Suid = 'UID';
  static const String Semil = 'EMAIL';
  static const String Spermsion = 'Permation';
  static const String SsenedAsk = 'senedAsk';

  Future<SharedPrefranceSr> init() async {
    await SharedPreferences.getInstance().then((value) {
      sharedPreferences = value;
      //sharedPreferences?.remove("UID");
    });
    return this;
  }

  Future<void> setEmail(String email) async {
    await sharedPreferences?.setString(SharedPrefranceSr.Semil, email);
  }

  Future<void> setUid(String uid) async {
    await sharedPreferences?.setString(SharedPrefranceSr.Suid, uid);
  }

  Future<void> setPermation(bool value) async {
    await sharedPreferences?.setBool(Spermsion, value);
  }

  Future<void> setSendAsk(bool value) async {
    await sharedPreferences?.setBool(SsenedAsk, value);
  }
}
