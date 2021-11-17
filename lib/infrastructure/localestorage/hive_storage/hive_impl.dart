import 'dart:developer';

import 'package:hive/hive.dart';
import 'package:odoo_demo/infrastructure/apis/hive_cache_factory.dart';
import 'package:odoo_demo/infrastructure/core/config.dart';
import 'package:odoo_demo/infrastructure/localestorage/hive_storage/adapters/odoo_rpc_call_adapter.dart';
import 'package:odoo_demo/infrastructure/localestorage/hive_storage/adapters/odoo_session_adapter.dart';
import 'package:odoo_demo/infrastructure/localestorage/hive_storage/adapters/partner_adapter.dart';
import 'package:odoo_demo/infrastructure/localestorage/hive_storage/adapters/user_adapter.dart';
import 'package:odoo_repository/odoo_repository.dart';
import 'package:odoo_rpc/odoo_rpc.dart';
import 'package:path_provider/path_provider.dart' as path_provider;

typedef SessionChangedCallback = void Function(OdooSession sessionId);

class OdooKVHive implements OdooKv {
  ///
  ///Pour l'implementation de stockage key-valeu persistant pour les records Odoo
  ///et persistance de la session avec Hive
  late Box box;

  OdooKVHive();
  @override
  Future<void> init() async {
    log("Initialisation dans l'init de Hive");
    Hive.registerAdapter(OdooSessionAdapter());
    Hive.registerAdapter(OdooRpcCallAdapter());
    Hive.registerAdapter(UserAdapter());
    Hive.registerAdapter(PartnerAdapter());
    final appDocumentDir =
        await path_provider.getApplicationDocumentsDirectory();
    Hive.init(appDocumentDir.path);

    box = await Hive.openBox(Config.hiveBoxName);
  }

  @override
  Future<void> close() {
    return box.close();
  }

  @override
  dynamic get(dynamic key, {dynamic defaultValue}) {
    return box.get(
      key,
      defaultValue: defaultValue,
    );
  }

  @override
  Future<void> put(dynamic key, dynamic value) {
    return box.put(
      key,
      value,
    );
  }

  @override
  Future<void> delete(dynamic key) {
    return box.delete(key);
  }

  @override
  Iterable<dynamic> get keys => box.keys;
}

// SessionChangedCallback storeSession() {
//   ///
//   ///Callback pour les changements de l'events de session
//   void sessionChanged(OdooSession sessionId) {
//     if (sessionId.id == "") {
//       HiveCacheFactory.hiveCache!.delete(Config.cacheSessionKey);
//     } else {
//       HiveCacheFactory.hiveCache!.put(Config.cacheSessionKey, sessionId);
//     }
//   }

//   return sessionChanged;
// }

/// Callback for session changed events
SessionChangedCallback storeSession(OdooKv cache) {
  void sessionChanged(OdooSession sessionId) {
    if (sessionId.id == '') {
      cache.delete(Config.cacheSessionKey);
    } else {
      cache.put(Config.cacheSessionKey, sessionId);
    }
  }

  return sessionChanged;
}
