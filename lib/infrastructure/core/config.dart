import 'package:crypto/crypto.dart';
import 'dart:convert';

class Config {
  static String odooServerURL = "https://odoo.com"; // "https://si7ty.com";
  static String odooDbName = "demo"; // "si7ty";
  static String username = "bnvnmmnl@gmail.com";
  static String password = "SaintMichel";

  /// Pour le locale storage avec Hive
  static final hiveBoxName = sha1
      .convert(utf8.encode("odoo_repository_demo:$odooServerURL:$odooDbName"))
      .toString();
  static const cacheSessionKey = "session";
  static const cacheIsLoggedInKey = "isLoggedIn";
  static const cacheIsServerConfiguredKey = "isServerConfigured";
  static const cacheOdooServerURLKey = "odooServerURL";
  static const cacheOdooDbNameKey = "odooDbName";
  static const cacheUsernameKey = "username";
  static const cacheUserPasswordKey = "userPassword";
}
