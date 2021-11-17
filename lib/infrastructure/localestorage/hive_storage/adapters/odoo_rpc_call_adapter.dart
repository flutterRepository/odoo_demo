import 'package:hive/hive.dart';
import 'package:odoo_repository/odoo_repository.dart';

class OdooRpcCallAdapter extends TypeAdapter<OdooRpcCall> {
  ///
  ///Adaptateur pour stocker et lire OdooRpcCall depuis et à partir de Hive
  ///

  @override
  final typeId = 2;

  @override
  OdooRpcCall read(BinaryReader reader) {
    return OdooRpcCall.fromJson(Map<String, dynamic>.from(reader.read()));
  }

  @override
  void write(BinaryWriter writer, OdooRpcCall obj) {
    writer.write(obj.toJson());
  }
}
