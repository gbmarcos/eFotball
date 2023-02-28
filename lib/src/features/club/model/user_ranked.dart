import 'package:fifa/src/common/domain/user/user.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_ranked.freezed.dart';
part 'user_ranked.g.dart';

@freezed
class UserRanked with _$UserRanked {
  @Implements<UserBasicInfo>()
  factory UserRanked(
      {int? id,
      required String username,
      String? avatar,
      int? countryId,
      Console? console,
      required int flags,
      int? elo,
      int? rank}) = _UserRanked;

  const UserRanked._();

  factory UserRanked.fromJson(Map<String, dynamic> map) => _$UserRankedFromJson(map);
}
