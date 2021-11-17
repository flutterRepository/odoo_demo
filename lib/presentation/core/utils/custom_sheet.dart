import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:odoo_demo/app/controllers/user/auth_controller.dart';
import 'package:odoo_demo/presentation/core/utils/core/app_fonts.dart';
import 'package:odoo_demo/presentation/routes/app_routes.dart';

showSessionDialog() {
  Get.dialog(
    AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      title: Text(
        "Session Time out",
        style: AppFont.Title_H4_Medium(),
      ),
      content: Text(
        "Désolé ! Votre session a expiré. SVP reconnectez-vous",
        style: AppFont.Body2_Regular(),
      ),
      actions: [
        TextButton(
          onPressed: () async {
            Get.back();
            Get.toNamed(AppRoutes.SIGNIN);
          },
          child: Text(
            "signin".tr,
            style: AppFont.Body2_Regular(),
          ),
        )
      ],
    ),
  );
}

showNoBaseURLDialog() {
  Get.dialog(
    AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      title: Text(
        "Erreur d'adresse",
        style: AppFont.Title_H4_Medium(),
      ),
      content: Text(
        "Aucune URL laquelle faire les requete, veiller spécifier",
        style: AppFont.Body2_Regular(),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Get.back();
          },
          child: Text(
            "reprendre",
            style: AppFont.Body2_Regular(),
          ),
        )
      ],
    ),
  );
}

showLogoutDialog() {
  Get.dialog(
    AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      title: Text(
        "Deconnexion",
        style: AppFont.Title_H4_Medium(),
      ),
      content: Text(
        "Êtes-vous sûr de vouloir vous déconnecter ?",
        style: AppFont.Body2_Regular(),
      ),
      actions: [
        TextButton(
          onPressed: () async {
            Get.back();
          },
          child: Text(
            'cancel'.tr,
            style: AppFont.Body2_Regular(),
          ),
        ),
        TextButton(
            onPressed: () async {
              Get.back();
              // logoutAPI();
              AuthController.to.logOutUser();
            },
            child: Text(
              "logout".tr,
              style: AppFont.Body2_Regular(),
            ))
      ],
    ),
  );
}
