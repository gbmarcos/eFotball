
import 'package:fifa/src/common/data/converters.dart';
import 'package:fifa/src/common/domain/user/user.dart';
import 'package:fifa/src/features/club/model/org_featured_player.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_profile.freezed.dart';

part 'user_profile.g.dart';

@freezed
class UserProfile with _$UserProfile {
  @Implements<UserBasicInfo>()
  factory UserProfile({
    int? id,
    required String username,
    String? avatar,
    String? email,
    int? countryId,
    required int flags,
    required OnlineStatus onlineStatus,
    @TimestampConverter() required DateTime inserted,
    bool? admin,
    required bool banned,
    List<Friend>? friends,
    List<UsernameHistoryEntry>? usernameHistory,
    required UserProfileStats stats,
    required UserTwitchStream stream,
    bool? hasXbox,
    bool? hasPlaystation,
    String? xboxTag,
    String? psnId,
  }) = _UserProfile;

  const UserProfile._();

  Set<Console> get consoles {
    return {
      if (hasXbox != null && hasXbox!) Console.xbox,
      if (hasPlaystation != null && hasPlaystation!) Console.playstation,
      if (xboxTag != null && xboxTag!.isNotEmpty) Console.xbox,
      if (psnId != null && psnId!.isNotEmpty) Console.playstation,
    };
  }

  factory UserProfile.fromJson(Map<String, dynamic> map) => _$UserProfileFromJson(map);
}

List<Friend> friendsFromJson(List<dynamic> str) =>
    List<Friend>.from(str.map<Friend>((dynamic x) => Friend.fromJson(x as Map<String, dynamic>)));

@freezed
class Friend with _$Friend {
  @Implements<UserBasicInfo>()
  factory Friend({
    int? id,
    required String username,
    String? avatar,
    int? countryId,
    required int flags,
    Console? console,
    required OnlineStatus onlineStatus,
    @TimestampConverter() required DateTime inserted,
  }) = _Friend;

  const Friend._();

  factory Friend.fromJson(Map<String, dynamic> map) => _$FriendFromJson(map);
}

@freezed
class UsernameHistoryEntry with _$UsernameHistoryEntry {
  factory UsernameHistoryEntry({
    required int id,
    required String username,
    @TimestampConverter() required DateTime inserted,
  }) = _UsernameHistoryEntry;

  const UsernameHistoryEntry._();

  factory UsernameHistoryEntry.fromJson(Map<String, dynamic> map) => _$UsernameHistoryEntryFromJson(map);
}

@freezed
class UserTwitchStream with _$UserTwitchStream {
  factory UserTwitchStream({
    required String username,
    String? status,
    int? viewers,
  }) = _UserTwitchStream;

  const UserTwitchStream._();

  factory UserTwitchStream.fromJson(Map<String, dynamic> map) => _$UserTwitchStreamFromJson(map);
}

enum OnlineStatus {
  @JsonValue(0)
  offline,
  @JsonValue(1)
  ingame,
  @JsonValue(2)
  idle,
  @JsonValue(3)
  online,
}
