import 'package:flutter/material.dart';

import 'package:odoo_demo/domain/users/user_record.dart';

class ProfileUserPage extends StatelessWidget {
  final User user;
  const ProfileUserPage({
    Key? key,
    required this.user,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile"),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text(user.name),
            ],
          ),
        ),
      ),
    );
  }
}
