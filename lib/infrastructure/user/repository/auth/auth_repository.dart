import 'dart:async';
import 'dart:developer';

import 'package:get/get.dart';
import 'package:odoo_demo/domain/users/user_record.dart';
import 'package:odoo_demo/infrastructure/apis/hive_cache_factory.dart';
import 'package:odoo_demo/infrastructure/apis/odoo_client_factory.dart';
import 'package:odoo_demo/infrastructure/apis/odoo_env_factory.dart';
import 'package:odoo_demo/infrastructure/core/config.dart';
import 'package:odoo_demo/infrastructure/core/session/session_changed.dart';
import 'package:odoo_demo/infrastructure/core/utils/status_widget.dart';
import 'package:odoo_demo/infrastructure/user/repository/user_repository.dart';
import 'package:odoo_demo/presentation/home/home_page.dart';
import 'package:odoo_demo/presentation/user/auth/sign_in_page.dart';
import 'package:odoo_repository/odoo_repository.dart';
import 'package:odoo_rpc/odoo_rpc.dart';
import 'package:odoo_demo/infrastructure/localestorage/hive_storage/hive_impl.dart';

class AuthRepository extends OdooRepository<User> {
  /// [User] repository interagissant avec le cache locale et l'instance remote
  /// pour offrir l'accès du User à ces données en hor connexion

  @override
  final String modelName = "res.users";

  /// Nous avons besoin seulement d'un enregistrement de notre [User]
  @override
  int remoteRecordsCount = 1;

  ///Initialises [UserRepository] avec un [OdooClient] donné
  AuthRepository() : super(OdooEnvFactory.odooEnv!) {
    /// track si la session est détruite
    /// Tout appel ORM échouera dû à l'expiration de la session
    /// le Web devra killer le [User] dans ce cas
    OdooEnvFactory.odooEnv!.orpc.sessionStream
        .listen(SessionHandler.sessionChanged);
  }

  Future<void> signIn({
    String? dbName,
    required String login,
    required String password,
  }) async {
    final sessionChangedHandler = storeSession(HiveCacheFactory.hiveCache!);
    OdooClientFactory.odooclient!.sessionStream.listen(sessionChangedHandler);
    try {
      logger.d("Authentification de l'utilisateur `$login`");
      String odooDbName = dbName ??
          HiveCacheFactory.hiveCache!.get(
            Config.cacheOdooDbNameKey,
            defaultValue: Config.odooDbName,
          );
      await OdooEnvFactory.odooEnv!.orpc
          .authenticate(odooDbName, login, password)
          .then((value) {
        log("La session est ${OdooEnvFactory.odooEnv!.orpc.sessionId}");

        final sessionChangedHandler = storeSession(HiveCacheFactory.hiveCache!);
        OdooClientFactory.odooclient!.sessionStream
            .listen(sessionChangedHandler);
        Get.offAll(
          () => const HomePage(),
        );
        log("Authentifé");
        OdooEnvFactory.odooEnv!.of<UserRepository>().setCurrentUser();

        HiveCacheFactory.hiveCache!.put(Config.cacheIsLoggedInKey, true);
        HiveCacheFactory.hiveCache!
            .put(Config.cacheIsServerConfiguredKey, true);
        HiveCacheFactory.hiveCache!.put(Config.cacheOdooDbNameKey, odooDbName);
        HiveCacheFactory.hiveCache!.put(Config.cacheOdooServerURLKey,
            OdooClientFactory.odooclient!.baseURL);
        HiveCacheFactory.hiveCache!.put(
            Config.cacheSessionKey, OdooEnvFactory.odooEnv!.orpc.sessionId);
      });
      OdooClientFactory.odooclient!.sessionId!
          .updateSessionId(OdooEnvFactory.odooEnv!.orpc.sessionId!.toString());
      // unawaited(fetchRecords());

    } on OdooException catch (exception) {
      log("Erreur la voici =>: ${exception.message}");
      handleAPIError(
        errorCode: exception.message.toString().substring(0, 200),
        errorMessage: "Erreur Odoo Exception, Imposible de se connecter",
      );
      if (recordStreamActive) {
        recordStreamController.addError("Imposible de se connecter");
      }
    } catch (exception) {
      log("Erreur la voici =>: $exception");
      handleAPIError(
        errorCode: exception.toString(),
        errorMessage: "Erreur d'autre exception",
      );
      if (recordStreamActive) {
        recordStreamController.addError("Erreur de réseau");
      }
    }
  }

  Future<void> fullAuth({
    required String serverURL,
    required String dbName,
    required String login,
    required String password,
  }) async {
    final sessionChangedHandler = storeSession(HiveCacheFactory.hiveCache!);
    OdooClientFactory.odooclient!.sessionStream.listen(sessionChangedHandler);
    OdooClientFactory.odooclient!.baseURL = serverURL;
    // Config.odooDbName = dbName;
    // Config.odooServerURL = serverURL;
    final authRepo = OdooEnvFactory.odooEnv!.of<AuthRepository>();

    await authRepo
        .signIn(
      dbName: dbName,
      login: login,
      password: password,
    )
        .then((value) {
      log("C'est authentifié");
    });
  }

  void logOutUser() {
    clearCaches();
    OdooEnvFactory.odooEnv!.orpc
        .destroySession()
        .then((value) => clearRecords());
    HiveCacheFactory.hiveCache!.put(Config.cacheIsLoggedInKey, false);
    Get.offAll(() => const SignInPage());
  }

  @override
  User createRecordFromJson(Map<String, dynamic> json) {
    return User.fromJson(json);
  }
}
