import 'package:flutter/material.dart';
import 'package:odoo_demo/presentation/core/components/app_text.dart';

class AppButtons extends StatelessWidget {
  final Color color;
  final Color backgroundColor;
  final double size;
  final Color borderColor;
  final String? text;
  final IconData? icon;
  final bool isIcon;
  const AppButtons({
    Key? key,
    required this.size,
    required this.color,
    required this.backgroundColor,
    required this.borderColor,
    this.text,
    this.icon,
    this.isIcon = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: backgroundColor,
          border: Border.all(
            color: borderColor,
            width: 1.0,
          ),
        ),
        child: Center(
          child: isIcon
              ? Icon(
                  icon,
                  color: color,
                )
              : AppText(
                  text: text!,
                  color: color,
                ),
        ));
  }
}
