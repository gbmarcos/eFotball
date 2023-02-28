import 'package:fifa/src/common/data/converters.dart';
import 'package:fifa/src/common/domain/match/match.dart';
import 'package:fifa/src/common/domain/team/team.dart';
import 'package:fifa/src/common/domain/tournament/tournament.dart';
import 'package:fifa/src/common/extensions.dart';
import 'package:fifa/src/common/utils.dart';
import 'package:fifa/src/notifications/data/notification.dart';
import 'package:fpdart/fpdart.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';
part 'user.g.dart';

@JsonSerializable()
class UserAuthenticated {
  final String token;
  final int? permissions;

  UserAuthenticated({required this.token, this.permissions});

  factory UserAuthenticated.fromJson(Map<String, dynamic> json) => _$UserAuthenticatedFromJson(json);
}

@JsonSerializable()
class UserBasicInfo {
  final int? id;
  final String username;
  final int flags;
  final String? avatar;
  @JsonKey(name: 'country_id')
  final int? countryId;


  UserBasicInfo({
    this.id,
    required this.username,
    required this.flags,
    this.avatar,
    this.countryId,

  });

  factory UserBasicInfo.fromJson(Map<String, dynamic> json) => _$UserBasicInfoFromJson(json);

  @override
  String toString() {
    return 'UserBasicInfo{id: $id, username: $username, flags: $flags, avatar: $avatar, countryId: $countryId,}';
  }
}

@JsonSerializable()
class MatchUser implements UserBasicInfo {
  final int? id;
  final String username;
  final int flags;
  final String? avatar;
  @JsonKey(name: 'country_id')
  final int? countryId;
  final Console? console;
  final int elo;
  final int? eloChange;

  MatchUser({
    this.id,
    required this.username,
    required this.flags,
    required this.elo,
    this.eloChange,
    this.avatar,
    this.countryId,
    this.console,
  });

  factory MatchUser.fromJson(Map<String, dynamic> json) => _$MatchUserFromJson(json);

  @override
  String toString() {
    return 'MatchUser{id: $id, username: $username, flags: $flags, avatar: $avatar, countryId: $countryId, console: $console, elo: $elo, eloChange: $eloChange}';
  }
}

@JsonSerializable(fieldRename: FieldRename.snake)
class UserExtended {
  final String? firstName;
  final String? lastName;
  final String? email;
  final int? birthYear;
  final int? birthMonth;
  final int? birthDay;
  final Gender? gender;
  final List<Map>? friends;
  final List<UserBasicInfo>? friendRequests;
  final List<UserBasicInfo>? sentFriendRequests;
  final List<Notification>? notifications;
  final List<Map>? chats;
  final List<ActiveMatch>? activeMatches;
  final Map? taPermissionsMap;
  final Map? oaPermissionsMap;
  final String? twitchUsername;
  final LobbyCheckIn? lobbyCheckIn;

  UserExtended(
      {this.email,
      this.firstName,
      this.lastName,
      this.birthYear,
      this.birthMonth,
      this.birthDay,
      this.gender,
      this.friends,
      this.friendRequests,
      this.sentFriendRequests,
      this.notifications,
      this.chats,
      this.activeMatches,
      this.taPermissionsMap,
      this.oaPermissionsMap,
      this.twitchUsername,
      this.lobbyCheckIn});

  factory UserExtended.fromJson(Map<String, dynamic> json) => _$UserExtendedFromJson(json);

  DateTime? get birthDateTime => birthDate(birthYear: birthYear, birthMonth: birthMonth, birthDay: birthDay);

  ///Calculates the age of an user comparing its [birthDate] to the current Date
  ///it takes into account the months and days for the calculation
  ///if [birthYear] is null this value is also null
  int? get age => birthDateTime?.calculateAge();
}

@JsonSerializable()
class LatestMatchUser {
  final int? id;
  final String? name;
  final String? image;
  final int? score;

  LatestMatchUser({
    this.id,
    this.name,
    this.image,
    this.score,
  });

  factory LatestMatchUser.fromJson(Map<String, dynamic> json) => _$LatestMatchUserFromJson(json);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class LobbyCheckIn {
  final int id;
  final TournamentRef tournament;
  final UserBasicInfo user;
  final TeamRef? team;
  final int walkoverTime;

  LobbyCheckIn({
    required this.id,
    required this.tournament,
    required this.user,
    this.team,
    required this.walkoverTime,
  });

  ///If there is time left to the  [walkoverTime] returns a Some(),
  ///else if there is not time left returns None
  Option<Duration> get walkoverTimeLeft {
    final walkoverDateTime = const TimestampConverter().fromJson(walkoverTime);
    final now = DateTime.now();

    final timeLeft = walkoverDateTime.difference(now);

    if (timeLeft.isNegative) return const None();
    return Some(timeLeft);
  }

  ///The [walkoverTime] converted to a native dart [DateTime] object
  DateTime get walkoverDateTime {
    return const TimestampConverter().fromJson(walkoverTime);
  }

  factory LobbyCheckIn.fromJson(Map<String, dynamic> json) => _$LobbyCheckInFromJson(json);

  @override
  String toString() {
    return 'LobbyCheckIn{id: $id, tournament: $tournament, user: $user, team: $team, walkoverTime: $walkoverTime}';
  }
}

enum Console {
  @JsonValue(0)
  xbox,
  @JsonValue(1)
  playstation
}

enum Gender {
  @JsonValue(0)
  male,
  @JsonValue(1)
  female
}
enum Game {
  @JsonValue(0)
  fifa21,
  @JsonValue(1)
  pes20
}

String gameName(Game game) {
  switch (game) {
    case Game.fifa21:
      return 'FIFA';
    case Game.pes20:
      return 'PES';
  }
}

@freezed
class User with _$User {
  @Implements<UserExtended>()
  @Implements<UserBasicInfo>()
  @Implements<UserAuthenticated>()
  factory User({
    required int id,
    String? firstName,
    String? lastName,
    String? email,
    int? birthYear,
    int? birthMonth,
    int? birthDay,
    Gender? gender,
    List<Map>? friends,
    List<UserBasicInfo>? friendRequests,
    List<UserBasicInfo>? sentFriendRequests,
    List<Notification>? notifications,
    List<Map>? chats,
    final List<ActiveMatch>? activeMatches,
    Map? taPermissionsMap,
    Map? oaPermissionsMap,
    String? twitchUsername,
    LobbyCheckIn? lobbyCheckIn,
    required String token,
    int? permissions,
    required String username,
    String? avatar,
    int? countryId,
    Console? console,
    required int flags,
  }) = _User;

  const User._();

  factory User.fromJson(Map<String, dynamic> map) => _$UserFromJson(map);

  @override
  String toString() {
    return 'User ID = $id, Email = $email';
  }

  DateTime? get birthDateTime => birthDate(birthYear: birthYear, birthMonth: birthMonth, birthDay: birthDay);

  ///Calculates the age of an user comparing its [birthDate] to the current Date
  ///it takes into account the months and days for the calculation
  ///if [birthYear] is null this value is also null
  int? get age => birthDateTime?.calculateAge();
}