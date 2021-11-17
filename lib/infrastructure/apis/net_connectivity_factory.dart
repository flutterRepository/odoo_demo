import 'package:odoo_demo/infrastructure/core/connectivity/network_connectivity.dart';

class NetConnectivityFactory {
  static final _sigleton = NetConnectivityFactory._instance();
  static NetworkConnectivity? get netConnectivity => _sigleton._netConnectivity;
  NetworkConnectivity? _netConnectivity;

  NetConnectivityFactory._instance() {
    _netConnectivity = NetworkConnectivity();
  }
}
