import 'dart:developer';

import 'package:odoo_demo/domain/users/partner_record.dart';
import 'package:odoo_demo/infrastructure/apis/hive_cache_factory.dart';
import 'package:odoo_demo/infrastructure/apis/odoo_client_factory.dart';
import 'package:odoo_demo/infrastructure/apis/odoo_env_factory.dart';
import 'package:odoo_demo/infrastructure/localestorage/hive_storage/hive_impl.dart';
import 'package:odoo_repository/odoo_repository.dart';
import 'package:odoo_rpc/odoo_rpc.dart';

class PartnerRepository extends OdooRepository<Partner> {
  @override
  final String modelName = "res.partner";

  PartnerRepository() : super(OdooEnvFactory.odooEnv!);
  @override
  Partner createRecordFromJson(Map<String, dynamic> json) {
    return Partner.fromJson(json);
  }

  @override
  List<Partner> get records => super.records;

  List<Partner> getPartners() {
    try {
      // final sessionChangedHandler = storeSession(HiveCacheFactory.hiveCache!);
      // OdooClientFactory.odooclient!.sessionStream.listen(sessionChangedHandler);
      return records;
    } on OdooSessionExpiredException catch (exception) {
      log("Session expiré qui est $exception ");

      return List<Partner>.empty();
    } on Exception catch (exception) {
      log("D'autre exception qui est $exception");
      return List<Partner>.empty();
    }
  }

  @override
  Future<List> searchRead() async {
    try {
      var res = await OdooEnvFactory.odooEnv!.orpc.callKw({
        "model": modelName,
        "method": "search_read",
        "args": [],
        "kwargs": {
          "context": {
            "bin_size": true,
          },
          "domain": [],
          "fields": Partner.oFields,
          "limit": limit,
        },
      });
      var avatarUrl = "";
      for (var i = 0; i < res.length; i++) {
        final imageField =
            OdooEnvFactory.odooEnv!.orpc.sessionId!.serverVersion >= 13
                ? "image_128"
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
