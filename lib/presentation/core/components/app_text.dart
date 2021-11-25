import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:odoo_demo/presentation/core/utils/core/constants.dart';

class AppText extends StatelessWidget {
  final double textSize;
  final String text;
  final Color color;
  const AppText({
    Key? key,
    this.textSize = 16,
    required this.text,
    this.color = d_red,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: color,
        fontSize: textSize,
      ),
    );
  }
}
