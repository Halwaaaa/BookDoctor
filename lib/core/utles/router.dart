import 'package:bookdoctor/featuers/Auth/persenation/controol/singControl.dart';
import 'package:bookdoctor/featuers/Auth/persenation/view/Sing.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

class Routers {
  // GoRouter configuration4
  static String Rsing = '/';
  static List<GetPage> getpage = [
    GetPage(name: Rsing, page: () => const SingView(),
    binding: BindingsBuilder.put(() => ContrrolSing()),
    ),
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
