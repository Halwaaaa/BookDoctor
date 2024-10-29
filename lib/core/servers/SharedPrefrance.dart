import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefrance extends GetxService {
  SharedPreferences? sharedPreferences;

  Future<SharedPrefrance> init() async {
    await SharedPreferences.getInstance();
    return this;
  }
}
