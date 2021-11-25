import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:odoo_demo/app/controllers/user/partner_controller.dart';
import 'package:odoo_demo/app/controllers/user/user_controller.dart';
import 'package:odoo_demo/domain/users/partner_record.dart';
import 'package:odoo_demo/presentation/core/components/delayed_animation.dart';
import 'package:odoo_demo/presentation/core/utils/core/app_colors.dart';
import 'package:odoo_demo/presentation/core/utils/core/constants.dart';

class PartnerEditPage extends StatefulWidget {
  final Partner partner;
  const PartnerEditPage({
    Key? key,
    required this.partner,
  }) : super(key: key);

  @override
  State<PartnerEditPage> createState() => _PartnerEditPageState();
}

class _PartnerEditPageState extends State<PartnerEditPage> {
  final TextEditingController emailController = TextEditingController();

  final TextEditingController nameController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    emailController.text = widget.partner.email;
    nameController.text = widget.partner.name;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Edit partner"),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                const DelayAnimation(
                  delay: 500,
                  fromTop: true,
                  child: Text(
                    "Edition d'un partner",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: d_red,
                      fontSize: 25,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                DelayAnimation(
                  delay: 1000,
                  fromTop: true,
                  child: TextFormField(
                    controller: nameController,
                    decoration: InputDecoration(
                      fillColor: AppColors.textFieldBackgroundColor,
                      filled: true,
                      hintText: "full_name".tr,

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
                      counterText: "",
                    ),
                    maxLength: 100,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Ce champ ne pas rester vide';
                      }
                      return null;
                    },
                  ),
                ),
                const SizedBox(height: 20),
                DelayAnimation(
                  delay: 1000,
                  child: TextFormField(
                    controller: emailController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      fillColor: AppColors.textFieldBackgroundColor,
                      filled: true,
                      hintText: "email".tr,

                      icon: const Icon(
                        Icons.email,
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
                      counterText: "",
                    ),
                    maxLength: 100,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Ce champ ne pas rester vide';
                      }
                      return null;
                    },
                  ),
                ),
                const SizedBox(height: 40),
                DelayAnimation(
                  delay: 500,
                  fromTop: false,
                  child: SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: d_red,
                        shape: const StadiumBorder(),
                      ),
                      onPressed: () {
                        // Validate returns true if the form is valid, or false otherwise.
                        if (_formKey.currentState!.validate()) {
                          // If the form is valid, display a snackbar. In the real world,
                          // you'd often call a server or save the information in a database.
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text(
                                'Processing Data',
                                style: TextStyle(color: Colors.green),
                              ),
                            ),
                          );

                          Partner _partner = Partner.fromJson(
                            {
                              "id": widget.partner.id,
                              "name": nameController.text,
                              "email": emailController.text,
                              "image_1920": widget.partner.imageSmall,
                            },
                          );
                          List<int> ids = [widget.partner.id];
                          PartnerController.to.updatePartner(partner: _partner);
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text(
                                'Erreur dans les données',
                                style: TextStyle(
                                  color: Colors.red,
                                ),
                              ),
                            ),
                          );
                        }
                      },
                      child: Text(
                        "update".tr,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
