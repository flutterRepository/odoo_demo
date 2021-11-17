import 'dart:async';
import 'dart:developer';

import 'package:odoo_demo/app/controllers/user/user_controller.dart';
import 'package:odoo_demo/domain/users/user_record.dart';
import 'package:odoo_demo/infrastructure/apis/odoo_env_factory.dart';
import 'package:odoo_demo/infrastructure/core/session/session_changed.dart';
import 'package:odoo_repository/odoo_repository.dart';
import 'package:odoo_rpc/odoo_rpc.dart';

class UserRepository extends OdooRepository<User> {
  /// [User] repository interagissant avec le cache locale et l'instance remote
  /// pour offrir l'accès du User à ces données en hor connexion

  @override
  final String modelName = "res.users";

  /// Nous avons besoin seulement d'un enregistrement de notre [User]
  @override
  int remoteRecordsCount = 1;

  ///Initialises [UserRepository] avec un [OdooClient] donné
  UserRepository() : super(OdooEnvFactory.odooEnv!) {
    /// track si la session est détruite
    /// Tout appel ORM échouera dû à l'expiration de la session
    /// le Web devra killer le [User] dans ce cas
    OdooEnvFactory.odooEnv!.orpc.sessionStream
        .listen(SessionHandler.sessionChanged);
  }

  // Future<void> authenticateUser(
  //     {required String login, required String password}) async {
  //   try {
  //     logger.d("Authentification de l'utilisateur `$login`");
  //     await env.orpc.authenticate(env.dbName, login, password);
  //     unawaited(fetchRecords());
  //   } on OdooException {
  //     if (recordStreamActive) {
  //       recordStreamController.addError("Imposible de se connecter");
  //     }
  //   } catch (e) {
  //     if (recordStreamActive) {
  //       recordStreamController.addError("Erreur de réseau");
  //     }
  //   }
  // }

  // void logOutUser() {
  //   logger.d("Deconnexion du user `${latestRecords[0].login}`");
  //   clearCaches();
  //   env.orpc.destroySession().then((value) => clearRecords());
  // }

  // void sessionChanged(OdooSession sessionId) {
  //   if (sessionId.id == "") {
  //     logOutUser();
  //   }
  // }

  setCurrentUser() {
    return OdooEnvFactory.odooEnv!
        .of<UserRepository>()
        .recordStream
        .listen((user) async {
      log("SetUp de l'environnement");
      if (user[0] != UserController.to.currentUser.value) {
        log("Le user a changé à ${user[0]}");
      }
      UserController.to.currentUser.value = user[0];
    });
  }

  @override
  void clearRecords() {
    ///
    ///Nous avons besoin d'envoyer le [User] Public au lieu d'une list vide comme d'hab
    latestRecords = [User.pubicUser()];
    if (recordStreamActive) {
      recordStreamController.add(latestRecords);
    }
  }

  @override
  User createRecordFromJson(Map<String, dynamic> json) {
    return User.fromJson(json);
  }

  @override
  List<User> get records {
    if (!isAuthenticated) {
      latestRecords = [User.pubicUser()];
      return latestRecords;
    }

    var cacheUsers = super.records;
    if (cacheUsers.isEmpty) {
      cacheUsers.add(User.pubicUser());
      latestRecords = cacheUsers;
    }
    return cacheUsers;
  }

  @override
  Future<List<dynamic>> searchRead() async {
    /// Nous avons besoin de override la méthode searchRead parce que nous avons besoin de
    /// calculer l'url de l'image et le donamin en se basant le dernier id utilisé trouver dans la session
    var publicUserJson = User.pubicUser().toJson();
    if (!isAuthenticated) {
      return [publicUserJson];
    }
    try {
      final userId = env.orpc.sessionId!.userId;
      var res = await env.orpc.callKw(
        {
          "model": modelName,
          "method": "search_read",
          "args": [],
          "kwargs": {
            "context": {
              "bin_size": true,
            },
            "domain": [
              ['id', "=", userId],
            ],
            "fields": User.oFields,
            "limit": limit,
          },
        },
      );
      var avatarUrl = "";
      if (res.length == 1) {
        final image_field = env.orpc.sessionId!.serverVersion >= 13
            ? "image_128"
            : "image_small";
        var unique = res[0]["__last_update"] as String;
        unique = unique.replaceAll(RegExp(r'[^0-9]'), "");
        avatarUrl = env.orpc.baseURL +
            "/web/image?model=$modelName&field=$image_field&id=$userId&unique=$unique";
        res[0]["image_small"] = avatarUrl;
      } else {
        res.add(publicUserJson);
      }
      return res;
    } on OdooSessionExpiredException {
      return [publicUserJson];
    } on Exception {
      return [];
    }
  }
}
