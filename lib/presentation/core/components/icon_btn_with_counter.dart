import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:odoo_demo/presentation/core/utils/core/constants.dart';
import 'package:odoo_demo/presentation/core/utils/size_config.dart';


class IconBtnWithCounter extends StatelessWidget {
  final String svgSrc;
  final int numOfItem;
  final GestureTapCallback? onTapCallBack;
  const IconBtnWithCounter({
    Key? key,
    required this.svgSrc,
    this.numOfItem = 0,
    required this.onTapCallBack,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTapCallBack,
      borderRadius: BorderRadius.circular(50),
      child: Stack(
        // overflow: Overflow.visible,
        clipBehavior: Clip.antiAlias,
        children: [
          Container(
            padding: EdgeInsets.all(getProportionateScreenWidth(12)),
            height: getProportionateScreenWidth(46),
            width: getProportionateScreenWidth(46),
            decoration: BoxDecoration(
                color: kkSecondaryColor.withOpacity(0.1),
                shape: BoxShape.circle),
            child: SvgPicture.asset(svgSrc),
          ),
          if (numOfItem != 0)
            Positioned(
              // top: -3,
              right: 0,
              child: Container(
                height: getProportionateScreenWidth(16),
                width: getProportionateScreenWidth(16),
                decoration: BoxDecoration(
                  color: const Color(0xFFFF4848),
                  shape: BoxShape.circle,
                  border: Border.all(width: 1.5, color: Colors.white),
                ),
                child: Center(
                  child: Text(
                    "$numOfItem",
                    style: TextStyle(
                        fontSize: getProportionateScreenWidth(10),
                        height: 1,
                        color: Colors.white,
                        fontWeight: FontWeight.w900),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
