import 'package:bookdoctor/core/servers/SharedPrefrance.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future initServer() async {
<<<<<<< HEAD
  await Get.putAsync(() => SharedPrefrance().init());
=======
  await Get.putAsync(() => SharedPrefranceSr().init(), permanent: true);
>>>>>>> Auth
}
