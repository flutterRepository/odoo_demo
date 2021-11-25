import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:odoo_demo/app/controllers/main/home_controller.dart';
import 'package:odoo_demo/presentation/core/components/custom_bottom_nav_bar.dart';
import 'package:odoo_demo/presentation/core/utils/core/app_colors.dart';
import 'package:odoo_demo/presentation/core/utils/core/enum_constants.dart';
import 'package:odoo_demo/presentation/core/utils/custom_sheet.dart';
import 'package:odoo_demo/presentation/core/utils/size_config.dart';
import 'package:odoo_demo/presentation/home/components/home_drawner.dart';
import 'package:odoo_demo/presentation/home/components/home_header.dart';
import 'package:odoo_demo/presentation/user/partners/partner_detail_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Scaffold(
      appBar: AppBar(
        // title: const Text("AO"),
        backgroundColor: Colors.transparent,

        elevation: 0,
        actions: [
          IconButton(
            onPressed: () {
              showLogoutDialog();
            },
            icon: const Icon(Icons.more_vert),
          ),
        ],
      ),
      drawer: const HomeDrawner(),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            children: [
              const HomeHeader(),
              const SizedBox(height: 20),
              const PartnersWidget(),
              ElevatedButton(
                  onPressed: () => HomeController.to.getPartners(),
                  child: const Text("Partners"))
            ],
          ),
        ),
      ),
      // bottomNavigationBar: const CustomBottomNavBar(
      //   selectedMenu: MenuState.home,
      // ),
    );
  }
}

class PartnersWidget extends StatelessWidget {
  const PartnersWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetX<HomeController>(
      builder: (controller) {
        return ListView.builder(
          shrinkWrap: true,
          physics: const ScrollPhysics(),
          itemCount: controller.listOfPartners.length,
          itemBuilder: (context, index) {
            // Partner parter = Partner.fromJson(controller.listOfPartners[index]);
            var partner = controller.listOfPartners[index];
            log("L'URL de l'image du partner est ${partner.imageSmall}");
            return ListTile(
              onTap: () => Get.to(() => PartnerDetailPage(
                    partner: partner,
                  )),
              leading: ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: partner.imageSmall.isNotEmpty
                    ? Image.network(
                        partner.imageSmall,
                        fit: BoxFit.cover,
                      )
                    : SvgPicture.asset("assets/icons/User Icon.svg"),
              ),
              title: Text(partner.name),
              subtitle: Text(partner.email),
            );
          },
        );
      },
    );
  }
}
