import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:odoo_demo/app/controllers/user/auth_controller.dart';
import 'package:odoo_demo/presentation/core/utils/core/app_colors.dart';

typedef void OnChangeCountryCode(CountryCode countryCode);
typedef void OnFieldSubmitted(String text);

class TextInput extends StatelessWidget {
  TextEditingController controller;
  String? validationMsg,
      hintText,
      labelText,
      helperText,
      prefixText,
      suffixText;
  Widget? prefix, suffix;
  int? maxLength;
  bool? isPassword, countryCodeEnabled, isEnabled;
  bool? isSimpleField;
  BorderRadius? borderRadius;
  TextInputType? textInputType;
  OnChangeCountryCode? onChangeCountryCode;
  TextInputAction? textInputAction;
  OnFieldSubmitted? onFieldSubmitted;
  FocusNode? focusNode;

  void Function(String)? onChanged;
  void Function()? onTap;
  void Function()? onEditingComplete;
  void Function(String?)? onSaved;
  String? Function(String?)? validator;

  TextInput({
    Key? key,
    this.validationMsg,
    required this.controller,
    this.helperText,
    this.suffixText,
    this.prefixText,
    this.prefix,
    this.labelText,
    this.hintText,
    this.suffix,
    this.textInputType,
    this.isPassword,
    this.maxLength,
    this.countryCodeEnabled,
    this.borderRadius,
    this.isSimpleField,
    this.onChangeCountryCode,
    this.textInputAction,
    this.onFieldSubmitted,
    this.focusNode,
    this.isEnabled,
    this.onChanged,
    this.onTap,
    this.onEditingComplete,
    this.onSaved,
    this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      minLines: 1,
      maxLines: isPassword != null && isPassword == true ? 1 : 4,
      onFieldSubmitted: (value) =>
          onFieldSubmitted != null ? onFieldSubmitted!(value) : null,
      focusNode: focusNode ?? null,
      readOnly: isEnabled ?? false,
      onChanged: onChanged ?? null,
      onTap: onTap ?? null,
      onEditingComplete: onEditingComplete ?? null,
      onSaved: onSaved ?? null,
      validator: validator ?? null,
      style: TextStyle(
        fontSize: 17,
        color: AppColors.black,
        fontWeight: FontWeight.normal,
      ),
      controller: controller,
      // validator: (String? value) {
      //   if (value == null) return null;
      //   return value.isEmpty ? validationMsg ?? null : null;
      // },
      maxLength: maxLength ?? null,
      obscureText: isPassword ?? false,
      keyboardType: textInputType ?? TextInputType.text,
      textInputAction: textInputAction ?? null,
      decoration: isSimpleField == true
          ? InputDecoration(
              enabledBorder: UnderlineInputBorder(
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
                height: 0,
              ),
              hintText: hintText ?? null,
              helperText: helperText ?? null,
              labelText: labelText ?? null,
              prefixIcon: prefix ?? null,
              suffixIcon: prefix ?? null,
              prefixText: prefixText ?? null,
              suffixText: suffixText ?? null,
              counterText: "",
              prefix: countryCodeEnabled == true
                  ? CountryCodePicker(
                      onChanged: (countryCode) {
                        onChangeCountryCode!(countryCode);
                      },
                      initialSelection: "MA",
                      showCountryOnly: true,
                      showOnlyCountryWhenClosed: false,
                      alignLeft: false,
                    )
                  : null,
            )
          : InputDecoration(
              fillColor: AppColors.textFieldBackgroundColor,
              filled: true,
              enabledBorder: OutlineInputBorder(
                borderRadius: borderRadius ?? BorderRadius.circular(5.0),
                borderSide: BorderSide(
                  width: 1,
                  color: AppColors.borderColor,
                ),
              ),
              border: OutlineInputBorder(
                borderRadius: borderRadius ??
                    BorderRadius.circular(
                      5.0,
                    ),
                borderSide: BorderSide(
                  width: 1,
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
              hintText: hintText ?? null,
              helperText: helperText ?? null,
              labelText: labelText ?? null,
              prefixIcon: prefix ?? null,
              suffixIcon: suffix ?? null,
              prefixText: prefixText ?? null,
              suffixText: suffixText ?? null,
              counterText: "",
              prefix: countryCodeEnabled == true
                  ? CountryCodePicker(
                      onChanged: (countryCode) {
                        onChangeCountryCode!(countryCode);
                      },
                      initialSelection: "MA",
                      showCountryOnly: true,
                      showOnlyCountryWhenClosed: false,
                      alignLeft: false,
                    )
                  : null,
            ),
    );
  }
}

class TextInputNotController extends StatelessWidget {
  final String? validationMsg,
      initialValue,
      hintText,
      labelText,
      helperText,
      prefixText,
      suffixText;
  final Widget? prefix, suffix;
  final int? maxLength;
  final bool? isPassword, countryCodeEnabled, isEnabled;
  final bool? isSimpleField;
  final BorderRadius? borderRadius;
  final TextInputType? textInputType;
  final OnChangeCountryCode? onChangeCountryCode;
  final TextInputAction? textInputAction;
  final OnFieldSubmitted? onFieldSubmitted;
  final FocusNode? focusNode;

  final void Function(String)? onChanged;
  final void Function()? onTap;
  final void Function()? onEditingComplete;
  final void Function(String?)? onSaved;
  final String? Function(String?)? validator;

  TextInputNotController({
    Key? key,
    this.validationMsg,
    this.initialValue,
    this.helperText,
    this.suffixText,
    this.prefixText,
    this.prefix,
    this.labelText,
    this.hintText,
    this.suffix,
    this.textInputType,
    this.isPassword,
    this.maxLength,
    this.countryCodeEnabled,
    this.borderRadius,
    this.isSimpleField,
    this.onChangeCountryCode,
    this.textInputAction,
    this.onFieldSubmitted,
    this.focusNode,
    this.isEnabled,
    this.onChanged,
    this.onTap,
    this.onEditingComplete,
    this.onSaved,
    this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: initialValue ?? "",
      minLines: 1,
      maxLines: isPassword != null && isPassword == true ? 1 : 4,
      onFieldSubmitted: (value) =>
          onFieldSubmitted != null ? onFieldSubmitted!(value) : null,
      focusNode: focusNode ?? null,
      readOnly: isEnabled ?? false,
      onChanged: onChanged ?? null,
      onTap: onTap ?? null,
      onEditingComplete: onEditingComplete ?? null,
      onSaved: onSaved ?? null,
      validator: validator ?? null,
      style: TextStyle(
        fontSize: 17,
        color: AppColors.black,
        fontWeight: FontWeight.normal,
      ),
      // validator: (String? value) {
      //   if (value == null) return null;
      //   return value.isEmpty ? validationMsg ?? null : null;
      // },
      maxLength: maxLength ?? null,
      obscureText: isPassword ?? false,
      keyboardType: textInputType ?? TextInputType.text,
      textInputAction: textInputAction ?? null,
      decoration: isSimpleField == true
          ? InputDecoration(
              enabledBorder: UnderlineInputBorder(
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
                height: 0,
              ),
              hintText: hintText ?? null,
              helperText: helperText ?? null,
              labelText: labelText ?? null,
              prefixIcon: prefix ?? null,
              suffixIcon: prefix ?? null,
              prefixText: prefixText ?? null,
              suffixText: suffixText ?? null,
              counterText: "",
              prefix: countryCodeEnabled == true
                  ? CountryCodePicker(
                      onChanged: (countryCode) {
                        onChangeCountryCode!(countryCode);
                      },
                      initialSelection: "MA",
                      showCountryOnly: true,
                      showOnlyCountryWhenClosed: false,
                      alignLeft: false,
                    )
                  : null,
            )
          : InputDecoration(
              fillColor: AppColors.textFieldBackgroundColor,
              filled: true,
              enabledBorder: OutlineInputBorder(
                borderRadius: borderRadius ?? BorderRadius.circular(5.0),
                borderSide: BorderSide(
                  width: 1,
                  color: AppColors.borderColor,
                ),
              ),
              border: OutlineInputBorder(
                borderRadius: borderRadius ??
                    BorderRadius.circular(
                      5.0,
                    ),
                borderSide: BorderSide(
                  width: 1,
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
              hintText: hintText ?? null,
              helperText: helperText ?? null,
              labelText: labelText ?? null,
              prefixIcon: prefix ?? null,
              suffixIcon: suffix ?? null,
              prefixText: prefixText ?? null,
              suffixText: suffixText ?? null,
              counterText: "",
              prefix: countryCodeEnabled == true
                  ? CountryCodePicker(
                      onChanged: (countryCode) {
                        onChangeCountryCode!(countryCode);
                      },
                      initialSelection: "MA",
                      showCountryOnly: true,
                      showOnlyCountryWhenClosed: false,
                      alignLeft: false,
                    )
                  : null,
            ),
    );
  }
}

InputDecoration inputUrldecon() => InputDecoration(
      enabledBorder: UnderlineInputBorder(
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
        height: 0,
      ),
      hintText: "url".tr,
      helperText: "eg. http://94.23.13.202:14022",
      suffix: serverValdateStatus(),
      counterText: "",
      prefix: Icon(Icons.public_sharp),
    );

Widget serverValdateStatus() {
  Future.delayed(Duration(microseconds: 3), () {
    CircularProgressIndicator();
  });
  return GetX<AuthController>(
    builder: (controller) {
      print("count 1 reconstruction");
      return true
          ? const Icon(
              Icons.check,
              color: Colors.green,
            )
          : Icon(
              Icons.warning,
              color: Colors.red[200],
            );
    },
  );
}
