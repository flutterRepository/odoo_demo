import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:odoo_demo/app/cubits/app_cubit_states.dart';
import 'package:odoo_demo/app/cubits/app_cubits.dart';
import 'package:odoo_demo/presentation/core/components/app_large_text.dart';
import 'package:odoo_demo/presentation/core/components/app_text.dart';
import 'package:odoo_demo/presentation/core/components/app_responsive_button.dart';
import 'package:odoo_demo/presentation/core/others/nav_pages/app_buttons.dart';
import 'package:odoo_demo/presentation/core/utils/core/app_colors.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({Key? key}) : super(key: key);

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  final int _gottenStars = 4;
  int _selectedIndex = -1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<AppCubits, AppCubitStates>(
        builder: (context, state) {
          DetailState detail = state as DetailState;

          return Container(
            width: double.maxFinite,
            height: double.maxFinite,
            child: Stack(
              children: [
                Positioned(
                  left: 0,
                  right: 0,
                  child: Container(
                    width: double.maxFinite,
                    height: MediaQuery.of(context).size.height * 0.51,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(
                          "http://mark.bslmeiyu.com/uploads/" +
                              detail.place.img,
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 15,
                  top: 40,
                  child: Row(
                    children: [
                      IconButton(
                        onPressed: () =>
                            BlocProvider.of<AppCubits>(context).goHome(),
                        icon: const Icon(
                          Icons.menu,
                          size: 33,
                        ),
                        color: Colors.white,
                      )
                    ],
                  ),
                ),
                Positioned(
                  top: MediaQuery.of(context).size.height * 0.47,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 30),
                    width: MediaQuery.of(context).size.width,
                    height: 500,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            AppLargeText(
                              text: detail.place.name,
                              color: Colors.black45,
                            ),
                            AppLargeText(
                              text: "\$${detail.place.price}",
                              color: AppColors.mainColor,
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        Row(
                          children: [
                            const Icon(
                              Icons.location_on,
                              color: AppColors.mainColor,
                            ),
                            AppText(
                              text: " ${detail.place.location}",
                              color: AppColors.textColor1,
                            )
                          ],
                        ),
                        const SizedBox(height: 20),
                        Row(
                          children: [
                            Wrap(
                              children: List.generate(
                                5,
                                (index) => Icon(
                                  Icons.star,
                                  color: index < detail.place.stars
                                      ? AppColors.starColor
                                      : AppColors.textColor2,
                                ),
                              ),
                            ),
                            const AppText(
                              text: "   (4.0)",
                              color: AppColors.textColor2,
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        AppLargeText(
                          text: "Section 1",
                          color: Colors.black.withOpacity(0.7),
                          textSize: 20,
                        ),
                        const SizedBox(height: 5),
                        const AppText(
                          text: "Nettoyage complète",
                          color: AppColors.mainTextColor,
                        ),
                        Wrap(
                          children: List.generate(
                            5,
                            (index) => InkWell(
                              onTap: () {
                                setState(() {
                                  _selectedIndex = index;
                                });
                              },
                              child: Container(
                                margin: const EdgeInsets.only(right: 10),
                                child: AppButtons(
                                  color: _selectedIndex == index
                                      ? Colors.white
                                      : Colors.black,
                                  backgroundColor: _selectedIndex == index
                                      ? Colors.black
                                      : AppColors.bottomBackgroud,
                                  size: 50,
                                  borderColor: _selectedIndex == index
                                      ? Colors.black
                                      : AppColors.bottomBackgroud,
                                  text: "${1 + index}",
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        AppLargeText(
                          text: "Description",
                          color: Colors.black.withOpacity(0.8),
                          textSize: 20,
                        ),
                        const SizedBox(height: 5),
                        AppText(
                          text: detail.place.description,
                          color: AppColors.mainTextColor,
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  bottom: 20,
                  left: 20,
                  right: 20,
                  child: Row(
                    children: [
                      const AppButtons(
                        size: 60,
                        color: AppColors.textColor1,
                        backgroundColor: Colors.white,
                        borderColor: AppColors.textColor1,
                        isIcon: true,
                        icon: Icons.favorite_border,
                      ),
                      const SizedBox(width: 12),
                      AppResponsiveButton(
                        onTap: () {},
                        isResponsive: true,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
