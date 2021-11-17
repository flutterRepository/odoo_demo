import 'package:flutter/material.dart';
import 'package:odoo_demo/presentation/core/utils/core/constants.dart';
import 'package:odoo_demo/presentation/core/utils/size_config.dart';

class SearchField extends StatelessWidget {
  const SearchField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: SizeConfig.screenWidth! * 0.6,
      height: 50,
      decoration: BoxDecoration(
        color: kkSecondaryColor.withOpacity(0.1),
        borderRadius: BorderRadius.circular(15),
      ),
      child: TextField(
        readOnly: true,
        onChanged: (value) {
          //Lancer la recherche
        },
        onTap: () {},
        decoration: InputDecoration(
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
          hintText: "Recherches",
          prefixIcon: const Icon(
            Icons.search,
            color: d_red,
          ),
          contentPadding: EdgeInsets.symmetric(
            horizontal: getProportionateScreenWidth(20),
            vertical: getProportionateScreenWidth(9),
          ),
        ),
      ),
    );
  }
}
