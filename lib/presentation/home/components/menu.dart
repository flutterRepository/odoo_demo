import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:odoo_demo/presentation/core/utils/core/constants.dart';

class MenuCardList extends StatelessWidget {
  final String title;
  final IconData icon;
  final VoidCallback press;
  final bool inactiveColor;
  const MenuCardList({
    Key? key,
    required this.title,
    required this.icon,
    required this.press,
    this.inactiveColor = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: inactiveColor ? d_red : Colors.transparent,
      child: ListTile(
        onTap: press,
        leading: Icon(
          icon,
          color: inactiveColor ? Colors.white : d_red,
        ),
        title: Text(
          title,
          style: TextStyle(
            color: inactiveColor ? Colors.white : Colors.grey,
          ),
        ),
      ),
    );
  }
}
