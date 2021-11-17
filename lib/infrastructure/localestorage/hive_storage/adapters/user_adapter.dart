import 'package:hive/hive.dart';
import 'package:odoo_demo/domain/users/user_record.dart';

class UserAdapter extends TypeAdapter<User> {
  @override
  final typeId = 3;

  @override
  User read(BinaryReader reader) {
    return User.fromJson(Map<String, dynamic>.from(reader.read()));
  }

  @override
  void write(BinaryWriter writer, User obj) {
    writer.write(obj.toJson());
  }
}
