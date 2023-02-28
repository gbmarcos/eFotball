
import 'package:fifa/src/features/login/login/credentials/model/credential.dart';
import 'package:hive_flutter/hive_flutter.dart';

class UserCredentialAdapter extends TypeAdapter<UserCredential> {
  @override
  final typeId = 3;

  @override
  UserCredential read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <dynamic, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };

    return UserCredential(
      username: fields[0] as String,
      password: fields[1] as String,
    );
  }

  @override
  void write(BinaryWriter writer, UserCredential obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.username)
      ..writeByte(1)
      ..write(obj.password);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserCredentialAdapter && runtimeType == other.runtimeType && typeId == other.typeId;
}
