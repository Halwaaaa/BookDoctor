import 'package:bookdoctor/featuers/Auth/persenation/view/Sing.dart';
import 'package:go_router/go_router.dart';

class Routers {
  // GoRouter configuration4
  static String Rsing = '/';

  static GoRouter router = GoRouter(
    routes: [
      GoRoute(
        path: Rsing,
        builder: (context, state) => const SingView(),
      ),
    ],
  );
}
