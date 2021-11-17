import 'package:flutter/material.dart';

import 'package:get/get.dart';

class GlobalMiddleware extends GetMiddleware {
  @override
  RouteSettings redirect(String? route) {
    return RouteSettings(name: '/login');
  }

  @override
  GetPage onPageCalled(GetPage<dynamic>? page) {
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
    return page!;
  }

  @override
  Widget onPageBuilt(Widget page) {
    print('Widget ${page.toStringShort()} will be showed');
    return page;
  }

  @override
  void onPageDispose() {
    print('PageDisposed');
  }
}
