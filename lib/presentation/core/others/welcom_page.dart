import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:odoo_demo/presentation/core/components/app_large_text.dart';
import 'package:odoo_demo/presentation/core/components/app_text.dart';
import 'package:odoo_demo/presentation/core/components/app_responsive_button.dart';
import 'package:odoo_demo/presentation/core/others/nav_pages/main_page.dart';
import 'package:odoo_demo/presentation/core/utils/core/app_colors.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  final List _images = [
    "assets/img/welcome-one.png",
    "assets/img/welcome-two.png",
    "assets/img/welcome-three.png",
  ];
  final List _text = [
    "Agil Org",
    "Le grand Magreb",
    "L'Afrique",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
          scrollDirection: Axis.vertical,
          itemCount: _images.length,
          itemBuilder: (_, index) {
            return Container(
              width: double.maxFinite,
              height: double.maxFinite,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(_images[index]),
                  fit: BoxFit.cover,
                ),
              ),
              child: Container(
                margin: const EdgeInsets.only(top: 150, left: 20, right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AppLargeText(text: _text[index]),
                        const AppText(
                          text: "Informatique libre&Agil",
                          textSize: 30,
                        ),
                        const SizedBox(height: 20),
                        const SizedBox(
                          width: 250,
                          child: AppText(
                            text:
                                "Du mobile au Web, nous vous accompagnons sur toutes votre système d'information et vos solutions de mobilité",
                            color: AppColors.textColor2,
                            textSize: 14,
                          ),
                        ),
                        const SizedBox(height: 40),
                        AppResponsiveButton(
                          width: 120,
                          // onTap: () => stateNavigation(),
                          onTap: () => Get.to(() => const MainPage()),
                        ),
                      ],
                    ),
                    Column(
                      // crossAxisAlignment: CrossAxisAlignment.end,
                      children: List.generate(_images.length, (dotIndex) {
                        return Container(
                          margin: const EdgeInsets.only(bottom: 2),
                          width: 8,
                          height: index == dotIndex ? 25 : 10,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: index == dotIndex
                                ? AppColors.mainColor
                                : AppColors.mainColor.withOpacity(0.5),
                          ),
                        );
                      }),
                    ),
                  ],
                ),
              ),
            );
          }),
    );
  }
}

// class WelcomePage extends StatelessWidget {
//   const WelcomePage({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: grisBg,
//       body: SingleChildScrollView(
//         child: Container(
//           margin: const EdgeInsets.symmetric(vertical: 60, horizontal: 30),
//           child: Column(
//             children: [
//               DelayAnimation(
//                 delay: 1000,
//                 child: SizedBox(
//                     height: 150, child: Image.asset("assets/images/agil.jpeg")),
//               ),
//               const SizedBox(height: 40),
//               const DelayAnimation(
//                 delay: 2000,
//                 child: SizedBox(
//                   child: Text(
//                     "AilOrg",
//                     style: TextStyle(
//                       fontSize: 23,
//                       fontWeight: FontWeight.w900,
//                     ),
//                   ),
//                 ),
//               ),
//               DelayAnimation(
//                 delay: 3000,
//                 child: Container(
//                   margin: const EdgeInsets.only(top: 30, bottom: 20),
//                   child: Text(
//                     "Team Flutter, Digitalisation sans fin",
//                     textAlign: TextAlign.center,
//                     style: GoogleFonts.poppins(
//                       color: Colors.grey,
//                       fontSize: 16,
//                     ),
//                   ),
//                 ),
//               ),
//               DelayAnimation(
//                 fromTop: false,
//                 delay: 1000,
//                 child: SizedBox(
//                   width: double.infinity,
//                   child: ElevatedButton(
//                     onPressed: () => stateNavigation(),
//                     child: const Text("GET STARTED"),
//                     style: ElevatedButton.styleFrom(
//                       primary: d_red,
//                       shape: const StadiumBorder(),
//                       padding: const EdgeInsets.all(15),
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
