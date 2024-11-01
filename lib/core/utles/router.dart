import 'package:bookdoctor/featuers/Auth/persenation/MiddlewareSingPermation.dart';
import 'package:bookdoctor/featuers/Auth/persenation/controol/RiveControll.dart';
import 'package:bookdoctor/featuers/Auth/persenation/controol/singControl.dart';
import 'package:bookdoctor/featuers/Auth/persenation/view/AwaitForPermassionToSing.dart';
import 'package:bookdoctor/featuers/Auth/persenation/view/Sing.dart';
import 'package:bookdoctor/featuers/Auth/persenation/view/main.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

class Routers {
  // GoRouter configuration4
  static String Rsing = '/';
  static String Rawssemdailog = '/awssemdailog';
  static String RAwaitForPermassionToSing = '/AwaitForPermassionToSing';
  static String RMain = '/Main';
  static List<GetPage> getpage = [
    GetPage(
      name: Rsing,
      page: () => const SingView(),
      middlewares: [MiddlewareSingPermation()],
      bindings: [
        BindingsBuilder.put(() => SingContrrol(), permanent: true),
        BindingsBuilder.put(() => RiveControll()),
      ],
    ),
    GetPage(
      name: RAwaitForPermassionToSing,
      page: () => const AwaitForPermassionToSingView(),
      middlewares: [MiddlewareSingPermation()],
    ),
    GetPage(name: RMain, page: () => const mainview())
  ];

  static GoRouter router = GoRouter(
    routes: [
      GoRoute(
        path: Rsing,
        builder: (context, state) => const SingView(),
      ),
    ],
  );
}
