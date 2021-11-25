import 'package:get/get.dart';
import 'package:odoo_demo/app/controllers/main/app_controller.dart';
import 'package:odoo_demo/app/controllers/main/home_controller.dart';
import 'package:odoo_demo/app/controllers/main/navigation_controller.dart';
import 'package:odoo_demo/app/controllers/main/unknown_route_controller.dart';
import 'package:odoo_demo/app/controllers/user/auth_controller.dart';
import 'package:odoo_demo/app/controllers/user/partner_controller.dart';
import 'package:odoo_demo/app/controllers/user/user_controller.dart';

class InitialBinding implements Bindings {
  @override
  void dependencies() {
    // Get.lazyPut<AuthController>(() => AuthController());
    // Get.lazyPut<UserController>(() => UserController());
    // Get.lazyPut<AppController>(() => AppController());
    // Get.lazyPut<NavigationController>(() => NavigationController());
    // Get.lazyPut<UnknownRouteController>(() => UnknownRouteController());

    //Direct
    Get.put<AuthController>(AuthController());
    Get.put<HomeController>(HomeController());
    Get.put<UserController>(UserController());
    Get.put<PartnerController>(PartnerController());
    Get.put<AppController>(AppController());
    Get.put<NavigationController>(NavigationController());
    Get.put<UnknownRouteController>(UnknownRouteController());
  }
}
