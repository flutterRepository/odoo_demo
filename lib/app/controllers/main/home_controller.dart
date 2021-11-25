import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/state_manager.dart';
import 'package:odoo_demo/domain/users/partner_record.dart';
import 'package:odoo_demo/infrastructure/user/repository/partner_repository.dart';

class HomeController extends GetxController {
  final PartnerRepository _partnerRepository = PartnerRepository();
  var listOfPartners = <Partner>[].obs;

  static HomeController get to => Get.find();

  @override
  void onInit() {
    super.onInit();
    getPartners();
  }

  getPartners() async {
    return listOfPartners.value = await _partnerRepository.getPartners();
  }
}
