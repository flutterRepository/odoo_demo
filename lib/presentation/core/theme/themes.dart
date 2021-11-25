import 'package:flutter/material.dart';
import 'package:odoo_demo/presentation/core/utils/core/app_colors.dart';

class Themes {
  final lightTheme = ThemeData.light().copyWith(
    primaryColor: Colors.red,
    cardColor: Colors.white,
    scaffoldBackgroundColor: AppColors.backgroundColor, // Colors.grey[200],
    shadowColor: Colors.grey,
    // colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Colors.amber),
  );
  final darkTheme = ThemeData.dark().copyWith(
    primaryColor: Colors.grey[900],
    cardColor: Colors.grey[900],
    scaffoldBackgroundColor: Colors.grey[800],
    shadowColor: Colors.grey,
    // colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Colors.grey[300]),
  );
}
