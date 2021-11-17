import 'package:get/get.dart';
import 'package:odoo_demo/app/translation/en.dart';
import 'package:odoo_demo/app/translation/fr.dart';

class Translation extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en': en,
        "fr": fr,
      };
}
