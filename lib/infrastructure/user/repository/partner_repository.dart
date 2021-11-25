import 'dart:developer';

import 'package:odoo_demo/domain/users/partner_record.dart';
import 'package:odoo_demo/infrastructure/apis/hive_cache_factory.dart';
import 'package:odoo_demo/infrastructure/apis/odoo_client_factory.dart';
import 'package:odoo_demo/infrastructure/apis/odoo_env_factory.dart';
import 'package:odoo_demo/infrastructure/core/config.dart';
import 'package:odoo_demo/infrastructure/core/session/session_changed.dart';
import 'package:odoo_repository/odoo_repository.dart';
import 'package:odoo_rpc/odoo_rpc.dart';

class PartnerRepository extends OdooRepository<Partner> {
  @override
  final String modelName = "res.partner";

  PartnerRepository() : super(OdooEnvFactory.odooEnv!) {
    log("Le constructeur est tj appelé");
    OdooEnvFactory.odooEnv!.orpc.sessionStream
        .listen(SessionHandler.sessionChanged);
  }
  @override
  Partner createRecordFromJson(Map<String, dynamic> json) {
    return Partner.fromJson(json);
  }

  @override
  List<Partner> get records {
    // log("Les recups passent là");
    latestRecords = latestRecords;

    log("On a reçu =>: ${OdooEnvFactory.odooEnv!.of<PartnerRepository>().isAuthenticated}");
    return super.records;
  }

  List<Partner> getPartners() {
    try {
      log("La session en cache est =>: ${HiveCacheFactory.hiveCache!.get(Config.cacheSessionKey)}");
      log("L'id session en cache est =>: ${OdooClientFactory.odooclient!.sessionId}");
      log("L'URL en cache est =>: ${OdooClientFactory.odooclient!.baseURL}");

      return records;
    } on OdooSessionExpiredException catch (exception) {
      log("Session expiré qui est $exception ");

      return List<Partner>.empty();
    } on Exception catch (exception) {
      log("D'autre exception qui est $exception");
      return List<Partner>.empty();
    }
  }

  Future<bool> updatePartner({required Partner partner}) async {
    try {
      final partnerRepo = env.of<PartnerRepository>();
      await partnerRepo.execute(recordId: partner.id, method: 'write',
          // we need to pass record id as first argument
          // because write() is not @api.model
          args: [partner.id], kwargs: <String, dynamic>{'vals': partner});
      log("On a fait la mise à jour");

      return Future.value(true);
    } on OdooSessionExpiredException catch (exception) {
      log("Session expiré qui est $exception ");

      return Future.value(false);
    } on Exception catch (exception) {
      log("D'autre exception qui est $exception");
      return Future.value(false);
    }
  }

  @override
  Future<List> searchRead() async {
    log("Appel à la méthode searchRead");
    try {
      var res = await OdooEnvFactory.odooEnv!.orpc.callKw({
        "model": modelName,
        "method": "search_read",
        "args": [],
        "kwargs": {
          "context": {
            "bin_size": true,
          },
          "domain": domain,
          "fields": Partner.oFields,
          "limit": limit,
        },
      });
      var avatarUrl = "";
      for (var i = 0; i < res.length; i++) {
        final imageField =
            OdooEnvFactory.odooEnv!.orpc.sessionId!.serverVersion >= 13
                ? "image_512"
                : "image_small";
        var unique = res[i]["__last_update"] as String;
        var id = res[i]["id"];
        unique = unique.replaceAll(RegExp(r'[^0-9]'), "");
        avatarUrl = OdooEnvFactory.odooEnv!.orpc.baseURL +
            "/web/image?model=$modelName&field=$imageField&session&id=$id";
        res[i]["image_small"] = avatarUrl;
      }

      log("La liste est $res");
      return res;
    } on OdooSessionExpiredException catch (exception) {
      log("Session expiré qui est $exception ");

      return Future.wait(List.empty());
    } on Exception catch (exception) {
      log("D'autre exception qui est $exception");
      return Future.wait(List.empty());
    }
  }
}
