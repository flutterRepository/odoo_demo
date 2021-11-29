import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:odoo_demo/infrastructure/core/utils/util.dart';
import 'package:odoo_demo/presentation/core/components/delayed_animation.dart';
import 'package:odoo_demo/presentation/core/utils/core/constants.dart';

class SimpleWelcomePage extends StatelessWidget {
  const SimpleWelcomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: grisBg,
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: 60, horizontal: 30),
          child: Column(
            children: [
              DelayAnimation(
                delay: 1000,
                child: SizedBox(
                    height: 150, child: Image.asset("assets/images/agil.jpeg")),
              ),
              const SizedBox(height: 40),
              const DelayAnimation(
                delay: 2000,
                child: SizedBox(
                  child: Text(
                    "AilOrg",
                    style: TextStyle(
                      fontSize: 23,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),
              ),
              DelayAnimation(
                delay: 3000,
                child: Container(
                  margin: const EdgeInsets.only(top: 30, bottom: 20),
                  child: Text(
                    "Team Flutter, Digitalisation sans fin",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                      color: Colors.grey,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
              DelayAnimation(
                fromTop: false,
                delay: 1000,
                child: SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () => stateNavigation(),
                    child: const Text("GET STARTED"),
                    style: ElevatedButton.styleFrom(
                      primary: d_red,
                      shape: const StadiumBorder(),
                      padding: const EdgeInsets.all(15),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
