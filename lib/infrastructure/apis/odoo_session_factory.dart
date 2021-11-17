import 'package:odoo_demo/infrastructure/apis/hive_cache_factory.dart';
import 'package:odoo_demo/infrastructure/core/config.dart';
import 'package:odoo_rpc/odoo_rpc.dart';

class OdooSessionFactory {
  static final _sigleton = OdooSessionFactory._instance();
  static OdooSession? get odooSession => _sigleton._session;
  OdooSession? _session;

  OdooSessionFactory._instance() {
    _session = HiveCacheFactory.hiveCache!.get(
      Config.cacheSessionKey,
      defaultValue: null,
    );
  }
}
