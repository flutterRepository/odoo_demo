import 'package:odoo_demo/infrastructure/apis/hive_cache_factory.dart';
import 'package:odoo_demo/infrastructure/core/config.dart';
import 'package:odoo_rpc/odoo_rpc.dart';

class OdooClientFactory {
  static final _sigleton = OdooClientFactory._instance();
  static OdooClient? get odooclient => _sigleton._odooEnv;
  OdooClient? _odooEnv;

  OdooClientFactory._instance() {
    String odooDbName = HiveCacheFactory.hiveCache!.get(
      Config.cacheOdooServerURLKey,
      defaultValue: Config.odooServerURL,
    );
    _odooEnv = OdooClient(odooDbName);
  }
}
