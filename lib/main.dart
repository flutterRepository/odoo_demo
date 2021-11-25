import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:odoo_demo/infrastructure/apis/hive_cache_factory.dart';
import 'package:odoo_demo/infrastructure/apis/odoo_env_factory.dart';
import 'package:odoo_demo/infrastructure/user/repository/auth/auth_repository.dart';
import 'package:odoo_demo/infrastructure/user/repository/partner_repository.dart';
import 'package:odoo_demo/infrastructure/user/repository/user_repository.dart';
import 'package:odoo_demo/presentation/home/home_page.dart';
import 'package:odoo_demo/presentation/user/auth/full_auth_page.dart';
import 'package:odoo_demo/presentation/user/auth/sign_in_page.dart';

import 'package:odoo_demo/app/bindings/initial_bindings.dart';
import 'package:odoo_demo/infrastructure/core/config.dart';
import 'package:odoo_demo/presentation/core/services/theme_service.dart';
import 'package:odoo_demo/presentation/core/services/translations_service.dart';
import 'package:odoo_demo/presentation/core/theme/themes.dart';
import 'package:odoo_demo/presentation/routes/app_pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await HiveCacheFactory.initialiseHiveCache();

  bool isLoggedIn = HiveCacheFactory.hiveCache!.get(
    Config.cacheIsLoggedInKey,
    defaultValue: false,
  );
  log("L'état de la connexion dans le main est =>: $isLoggedIn");
  bool isServerConfigured = HiveCacheFactory.hiveCache!.get(
    Config.cacheIsServerConfiguredKey,
    defaultValue: false,
  );

  runApp(
    App(
      isLoggedIn: isLoggedIn,
      isServerConfigured: isServerConfigured,
    ),
  );
}

class App extends StatelessWidget {
  final bool isLoggedIn;
  final bool isServerConfigured;
  const App({
    Key? key,
    required this.isLoggedIn,
    required this.isServerConfigured,
  }) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Odoo Demo',
      debugShowCheckedModeBanner: false,
      theme: Themes().lightTheme,
      darkTheme: Themes().darkTheme,
      themeMode: ThemeService().getThemeMode(),
      translations: Translation(),
      locale: Get.deviceLocale,
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      fallbackLocale: const Locale('en', "US"),
      initialBinding: InitialBinding(),
      getPages: AppPages.pages,
      home: (isServerConfigured && isLoggedIn)
          ? const HomePage()
          : (isServerConfigured && !isLoggedIn)
              ? const SignInPage()
              : const FullAuthPage(),
      onInit: () {
        _setUpEnv();
      },
    );
  }

  _setUpEnv() async {
    log("On initilise l'environnement");
    // await DioHttpClientFactory.computeDeviceInfo();
    OdooEnvFactory.odooEnv!.add(AuthRepository());
    OdooEnvFactory.odooEnv!.add(UserRepository());
    OdooEnvFactory.odooEnv!.add(PartnerRepository());
  }
}
