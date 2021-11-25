import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class AppLargeText extends StatelessWidget {
  final double textSize;
  final String text;
  final Color color;
  const AppLargeText({
    Key? key,
    this.textSize = 30,
    required this.text,
    this.color = Colors.black,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: color,
        fontSize: textSize,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
