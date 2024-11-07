import 'package:bookdoctor/core/servers/SharedPrefrance.dart';
import 'package:bookdoctor/core/utles/router.dart';
import 'package:flutter/src/widgets/navigator.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MiddlewareSingPermation extends GetMiddleware {
  SharedPrefranceSr sharedPreferences = Get.find();
  @override
  RouteSettings? redirect(String? route) {
    if (sharedPreferences.sharedPreferences?.getBool("Permation") == true) {
      return RouteSettings(name: Routers.RMain);
    } else if (sharedPreferences.sharedPreferences
            ?.getBool(SharedPrefranceSr.SsenedAsk) ==
        true) {
      return RouteSettings(name: Routers.RAwaitForPermassionToSing);
    }
    return null;
    // TODO: implement redirect
  }
}
