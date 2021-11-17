import 'package:flutter/material.dart';
import 'package:odoo_demo/presentation/home/components/menu.dart';

class HomeDrawner extends StatelessWidget {
  const HomeDrawner({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 20,
      semanticLabel: "Agil Org",
      child: ListView(
        children: [
          const DrawerHeader(
              child: Center(
            child: Text(
              "AgilOrg",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
          )),
          MenuCardList(
            title: "Dashboard",
            icon: Icons.dashboard,
            inactiveColor: true,
            press: () {},
          ),
          MenuCardList(
            title: "Rôles",
            icon: Icons.handyman,
            press: () {},
          ),
          MenuCardList(
            title: "Favorite",
            icon: Icons.favorite_outline,
            press: () {},
          ),
          MenuCardList(
            title: "Messages",
            icon: Icons.email_outlined,
            press: () {},
          ),
          MenuCardList(
            title: "Transactions",
            icon: Icons.account_balance_wallet_outlined,
            press: () {},
          ),
          MenuCardList(
            title: "Paramètres",
            icon: Icons.settings,
            press: () {},
          ),
          MenuCardList(
            title: "Deconnexion",
            icon: Icons.logout,
            press: () {},
          ),
        ],
      ),
    );
  }
}
