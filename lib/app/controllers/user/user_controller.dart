import 'package:get/get.dart';
import 'package:odoo_demo/domain/users/user_record.dart';
import 'package:odoo_demo/infrastructure/user/repository/user_repository.dart';

class UserController extends GetxController {
  var currentUser = User.pubicUser().obs;
  final UserRepository _userRepository = UserRepository();

  static UserController get to => Get.find();
}
