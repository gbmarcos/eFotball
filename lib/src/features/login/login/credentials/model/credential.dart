import 'package:freezed_annotation/freezed_annotation.dart';

part 'credential.freezed.dart';
part 'credential.g.dart';

@freezed
class UserCredential with _$UserCredential {
  static const hiveBoxName = 'credentialBox';

  //This string a 256-bit (32 bytes) encryption key used to save user credential safely.
  //don't change the Key String
  static const hiveEncryptionKeyString = 'kXp2s5v8y/B?D(G+KbPeShVmYq3t6w9z';

  factory UserCredential({
    required String username,
    required String password,
  }) = _UserCredential;

  const UserCredential._();

  factory UserCredential.fromJson(Map<String, dynamic> map) => _$UserCredentialFromJson(map);

  @override
  String toString() {
    return 'UserCredential username = $username,';
  }
}
