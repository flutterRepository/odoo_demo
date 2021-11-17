import 'dart:developer';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:odoo_demo/infrastructure/apis/odoo_env_factory.dart';
import 'package:odoo_demo/infrastructure/user/repository/user_repository.dart';
import 'package:odoo_demo/presentation/routes/app_routes.dart';

class HomeMiddleware extends GetMiddleware {
  @override
  RouteSettings redirect(String? route) {
    return const RouteSettings(name: AppRoutes.HOME);
  }

  @override
  GetPage onPageCalled(GetPage<dynamic>? page) {
    log("Il y a middleware");
    OdooEnvFactory.odooEnv!.of<UserRepository>().setCurrentUser();
    return page!;
  }

  @override
  List<Bindings> onBindingsStart(List<Bindings>? bindings) {
    // This function will be called right before the Bindings are initialize,
    // then bindings is null

    return bindings!;
  }

  @override
  GetPageBuilder onPageBuildStart(GetPageBuilder? page) {
    print('Bindings of ${page.toString()} are ready');
    OdooEnvFactory.odooEnv!.of<UserRepository>().setCurrentUser();

    return page!;
  }

  @override
  Widget onPageBuilt(Widget page) {
    log("Il y a middleware");
    print('Widget ${page.toStringShort()} will be showed');
    OdooEnvFactory.odooEnv!.of<UserRepository>().setCurrentUser();

    return page;
  }

  @override
  void onPageDispose() {
    print('PageDisposed');
  }
}
