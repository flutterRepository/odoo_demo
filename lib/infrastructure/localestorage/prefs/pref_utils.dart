import 'dart:convert';

import 'package:odoo_demo/infrastructure/localestorage/prefs/pref_keys.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PrefUtils {
  ///
  ///Class pour assurer la persistance des informations de connexion de l'utiliteur
  ///Après une première connexion on garde les informations en mémoire et la fois
  ///que l'utilisateur lance l'application si on a ces informations en mémoire on
  ///ne demande plus la connexion mais on va directement à l'écran d'accueil

  /// Contructeur de la class
  PrefUtils();

  static setToken(String token) async {
    ///
    ///Méthode pour insérer le token dans la mémoire
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.setString(PrefKeys.token, token);
  }

  static Future<String> getToken() async {
    ///
    ///Méthode pour la récupération du token de la mémoire
    ///
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getString(PrefKeys.token) ?? "";
  }

// Pour la configuration du serveur
  static setIsServerConfigured(bool isServerConfigured) async {
    ///
    ///Méthode pour insrer le signal de connexion de l'utilisateur
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.setBool(PrefKeys.isServerConfigured, isServerConfigured);
  }

  static Future<bool> getIsServerConfigured() async {
    ///
    ///Methode pour récupération le status de la connexion de l'utilisateur
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getBool(PrefKeys.isServerConfigured) ?? false;
  }

  // Pour le backup de l'adresse
  static setbackUpBaseURL(String backUpBaseURL) async {
    ///
    ///Méthode pour insrer le signal de connexion de l'utilisateur
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.setString(PrefKeys.backUpBaseURL, backUpBaseURL);
  }

  static Future<String> getbackUpBaseURL() async {
    ///
    ///Methode pour récupération le status de la connexion de l'utilisateur
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getString(PrefKeys.backUpBaseURL) ?? "";
  }

// Pour la gestion de la connexion qui doit venir après la configuration du server
  static setIsLoggedIn(bool isLoggedIn) async {
    ///
    ///Méthode pour insrer le signal de connexion de l'utilisateur
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.setBool(PrefKeys.isLoggedIn, isLoggedIn);
  }

  static Future<bool> getIsLoggedIn() async {
    ///
    ///Methode pour récupération le status de la connexion de l'utilisateur
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getBool(PrefKeys.isLoggedIn) ?? false;
  }

  static setServerConfig(String serverConfigData) async {
    ///
    ///Méthode pour stocker le profile de l'utlisateur dans la mémoire
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.setString(PrefKeys.serverConfig, serverConfigData);
  }

  static setUser(String userData) async {
    ///
    ///Méthode pour stocker le profile de l'utlisateur dans la mémoire
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.setString(PrefKeys.user, userData);
  }

  static clearPrefs() async {
    ///
    ///Méthode pour nétoyer la mémoire
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.clear();
  }

  static setCurrentServer(String serverData) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.setString(PrefKeys.currentServer, serverData);
  }
}
