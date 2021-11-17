import 'package:flutter/material.dart';

import 'package:odoo_demo/domain/users/partner_record.dart';

class PartnerDetailPage extends StatelessWidget {
  final Partner partner;
  const PartnerDetailPage({
    Key? key,
    required this.partner,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(partner.name),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            Center(
              child: Text(partner.email),
            )
          ],
        ),
      ),
    );
  }
}
