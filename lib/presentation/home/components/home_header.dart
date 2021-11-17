import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:odoo_demo/app/controllers/user/user_controller.dart';
import 'package:odoo_demo/presentation/core/components/icon_btn_with_counter.dart';
import 'package:odoo_demo/presentation/core/components/search_field.dart';
import 'package:odoo_demo/presentation/core/utils/size_config.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: getProportionateScreenWidth(7),
      ),
      child: Column(
        children: [
          Row(
            children: [
              GetX<UserController>(
                builder: (controller) {
                  print("count 1 reconstruction");
                  return Text(controller.currentUser.value.name);
                },
              ),
              if (UserController.to.currentUser.value.imageSmall.isNotEmpty)
                Image.network(UserController.to.currentUser.value.imageSmall),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                  onTap: () {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const SearchField(),
                      IconBtnWithCounter(
                        onTapCallBack: () {},
                        svgSrc: "assets/icons/User Icon.svg",
                        // numOfItem: 3,
                      ),
                    ],
                  )),
              IconBtnWithCounter(
                onTapCallBack: () {},
                svgSrc: "assets/icons/Bell.svg",
                numOfItem: 3,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
