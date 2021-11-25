import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/state_manager.dart';
import 'package:odoo_demo/domain/users/partner_record.dart';
import 'package:odoo_demo/infrastructure/user/repository/partner_repository.dart';

class PartnerController extends GetxController {
  final PartnerRepository _partnerRepository = PartnerRepository();
  var listOfPartners = <Partner>[].obs;
  static PartnerController get to => Get.find();

  readPartners() async {
    return listOfPartners.value = await _partnerRepository.getPartners();
  }

  updatePartner({
    required Partner partner,
  }) =>
      _partnerRepository.updatePartner(partner: partner).then((value) {
        if (value) {
          Get.back();
        }
      });
}
