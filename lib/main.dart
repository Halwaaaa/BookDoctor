import 'package:bookdoctor/core/servers/Email.dart';
import 'package:bookdoctor/core/servers/EmailSender.dart';
import 'package:bookdoctor/core/servers/emailvel.dart';
import 'package:bookdoctor/core/utles/Get_it.dart';
import 'package:bookdoctor/core/utles/router.dart';
import 'package:firebase_app_check/firebase_app_check.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:email_validator/email_validator.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    get_it().setup();
    return GetMaterialApp(
      locale: const Locale('ar'),
      getPages: Routers.getpage,
      //routerConfig: Routers.router,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
    );
  }
}
