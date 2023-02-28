import 'package:freezed_annotation/freezed_annotation.dart';

part 'signup_model.freezed.dart';
part 'signup_model.g.dart';

@freezed
class SignupModel with _$SignupModel {
  factory SignupModel({
    String? username,
    String? email,
    int? countryId,
    String? password,
    String? firstName,
    String? lastName,
    int? console,
    String? gamerTag,
    int? birthDay,
    int? birthMonth,
    int? birthYear,
  }) = _SignupModel;

  const SignupModel._();

  factory SignupModel.fromJson(Map<String, dynamic> map) => _$SignupModelFromJson(map);

  @override
  String toString() {
    return 'SignupModel Username = $username, GamerTag = $gamerTag';
  }
}
