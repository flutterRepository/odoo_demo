import 'package:odoo_demo/infrastructure/apis/odoo_env_factory.dart';
import 'package:odoo_demo/infrastructure/user/repository/auth/auth_repository.dart';
import 'package:odoo_rpc/odoo_rpc.dart';

class SessionHandler {
  static void sessionChanged(OdooSession sessionId) {
    if (sessionId.id == "") {
      final authRepo = OdooEnvFactory.odooEnv!.of<AuthRepository>();

      authRepo.logOutUser();
    }
  }
}
