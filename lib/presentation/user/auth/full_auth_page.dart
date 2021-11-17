import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:odoo_demo/app/controllers/user/auth_controller.dart';

import 'package:odoo_demo/presentation/core/components/delayed_animation.dart';
import 'package:odoo_demo/presentation/core/others/welcom_page.dart';
import 'package:odoo_demo/presentation/core/utils/core/app_colors.dart';
import 'package:odoo_demo/presentation/core/utils/core/constants.dart';

class FullAuthPage extends StatefulWidget {
  const FullAuthPage({Key? key}) : super(key: key);

  @override
  State<FullAuthPage> createState() => _FullAuthPageState();
}

class _FullAuthPageState extends State<FullAuthPage> {
  final TextEditingController serverURLController = TextEditingController();

  final TextEditingController dbNameController = TextEditingController();

  final TextEditingController loginController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: () => Get.to(
            () => const WelcomePage(),
          ),
          icon: const Icon(
            Icons.close,
            size: 40,
          ),
        ),
        actions: [
          IconButton(
              onPressed: () {
                Get.bottomSheet(
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                    ),
                    child: Column(
                      children: const [
                        Text.rich(
                          TextSpan(
                            text: "Aide à la configuration \n",
                            style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                            ),
                            children: [
                              TextSpan(
                                text:
                                    "Vous devez faire entrer l'addres URL avec ce format suivant \n",
                                style: TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                              TextSpan(
                                  text: "Si c'est avec https sans le port: "),
                              TextSpan(
                                text: "https://monadresse.com \n",
                                style: TextStyle(
                                  color: Colors.blue,
                                ),
                              ),
                              TextSpan(
                                  text:
                                      "Si vous connaissez le port ajouteé-le comme "),
                              TextSpan(
                                text: "https://monadresse.com:8069",
                                style: TextStyle(
                                  color: Colors.blue,
                                ),
                              ),
                              TextSpan(
                                  text:
                                      "\n \n Si c'est avec http sans le port: "),
                              TextSpan(
                                text: "http://monadresse.com \n",
                                style: TextStyle(
                                  color: Colors.blue,
                                ),
                              ),
                              TextSpan(
                                  text:
                                      "Si vous connaissez le port ajouteé-le comme "),
                              TextSpan(
                                text: "http://monadresse.com:8069",
                                style: TextStyle(
                                  color: Colors.blue,
                                ),
                              ),
                              TextSpan(
                                text:
                                    "\n \n NB: Sans le port c'est le port 80 qui sera pris par défaut",
                                style: TextStyle(
                                  color: Colors.red,
                                ),
                              ),
                            ],
                          ),
                          // textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                );
              },
              icon: const Icon(Icons.help))
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                DelayAnimation(
                  delay: 1000,
                  fromTop: true,
                  child: Text(
                    "Configuration et authentification",
                    style: GoogleFonts.poppins(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      color: d_red,
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                DelayAnimation(
                  delay: 1200,
                  fromTop: true,
                  child: TextFormField(
                    controller: serverURLController,
                    keyboardType: TextInputType.url,
                    textInputAction: TextInputAction.done,
                    maxLines: 1,
                    style: TextStyle(
                      fontSize: 17,
                      color: AppColors.black,
                      fontWeight: FontWeight.normal,
                    ),
                    decoration: InputDecoration(
                      fillColor: AppColors.textFieldBackgroundColor,
                      filled: true,
                      hintText: "url".tr,
                      helperText:
                          "eg. http://agilorg.ma ou http://192.168.50.70:8069",
                      icon: const Icon(
                        Icons.public_sharp,
                        color: d_red,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(25)),
                        borderSide: BorderSide(
                          width: 1,
                          color: AppColors.borderColor,
                        ),
                      ),
                      // border: InputBorder.none,
                      focusedBorder: OutlineInputBorder(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(25)),
                        borderSide: BorderSide(
                          width: 1,
                          color: AppColors.borderColor,
                        ),
                      ),
                      hintStyle: TextStyle(
                        fontSize: 17,
                        color: AppColors.lightGrey,
                        fontWeight: FontWeight.normal,
                      ),
                      labelStyle: TextStyle(
                        fontSize: 17,
                        color: AppColors.lightGrey,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "SVP entrez l'adresse du serveur";
                      }
                      return null;
                    },
                  ),
                ),
                const SizedBox(height: 30),
                DelayAnimation(
                  delay: 1500,
                  fromTop: true,
                  child: TextFormField(
                    controller: dbNameController,
                    // keyboardType: TextInputType.url,
                    textInputAction: TextInputAction.done,
                    maxLines: 1,
                    style: TextStyle(
                      fontSize: 17,
                      color: AppColors.black,
                      fontWeight: FontWeight.normal,
                    ),
                    decoration: InputDecoration(
                      fillColor: AppColors.textFieldBackgroundColor,
                      filled: true,
                      hintText: "dbName".tr,
                      helperText: "eg. demo",
                      icon: const Icon(
                        Icons.storage,
                        color: d_red,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(25)),
                        borderSide: BorderSide(
                          width: 1,
                          color: AppColors.borderColor,
                        ),
                      ),
                      // border: InputBorder.none,
                      focusedBorder: OutlineInputBorder(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(25)),
                        borderSide: BorderSide(
                          width: 1,
                          color: AppColors.borderColor,
                        ),
                      ),
                      hintStyle: TextStyle(
                        fontSize: 17,
                        color: AppColors.lightGrey,
                        fontWeight: FontWeight.normal,
                      ),
                      labelStyle: TextStyle(
                        fontSize: 17,
                        color: AppColors.lightGrey,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "SVP entrez le nom de la base de donnée";
                      }
                      return null;
                    },
                  ),
                ),
                const SizedBox(height: 30),
                DelayAnimation(
                  delay: 1500,
                  child: TextFormField(
                    controller: loginController,
                    keyboardType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.done,
                    maxLines: 1,
                    style: TextStyle(
                      fontSize: 17,
                      color: AppColors.black,
                      fontWeight: FontWeight.normal,
                    ),
                    decoration: InputDecoration(
                      fillColor: AppColors.textFieldBackgroundColor,
                      filled: true,
                      hintText: "username".tr,
                      helperText: "eg. admin ou username@dmain.com",
                      icon: const Icon(
                        Icons.person,
                        color: d_red,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(25)),
                        borderSide: BorderSide(
                          width: 1,
                          color: AppColors.borderColor,
                        ),
                      ),
                      // border: InputBorder.none,
                      focusedBorder: OutlineInputBorder(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(25)),
                        borderSide: BorderSide(
                          width: 1,
                          color: AppColors.borderColor,
                        ),
                      ),
                      hintStyle: TextStyle(
                        fontSize: 17,
                        color: AppColors.lightGrey,
                        fontWeight: FontWeight.normal,
                      ),
                      labelStyle: TextStyle(
                        fontSize: 17,
                        color: AppColors.lightGrey,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "SVP entrez le nom d'utilisateur";
                      }
                      return null;
                    },
                  ),
                ),
                const SizedBox(height: 30),
                DelayAnimation(
                  delay: 1200,
                  child: TextFormField(
                    controller: passwordController,
                    obscureText: true,
                    textInputAction: TextInputAction.done,
                    maxLines: 1,
                    style: TextStyle(
                      fontSize: 17,
                      color: AppColors.black,
                      fontWeight: FontWeight.normal,
                    ),
                    decoration: InputDecoration(
                      fillColor: AppColors.textFieldBackgroundColor,
                      filled: true,
                      hintText: "password".tr,
                      icon: const Icon(
                        Icons.lock,
                        color: d_red,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(25)),
                        borderSide: BorderSide(
                          width: 1,
                          color: AppColors.borderColor,
                        ),
                      ),
                      // border: InputBorder.none,
                      focusedBorder: OutlineInputBorder(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(25)),
                        borderSide: BorderSide(
                          width: 1,
                          color: AppColors.borderColor,
                        ),
                      ),
                      hintStyle: TextStyle(
                        fontSize: 17,
                        color: AppColors.lightGrey,
                        fontWeight: FontWeight.normal,
                      ),
                      labelStyle: TextStyle(
                        fontSize: 17,
                        color: AppColors.lightGrey,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "SVP entrez le mot de passe";
                      }
                      return null;
                    },
                  ),
                ),
                const SizedBox(height: 40),
                DelayAnimation(
                  delay: 1000,
                  child: SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              duration: Duration(milliseconds: 7),
                              content: Text(
                                'Processing',
                                style: TextStyle(color: Colors.green),
                              ),
                            ),
                          );
                          AuthController.to.fullAuth(
                            serverURL: serverURLController.text,
                            dbName: dbNameController.text,
                            login: loginController.text,
                            password: passwordController.text,
                          );
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text(
                                'Erreur: Veillez remplir conformement tous les champs',
                                style: TextStyle(
                                  color: Colors.red,
                                ),
                              ),
                            ),
                          );
                        }
                      },
                      child: Text("send".tr),
                      style: ElevatedButton.styleFrom(
                        primary: d_red,
                        shape: const StadiumBorder(),
                        padding: const EdgeInsets.symmetric(horizontal: 40),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
