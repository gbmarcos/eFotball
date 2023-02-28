import 'package:fifa/src/authentication/authentication_repository.dart';
import 'package:hive_flutter/hive_flutter.dart';

class AuthenticationStatusAdapter extends TypeAdapter<AuthenticationStatus> {
  @override
  final typeId = 2;

  @override
  AuthenticationStatus read(BinaryReader reader) => AuthenticationStatus.values[reader.readInt()];

  @override
  void write(BinaryWriter writer, AuthenticationStatus obj) => writer.writeInt(obj.index);

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AuthenticationStatusAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
