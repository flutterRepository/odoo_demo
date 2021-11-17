import 'dart:developer';

import 'package:get/get.dart';
import 'package:odoo_demo/infrastructure/apis/hive_cache_factory.dart';
import 'package:odoo_demo/infrastructure/core/config.dart';
import 'package:odoo_demo/presentation/home/home_page.dart';
import 'package:odoo_demo/presentation/user/auth/full_auth_page.dart';
import 'package:odoo_demo/presentation/user/auth/sign_in_page.dart';

stateNavigation() async {
  bool isLoggedIn = HiveCacheFactory.hiveCache!.get(
    Config.cacheIsLoggedInKey,
    defaultValue: false,
  );
  log("L'état de la connexion dans le main est =>: $isLoggedIn");
  bool isServerConfigured = HiveCacheFactory.hiveCache!.get(
    Config.cacheIsServerConfiguredKey,
    defaultValue: false,
  );

  if (isLoggedIn && isServerConfigured) {
    log("On va dans la route home");
    Get.offAll(
      () => const HomePage(),
    );
  } else if (isServerConfigured && !isLoggedIn) {
    log("On va dans route sign");

    Get.to(
      () => SignInPage(),
    );
  } else {
    Get.to(
      () => const FullAuthPage(),
    );
  }
}
