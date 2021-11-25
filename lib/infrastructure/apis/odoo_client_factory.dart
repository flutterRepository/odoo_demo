import 'package:odoo_demo/infrastructure/apis/hive_cache_factory.dart';
import 'package:odoo_demo/infrastructure/core/config.dart';
import 'package:odoo_demo/infrastructure/localestorage/hive_storage/hive_impl.dart';
import 'package:odoo_rpc/odoo_rpc.dart';

class OdooClientFactory {
  static final _sigleton = OdooClientFactory._instance();
  static OdooClient? get odooclient => _sigleton._odooClient;
  OdooClient? _odooClient;

  OdooClientFactory._instance() {
    String odooDbName = HiveCacheFactory.hiveCache!.get(
      Config.cacheOdooServerURLKey,
      defaultValue: Config.odooServerURL,
    );
    OdooSession? session = HiveCacheFactory.hiveCache!
        .get(Config.cacheSessionKey, defaultValue: null);
    _odooClient = OdooClient(odooDbName, session);
    final sessionChangedHandler = storeSession(HiveCacheFactory.hiveCache!);
    _odooClient!.sessionStream.listen(sessionChangedHandler);
  }
}
