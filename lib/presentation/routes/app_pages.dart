import 'package:get/get.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:odoo_demo/app/middleware/home_middleware.dart';
import 'package:odoo_demo/presentation/core/others/unknown_route_page/unknown_route_page.dart';
import 'package:odoo_demo/presentation/home/home_page.dart';

import 'app_routes.dart';

const _defaultTransition = Transition.native;
const _downUpTransition = Transition.downToUp;

class AppPages {
  static final unknownRoutePage = GetPage(
    name: AppRoutes.UNKNOWN,
    page: () => const UnknownRoutePage(),
    // binding: UnknownRouteBinding(),
    transition: _defaultTransition,
  );

  static final List<GetPage> pages = [
    unknownRoutePage,
    GetPage(
      name: AppRoutes.HOME,
      page: () => const HomePage(),
      // binding: HomeBinding(),
      transition: _downUpTransition,
      middlewares: [HomeMiddleware()],
    ),
  ];
}
