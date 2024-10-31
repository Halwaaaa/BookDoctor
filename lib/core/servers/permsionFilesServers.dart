import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:permission_handler/permission_handler.dart';

class ServersPermsionFiles {
  static Future<void> requestStoragePermission() async {
    PermissionStatus status = await Permission.storage.status;
    print(status);

    if (status == PermissionStatus.permanentlyDenied) {
      throw PermissionStatuspermanentlyDenied(
          'م رفض إذن الوصول للملفات بشكل دائم. يرجى الذهاب إلى إعدادات التطبيق لتغيير الأذونات');
    }
    if (status == PermissionStatus.denied) {
      PermissionStatus status = await Permission.storage.request();

      if (status != PermissionStatus.granted) {
        throw PermissionStatuspermanentlyDenied(
            'م رفض إذن الوصول للملفات بشكل دائم. يرجى الذهاب إلى إعدادات التطبيق لتغيير الأذونات');
      }
    }
    //  openAppSettings();
  }
}

class PermissionStatuspermanentlyDenied implements Exception {
  final String message;
  PermissionStatuspermanentlyDenied(this.message);

  @override
  String toString() {
    return message;
  }
}
