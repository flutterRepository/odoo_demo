import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/state_manager.dart';
import 'package:odoo_demo/infrastructure/user/repository/auth/auth_repository.dart';

class AuthController extends GetxController {
  final AuthRepository _authRepository = AuthRepository();

  static AuthController get to => Get.find();

  fullAuth({
    required String serverURL,
    required String dbName,
    required String login,
    required String password,
  }) {
    _authRepository.fullAuth(
      serverURL: serverURL,
      dbName: dbName,
      login: login,
      password: password,
    );
  }

  signIn({
    required String login,
    required String password,
  }) {
    _authRepository.signIn(
      login: login,
      password: password,
    );
  }

  logOutUser() => _authRepository.logOutUser();
}
