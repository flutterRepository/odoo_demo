import 'package:hive/hive.dart';
import 'package:odoo_demo/domain/users/partner_record.dart';

class PartnerAdapter extends TypeAdapter<Partner> {
  @override
  final typeId = 4;

  @override
  Partner read(BinaryReader reader) {
    return Partner.fromJson(Map<String, dynamic>.from(reader.read()));
  }

  @override
  void write(BinaryWriter writer, Partner obj) {
    writer.write(obj.toJson());
  }
}
