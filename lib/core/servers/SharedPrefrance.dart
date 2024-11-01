import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefranceSr extends GetxService {
  SharedPreferences? sharedPreferences;

  Future<SharedPrefranceSr> init() async {
    await SharedPreferences.getInstance().then((value) {
      sharedPreferences = value;
      //sharedPreferences?.remove("UID");
    });
    return this;
  }
}
