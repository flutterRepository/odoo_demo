import 'package:flutter/material.dart';
import 'package:odoo_demo/presentation/core/components/app_text.dart';

import 'package:odoo_demo/presentation/core/utils/core/app_colors.dart';

class AppResponsiveButton extends StatelessWidget {
  final bool isResponsive;
  final double? width;
  final VoidCallback onTap;
  const AppResponsiveButton({
    Key? key,
    this.isResponsive = false,
    this.width,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.only(left: 7),
          width: isResponsive ? double.maxFinite : width,
          height: 55,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: AppColors.mainColor,
          ),
          child: Row(
            mainAxisAlignment: isResponsive
                ? MainAxisAlignment.spaceBetween
                : MainAxisAlignment.center,
            children: [
              isResponsive
                  ? Container(
                      margin: const EdgeInsets.only(left: 20),
                      child: const AppText(
                        text: "Parcourir",
                        color: Colors.white,
                      ),
                    )
                  : Container(),
              Image.asset("assets/img/button-one.png"),
            ],
          ),
        ),
      ),
    );
  }
}
