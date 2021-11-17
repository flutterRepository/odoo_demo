import 'package:equatable/equatable.dart';
import 'package:odoo_repository/odoo_repository.dart';

/// Pure [Dart] user model used in [Flutter] App
class User extends Equatable implements OdooRecord {
  @override
  final int id;
  final List<dynamic> partenerId;
  final String login;
  final String name;
  final String lang;
  final String imageSmall;
  const User({
    required this.id,
    required this.partenerId,
    required this.login,
    required this.name,
    required this.lang,
    required this.imageSmall,
  });

  /// Nous créons un fake [User] avec id=0 dans le cas où nous ne sommes pas connecté
  factory User.pubicUser() => const User(
      id: 0,
      partenerId: [],
      login: "public",
      name: "Public User",
      lang: "fr_FR",
      imageSmall: "");

  bool get isPublic => id == 0 ? true : false;

  @override
  Map<String, dynamic> toVals() {
    /// Converti un object [User] en JSON compatible avec la création et la mise à jour
    /// Pour un model long, on peut envisager les générateur de code comme freeze
    return {
      "id": id,
      "partner_id": partenerId,
      "login": login,
      "name": name,
      "lang": lang,
      "image_small": imageSmall,
    };
  }

  @override
  Map<String, dynamic> toJson() {
    /// Converti un object [User] en JSON compatible avec la création et la mise à jour
    /// Pour un model long, on peut envisager les générateur de code comme freeze
    return {
      "id": id,
      "partner_id": partenerId,
      "login": login,
      "name": name,
      "lang": lang,
      "image_small": imageSmall,
    };
  }

  static User fromJson(Map<String, dynamic> json) {
    /// Créée un object [User] à partir d'un forma JSON
    var userId = json["id"] as int? ?? 0;
    if (userId == 0) {
      return User.pubicUser();
    }
    return User(
      id: userId,
      partenerId: json["partner_id"] as List<dynamic>? ?? [],
      login: json["login"] as String? ?? "",
      name: json["name"] as String? ?? "",
      lang: json["lang"] as String? ?? "fr_FR",
      imageSmall: json["image_small"] as String? ?? "",
    );
  }

  /// [Equatable] stuff to compare record
  @override
  List<Object?> get props => [
        id,
        partenerId,
        login,
        name,
        lang,
        imageSmall,
      ];

  /// Liste de champ que nous avons besoin de fetcher
  static List<String> get oFields => [
        "id",
        "partner_id",
        "login",
        "name",
        "lang",
        "__last_update",
      ];
  @override
  String toString() => "User[$id]: $name";
}
