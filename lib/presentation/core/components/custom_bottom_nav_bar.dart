import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:odoo_demo/presentation/core/utils/core/enum_constants.dart';
import 'package:odoo_demo/presentation/home/home_page.dart';
import 'package:odoo_demo/presentation/user/partners/partners_page.dart';

class CustomBottomNavBar extends StatelessWidget {
  const CustomBottomNavBar({
    Key? key,
    required this.selectedMenu,
  }) : super(key: key);

  final MenuState selectedMenu;

  @override
  Widget build(BuildContext context) {
    const Color inActiveIconColor = Color(0xFFB6B6B6);
    log("La selection est =>: $selectedMenu");
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(40),
          topRight: Radius.circular(40),
        ),
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, -15),
            blurRadius: 20,
            color: const Color(0xFFDADADA).withOpacity(0.7),
          ),
        ],
      ),
      child: SafeArea(
        top: false,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              icon: SvgPicture.asset(
                "assets/icons/home.svg",
                color: selectedMenu == MenuState.home
                    ? Colors.black
                    : Colors.grey.withOpacity(0.3),
              ),
              color: selectedMenu == MenuState.home
                  ? Colors.black
                  : Colors.grey.withOpacity(0.3),
              onPressed: () => Get.to(() => const HomePage()),
            ),
            IconButton(
                icon: SvgPicture.asset(
                  "assets/icons/Chat bubble Icon.svg",
                  color: selectedMenu == MenuState.messaging
                      ? Colors.black
                      : Colors.grey.withOpacity(0.3),
                ),
                color: selectedMenu == MenuState.messaging
                    ? Colors.black
                    : Colors.grey.withOpacity(0.3),
                onPressed: () {}),
            IconButton(
              icon: SvgPicture.asset(
                "assets/icons/User Icon.svg",
                color: selectedMenu == MenuState.partner
                    ? Colors.black
                    : Colors.grey.withOpacity(0.3),
              ),
              color: selectedMenu == MenuState.partner
                  ? Colors.black
                  : Colors.grey.withOpacity(0.3),
              onPressed: () => Get.to(() => const PartenrPage()),
            ),
          ],
        ),
      ),
    );
  }
}
