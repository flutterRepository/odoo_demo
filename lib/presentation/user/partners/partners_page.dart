import 'package:flutter/material.dart';
import 'package:odoo_demo/presentation/core/components/custom_bottom_nav_bar.dart';
import 'package:odoo_demo/presentation/core/utils/core/enum_constants.dart';

class PartenrPage extends StatelessWidget {
  const PartenrPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Contacts"),
      ),
      body: const Center(
        child: Text(
          "Falcon",
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.w900,
          ),
        ),
      ),
      bottomNavigationBar: const CustomBottomNavBar(
        selectedMenu: MenuState.partner,
      ),
    );
  }
}
