import 'dart:developer';

import 'package:odoo_demo/infrastructure/localestorage/hive_storage/hive_impl.dart';

class HiveCacheFactory {
  static final _sigleton = HiveCacheFactory._instance();
  String? baseUrl;
  static OdooKVHive? get hiveCache => _sigleton._hiveCache;
  OdooKVHive? _hiveCache;

  HiveCacheFactory._instance() {
    _hiveCache = OdooKVHive();
  }

  static Future<void> initialiseHiveCache() {
    log("Initialisation du Hive");
    return _sigleton._hiveCache!.init();
  }
}
