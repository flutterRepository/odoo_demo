import 'package:equatable/equatable.dart';
import 'package:odoo_repository/odoo_repository.dart';

class Partner extends Equatable implements OdooRecord {
  @override
  final int id;
  final String name;
  final String email;
  final String imageSmall;

  const Partner({
    required this.id,
    required this.name,
    required this.email,
    required this.imageSmall,
  });

  /// Convertion d'un [Partner] en JSON
  @override
  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "name": name,
      "email": email != bool ? email : "-",
      "image_small": imageSmall,
    };
  }

  /// Création d'un [Partner] à partir d'une forme JSON
  static Partner fromJson(Map<String, dynamic> json) {
    return Partner(
      id: json["id"],
      name: json["name"],
      email: json["email"],
      imageSmall: json["image_small"] as String? ?? "",
    );
  }

  @override
  Map<String, dynamic> toVals() {
    /// Converti un object [User] en JSON compatible avec la création et la mise à jour
    /// Pour un model long, on peut envisager les générateur de code comme freeze
    return {
      "id": id,
      "name": name,
      "email": email,
      "image_small": imageSmall,
    };
  }

  /// En rapport avec la comparaison

  @override
  List<Object> get props => [
        id,
        name,
        email,
      ];

  /// Liste des champ qu'on a besoin de fetcher depuis le serveur Odoo

  static List<String> get oFields => [
        "id",
        "name",
        "email",
        "__last_update",
      ];

  @override
  String toString() => "Partner[$id]: $name";
}
