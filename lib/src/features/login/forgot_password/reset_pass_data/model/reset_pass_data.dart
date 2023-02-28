import 'package:freezed_annotation/freezed_annotation.dart';

part 'reset_pass_data.freezed.dart';
part 'reset_pass_data.g.dart';

@freezed
class ResetPassData with _$ResetPassData {
  static const hiveBoxName = 'resetPassDataBox';
  static const savedDataKey = 'savedResetPassData';

  factory ResetPassData({
    required int forgotPasswordID,
    required int userID,
    required String forgotPasswordToken,
  }) = _ResetPassData;

  const ResetPassData._();

  factory ResetPassData.fromJson(Map<String, dynamic> map) => _$ResetPassDataFromJson(map);

  static ResetPassData? tryParse(String link) {
    try {
      //to get [reset_password, <forgotPasswordID>, <userID>, <forgotPasswordToken>] list
      final linkData = link.split('/').skipWhile((value) => value != 'reset_password');
      //save data to reset pass
      return ResetPassData(
        forgotPasswordID: int.parse(linkData.elementAt(1)),
        userID: int.parse(linkData.elementAt(2)),
        forgotPasswordToken: linkData.elementAt(3),
      );
    } on Exception {
      return null;
    }
  }

  @override
  String toString() {
    return 'Data forgotPasswordID = $forgotPasswordID, userID = $userID '
        'and forgotPasswordToken = $forgotPasswordToken ';
  }
}
