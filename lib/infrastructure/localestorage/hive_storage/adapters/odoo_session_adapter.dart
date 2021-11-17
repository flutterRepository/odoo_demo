import 'package:odoo_rpc/odoo_rpc.dart';
import 'package:hive/hive.dart';

class OdooSessionAdapter extends TypeAdapter<OdooSession> {
  ///
  ///Adapter pour stocker et lire OdooSession depuis le storage de persistance

  @override
  final typeId = 0;

  @override
  OdooSession read(BinaryReader reader) {
    return OdooSession.fromJson(Map<String, dynamic>.from(reader.read()));
  }

  @override
  void write(BinaryWriter writer, OdooSession obj) {
    writer.write(obj.toJson());
  }
}
