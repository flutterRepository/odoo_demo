import 'package:flutter/material.dart';

class AppColors {
  AppColors._();

  static Color black = HexColor("#212121");
  static const homeBlack = Color(0xFF323643);
  static const subTitle = Color(0xFF707070);
  static const hintColor = Color(0xFFbabbbf);
  static const blue = Color(0xFF3277D8);
  static Color grey = HexColor("#757575");
  static Color lightGrey = HexColor("#9E9E9E");
  static Color greenColor = HexColor("#1BC500");
  static Color blueBgColor = HexColor("#2C5BDC");
  static Color textFieldBackgroundColor = HexColor("#FAFAFA");
  static Color backgroundColor = HexColor("#F5F5F5");
  static Color blueDotColor = HexColor("#2081FF");
  static Color greyDotColor = HexColor("#E0E0E0");
  static Color blueButtonColor = HexColor("#2081FF");
  static Color orange = HexColor("#F57C51");
  static Color dropDownArrowColor = HexColor("#424242");

  static Color homeProposalSentBg = HexColor("#FFF3DA");
  static Color homeCandidateLikeBg = HexColor("#DDEEFF");
  static Color blueTextColor = HexColor("#2C5BDC");
  static Color borderColor = HexColor("#EEEEEE");
  static Color borderColorSingleLine = HexColor("#E0E0E0");

  static Color iconColor = HexColor("#2E3A59");
  static Color progressBackColor = HexColor("#D5FCDA");
  static Color longTermBackColor = HexColor("#FFF3DA");
  static Color badgeColor = HexColor("#FF7C70");

  static Color statusAccept = HexColor("#189A75");
  static Color statusNotAccept = HexColor("#DB5251");
  static Color statusAcceptBg = HexColor("#D4FCD9");
  static Color statusNotAcceptBg = HexColor("#FFEEE2");

  static const textColor1 = Color(0xFF989acd);
  static const textColor2 = Color(0xFF878593);
  static const bigtextColor = Color(0xFF2e2e31);

  static const mainColor = Color(0xFF5d69b3);
  static const starColor = Color(0xFFe7bb4e);
  static const mainTextColor = Color(0xFFababad);
  static const bottomBackgroud = Color(0xFFf1f2f1);

  static MaterialColor orangeThemeColor = const MaterialColor(
    0xFFF57C51,
    <int, Color>{
      50: Color(0xFFF57C51),
      100: Color(0xFFF57C51),
      200: Color(0xFFF57C51),
      300: Color(0xFFF57C51),
      400: Color(0xFFF57C51),
      500: Color(0xFFF57C51),
      600: Color(0xFFF57C51),
      700: Color(0xFFF57C51),
      800: Color(0xFFF57C51),
      900: Color(0xFFF57C51),
    },
  );
}

class HexColor extends Color {
  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF" + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }

  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
}
