import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:odoo_demo/presentation/core/utils/core/app_colors.dart';
import 'package:odoo_demo/presentation/core/utils/core/app_fonts.dart';

Future<void> ackAlert(
  BuildContext context,
  String title,
  String content,
  VoidCallback onPressed,
) {
  ///
  ///Affichage d'un simple bouton d'alerte
  return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          titleTextStyle: const TextStyle(
            fontFamily: AppFont.Roboto_Regular,
            fontSize: 21,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
          content: Text(content),
          contentTextStyle: const TextStyle(
            fontFamily: AppFont.Roboto_Regular,
            fontSize: 17,
            color: Colors.black,
            fontWeight: FontWeight.w500,
          ),
          actions: [
            TextButton(
                onPressed: onPressed,
                child: Text(
                  'done'.tr,
                  style: const TextStyle(
                    fontFamily: AppFont.Roboto_Regular,
                    fontSize: 17,
                    color: AppColors.blue,
                    fontWeight: FontWeight.bold,
                  ),
                ))
          ],
        );
      });
}

showLoading() {
  ///
  ///En cas de chargement, afficher un signe de chargement
  Get.dialog(
    const Center(
      child: SizedBox(
        child: FittedBox(
          child: CircularProgressIndicator(),
        ),
        height: 50.0,
        width: 50.0,
      ),
    ),
    barrierDismissible: false,
  );
}

hideLoading() {
  ///
  ///Cacher le signe de chargement en l'enlevant tout simplement sur l'écran
  Get.back();
}

void showSnackBar({
  ///
  ///Afficher un bottom widget qui disparait de lui même pour informations pas si importantes
  title,
  message,
  SnackPosition? snackPosition,
  Color? backgroundColor,
  Duration? duration,
}) {
  Get.showSnackbar(
    GetBar(
      title: title,
      message: message,
      duration: duration ?? const Duration(seconds: 3),
      snackPosition: snackPosition ?? SnackPosition.BOTTOM,
      backgroundColor: backgroundColor ?? Colors.black87,
    ),
  );
}

handleAPIError({required errorCode, required errorMessage}) {
  ///
  ///En cas d'erreur de connexion de l'API
  showSnackBar(
    duration: const Duration(seconds: 7),
    backgroundColor: Colors.redAccent,
    message: "$errorMessage code d'erreur $errorCode",
  );
}

handleAPIOdooError(
    {required title, required errorCode, required errorMessage}) {
  ///
  ///En cas d'erreur de connexion de l'API
  showSnackBar(
    duration: const Duration(
      seconds: 7,
    ),
    backgroundColor: Colors.redAccent,
    title: "$title: $errorCode",
    message: "$errorMessage code d'erreur $errorCode",
  );
}

showWarning(message) {
  ///
  ///Message d'avetissement pour une surcharge par exemple
  showSnackBar(backgroundColor: Colors.blueAccent, message: message);
}
