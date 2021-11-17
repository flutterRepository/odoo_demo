import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:odoo_demo/app/controllers/main/unknown_route_controller.dart';
import 'package:odoo_demo/presentation/routes/app_routes.dart';

class UnknownRoutePage extends GetView<UnknownRouteController> {
  const UnknownRoutePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          children: [
            const Text(
                "Page inconnue, veillez vous retourner à page d'entrée afin de bien repartir"),
            ElevatedButton(
              onPressed: () => Get.to(AppRoutes.HOME),
              child: const Text("Inconnu page"),
            )
          ],
        ),
      ),
    );
  }
}
