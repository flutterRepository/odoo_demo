import 'package:odoo_demo/infrastructure/apis/hive_cache_factory.dart';
import 'package:odoo_demo/infrastructure/apis/net_connectivity_factory.dart';
import 'package:odoo_demo/infrastructure/apis/odoo_client_factory.dart';
import 'package:odoo_demo/infrastructure/core/config.dart';
import 'package:odoo_repository/odoo_repository.dart';

class OdooEnvFactory {
  static final _sigleton = OdooEnvFactory._instance();

  static OdooEnvironment? get odooEnv => _sigleton._odooEnv;
  OdooEnvironment? _odooEnv;
  OdooEnvFactory._instance() {
    _odooEnv = OdooEnvironment(OdooClientFactory.odooclient!, Config.odooDbName,
        HiveCacheFactory.hiveCache!, NetConnectivityFactory.netConnectivity!);
  }
}
