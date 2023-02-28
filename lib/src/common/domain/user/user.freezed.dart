// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

User _$UserFromJson(Map<String, dynamic> json) {
  return _User.fromJson(json);
}

/// @nodoc
class _$UserTearOff {
  const _$UserTearOff();

  _User call(
      {required int id,
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
      List<ActiveMatch>? activeMatches,
      Map<dynamic, dynamic>? taPermissionsMap,
      Map<dynamic, dynamic>? oaPermissionsMap,
      String? twitchUsername,
      LobbyCheckIn? lobbyCheckIn,
      required String token,
      int? permissions,
      required String username,
      String? avatar,
      int? countryId,
      Console? console,
      required int flags}) {
    return _User(
      id: id,
      firstName: firstName,
      lastName: lastName,
      email: email,
      birthYear: birthYear,
      birthMonth: birthMonth,
      birthDay: birthDay,
      gender: gender,
      friends: friends,
      friendRequests: friendRequests,
      sentFriendRequests: sentFriendRequests,
      notifications: notifications,
      chats: chats,
      activeMatches: activeMatches,
      taPermissionsMap: taPermissionsMap,
      oaPermissionsMap: oaPermissionsMap,
      twitchUsername: twitchUsername,
      lobbyCheckIn: lobbyCheckIn,
      token: token,
      permissions: permissions,
      username: username,
      avatar: avatar,
      countryId: countryId,
      console: console,
      flags: flags,
    );
  }

  User fromJson(Map<String, Object?> json) {
    return User.fromJson(json);
  }
}

/// @nodoc
const $User = _$UserTearOff();

/// @nodoc
mixin _$User {
  int get id => throw _privateConstructorUsedError;
  String? get firstName => throw _privateConstructorUsedError;
  String? get lastName => throw _privateConstructorUsedError;
  String? get email => throw _privateConstructorUsedError;
  int? get birthYear => throw _privateConstructorUsedError;
  int? get birthMonth => throw _privateConstructorUsedError;
  int? get birthDay => throw _privateConstructorUsedError;
  Gender? get gender => throw _privateConstructorUsedError;
  List<Map>? get friends => throw _privateConstructorUsedError;
  List<UserBasicInfo>? get friendRequests => throw _privateConstructorUsedError;
  List<UserBasicInfo>? get sentFriendRequests =>
      throw _privateConstructorUsedError;
  List<Notification>? get notifications => throw _privateConstructorUsedError;
  List<Map>? get chats => throw _privateConstructorUsedError;
  List<ActiveMatch>? get activeMatches => throw _privateConstructorUsedError;
  Map<dynamic, dynamic>? get taPermissionsMap =>
      throw _privateConstructorUsedError;
  Map<dynamic, dynamic>? get oaPermissionsMap =>
      throw _privateConstructorUsedError;
  String? get twitchUsername => throw _privateConstructorUsedError;
  LobbyCheckIn? get lobbyCheckIn => throw _privateConstructorUsedError;
  String get token => throw _privateConstructorUsedError;
  int? get permissions => throw _privateConstructorUsedError;
  String get username => throw _privateConstructorUsedError;
  String? get avatar => throw _privateConstructorUsedError;
  int? get countryId => throw _privateConstructorUsedError;
  Console? get console => throw _privateConstructorUsedError;
  int get flags => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserCopyWith<User> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserCopyWith<$Res> {
  factory $UserCopyWith(User value, $Res Function(User) then) =
      _$UserCopyWithImpl<$Res>;
  $Res call(
      {int id,
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
      List<ActiveMatch>? activeMatches,
      Map<dynamic, dynamic>? taPermissionsMap,
      Map<dynamic, dynamic>? oaPermissionsMap,
      String? twitchUsername,
      LobbyCheckIn? lobbyCheckIn,
      String token,
      int? permissions,
      String username,
      String? avatar,
      int? countryId,
      Console? console,
      int flags});
}

/// @nodoc
class _$UserCopyWithImpl<$Res> implements $UserCopyWith<$Res> {
  _$UserCopyWithImpl(this._value, this._then);

  final User _value;
  // ignore: unused_field
  final $Res Function(User) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? firstName = freezed,
    Object? lastName = freezed,
    Object? email = freezed,
    Object? birthYear = freezed,
    Object? birthMonth = freezed,
    Object? birthDay = freezed,
    Object? gender = freezed,
    Object? friends = freezed,
    Object? friendRequests = freezed,
    Object? sentFriendRequests = freezed,
    Object? notifications = freezed,
    Object? chats = freezed,
    Object? activeMatches = freezed,
    Object? taPermissionsMap = freezed,
    Object? oaPermissionsMap = freezed,
    Object? twitchUsername = freezed,
    Object? lobbyCheckIn = freezed,
    Object? token = freezed,
    Object? permissions = freezed,
    Object? username = freezed,
    Object? avatar = freezed,
    Object? countryId = freezed,
    Object? console = freezed,
    Object? flags = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      firstName: firstName == freezed
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String?,
      lastName: lastName == freezed
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String?,
      email: email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      birthYear: birthYear == freezed
          ? _value.birthYear
          : birthYear // ignore: cast_nullable_to_non_nullable
              as int?,
      birthMonth: birthMonth == freezed
          ? _value.birthMonth
          : birthMonth // ignore: cast_nullable_to_non_nullable
              as int?,
      birthDay: birthDay == freezed
          ? _value.birthDay
          : birthDay // ignore: cast_nullable_to_non_nullable
              as int?,
      gender: gender == freezed
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as Gender?,
      friends: friends == freezed
          ? _value.friends
          : friends // ignore: cast_nullable_to_non_nullable
              as List<Map>?,
      friendRequests: friendRequests == freezed
          ? _value.friendRequests
          : friendRequests // ignore: cast_nullable_to_non_nullable
              as List<UserBasicInfo>?,
      sentFriendRequests: sentFriendRequests == freezed
          ? _value.sentFriendRequests
          : sentFriendRequests // ignore: cast_nullable_to_non_nullable
              as List<UserBasicInfo>?,
      notifications: notifications == freezed
          ? _value.notifications
          : notifications // ignore: cast_nullable_to_non_nullable
              as List<Notification>?,
      chats: chats == freezed
          ? _value.chats
          : chats // ignore: cast_nullable_to_non_nullable
              as List<Map>?,
      activeMatches: activeMatches == freezed
          ? _value.activeMatches
          : activeMatches // ignore: cast_nullable_to_non_nullable
              as List<ActiveMatch>?,
      taPermissionsMap: taPermissionsMap == freezed
          ? _value.taPermissionsMap
          : taPermissionsMap // ignore: cast_nullable_to_non_nullable
              as Map<dynamic, dynamic>?,
      oaPermissionsMap: oaPermissionsMap == freezed
          ? _value.oaPermissionsMap
          : oaPermissionsMap // ignore: cast_nullable_to_non_nullable
              as Map<dynamic, dynamic>?,
      twitchUsername: twitchUsername == freezed
          ? _value.twitchUsername
          : twitchUsername // ignore: cast_nullable_to_non_nullable
              as String?,
      lobbyCheckIn: lobbyCheckIn == freezed
          ? _value.lobbyCheckIn
          : lobbyCheckIn // ignore: cast_nullable_to_non_nullable
              as LobbyCheckIn?,
      token: token == freezed
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String,
      permissions: permissions == freezed
          ? _value.permissions
          : permissions // ignore: cast_nullable_to_non_nullable
              as int?,
      username: username == freezed
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      avatar: avatar == freezed
          ? _value.avatar
          : avatar // ignore: cast_nullable_to_non_nullable
              as String?,
      countryId: countryId == freezed
          ? _value.countryId
          : countryId // ignore: cast_nullable_to_non_nullable
              as int?,
      console: console == freezed
          ? _value.console
          : console // ignore: cast_nullable_to_non_nullable
              as Console?,
      flags: flags == freezed
          ? _value.flags
          : flags // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
abstract class _$UserCopyWith<$Res> implements $UserCopyWith<$Res> {
  factory _$UserCopyWith(_User value, $Res Function(_User) then) =
      __$UserCopyWithImpl<$Res>;
  @override
  $Res call(
      {int id,
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
      List<ActiveMatch>? activeMatches,
      Map<dynamic, dynamic>? taPermissionsMap,
      Map<dynamic, dynamic>? oaPermissionsMap,
      String? twitchUsername,
      LobbyCheckIn? lobbyCheckIn,
      String token,
      int? permissions,
      String username,
      String? avatar,
      int? countryId,
      Console? console,
      int flags});
}

/// @nodoc
class __$UserCopyWithImpl<$Res> extends _$UserCopyWithImpl<$Res>
    implements _$UserCopyWith<$Res> {
  __$UserCopyWithImpl(_User _value, $Res Function(_User) _then)
      : super(_value, (v) => _then(v as _User));

  @override
  _User get _value => super._value as _User;

  @override
  $Res call({
    Object? id = freezed,
    Object? firstName = freezed,
    Object? lastName = freezed,
    Object? email = freezed,
    Object? birthYear = freezed,
    Object? birthMonth = freezed,
    Object? birthDay = freezed,
    Object? gender = freezed,
    Object? friends = freezed,
    Object? friendRequests = freezed,
    Object? sentFriendRequests = freezed,
    Object? notifications = freezed,
    Object? chats = freezed,
    Object? activeMatches = freezed,
    Object? taPermissionsMap = freezed,
    Object? oaPermissionsMap = freezed,
    Object? twitchUsername = freezed,
    Object? lobbyCheckIn = freezed,
    Object? token = freezed,
    Object? permissions = freezed,
    Object? username = freezed,
    Object? avatar = freezed,
    Object? countryId = freezed,
    Object? console = freezed,
    Object? flags = freezed,
  }) {
    return _then(_User(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      firstName: firstName == freezed
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String?,
      lastName: lastName == freezed
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String?,
      email: email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      birthYear: birthYear == freezed
          ? _value.birthYear
          : birthYear // ignore: cast_nullable_to_non_nullable
              as int?,
      birthMonth: birthMonth == freezed
          ? _value.birthMonth
          : birthMonth // ignore: cast_nullable_to_non_nullable
              as int?,
      birthDay: birthDay == freezed
          ? _value.birthDay
          : birthDay // ignore: cast_nullable_to_non_nullable
              as int?,
      gender: gender == freezed
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as Gender?,
      friends: friends == freezed
          ? _value.friends
          : friends // ignore: cast_nullable_to_non_nullable
              as List<Map>?,
      friendRequests: friendRequests == freezed
          ? _value.friendRequests
          : friendRequests // ignore: cast_nullable_to_non_nullable
              as List<UserBasicInfo>?,
      sentFriendRequests: sentFriendRequests == freezed
          ? _value.sentFriendRequests
          : sentFriendRequests // ignore: cast_nullable_to_non_nullable
              as List<UserBasicInfo>?,
      notifications: notifications == freezed
          ? _value.notifications
          : notifications // ignore: cast_nullable_to_non_nullable
              as List<Notification>?,
      chats: chats == freezed
          ? _value.chats
          : chats // ignore: cast_nullable_to_non_nullable
              as List<Map>?,
      activeMatches: activeMatches == freezed
          ? _value.activeMatches
          : activeMatches // ignore: cast_nullable_to_non_nullable
              as List<ActiveMatch>?,
      taPermissionsMap: taPermissionsMap == freezed
          ? _value.taPermissionsMap
          : taPermissionsMap // ignore: cast_nullable_to_non_nullable
              as Map<dynamic, dynamic>?,
      oaPermissionsMap: oaPermissionsMap == freezed
          ? _value.oaPermissionsMap
          : oaPermissionsMap // ignore: cast_nullable_to_non_nullable
              as Map<dynamic, dynamic>?,
      twitchUsername: twitchUsername == freezed
          ? _value.twitchUsername
          : twitchUsername // ignore: cast_nullable_to_non_nullable
              as String?,
      lobbyCheckIn: lobbyCheckIn == freezed
          ? _value.lobbyCheckIn
          : lobbyCheckIn // ignore: cast_nullable_to_non_nullable
              as LobbyCheckIn?,
      token: token == freezed
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String,
      permissions: permissions == freezed
          ? _value.permissions
          : permissions // ignore: cast_nullable_to_non_nullable
              as int?,
      username: username == freezed
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      avatar: avatar == freezed
          ? _value.avatar
          : avatar // ignore: cast_nullable_to_non_nullable
              as String?,
      countryId: countryId == freezed
          ? _value.countryId
          : countryId // ignore: cast_nullable_to_non_nullable
              as int?,
      console: console == freezed
          ? _value.console
          : console // ignore: cast_nullable_to_non_nullable
              as Console?,
      flags: flags == freezed
          ? _value.flags
          : flags // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
@Implements<UserExtended>()
@Implements<UserBasicInfo>()
@Implements<UserAuthenticated>()
class _$_User extends _User {
  _$_User(
      {required this.id,
      this.firstName,
      this.lastName,
      this.email,
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
      this.lobbyCheckIn,
      required this.token,
      this.permissions,
      required this.username,
      this.avatar,
      this.countryId,
      this.console,
      required this.flags})
      : super._();

  factory _$_User.fromJson(Map<String, dynamic> json) => _$$_UserFromJson(json);

  @override
  final int id;
  @override
  final String? firstName;
  @override
  final String? lastName;
  @override
  final String? email;
  @override
  final int? birthYear;
  @override
  final int? birthMonth;
  @override
  final int? birthDay;
  @override
  final Gender? gender;
  @override
  final List<Map>? friends;
  @override
  final List<UserBasicInfo>? friendRequests;
  @override
  final List<UserBasicInfo>? sentFriendRequests;
  @override
  final List<Notification>? notifications;
  @override
  final List<Map>? chats;
  @override
  final List<ActiveMatch>? activeMatches;
  @override
  final Map<dynamic, dynamic>? taPermissionsMap;
  @override
  final Map<dynamic, dynamic>? oaPermissionsMap;
  @override
  final String? twitchUsername;
  @override
  final LobbyCheckIn? lobbyCheckIn;
  @override
  final String token;
  @override
  final int? permissions;
  @override
  final String username;
  @override
  final String? avatar;
  @override
  final int? countryId;
  @override
  final Console? console;
  @override
  final int flags;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _User &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.firstName, firstName) &&
            const DeepCollectionEquality().equals(other.lastName, lastName) &&
            const DeepCollectionEquality().equals(other.email, email) &&
            const DeepCollectionEquality().equals(other.birthYear, birthYear) &&
            const DeepCollectionEquality()
                .equals(other.birthMonth, birthMonth) &&
            const DeepCollectionEquality().equals(other.birthDay, birthDay) &&
            const DeepCollectionEquality().equals(other.gender, gender) &&
            const DeepCollectionEquality().equals(other.friends, friends) &&
            const DeepCollectionEquality()
                .equals(other.friendRequests, friendRequests) &&
            const DeepCollectionEquality()
                .equals(other.sentFriendRequests, sentFriendRequests) &&
            const DeepCollectionEquality()
                .equals(other.notifications, notifications) &&
            const DeepCollectionEquality().equals(other.chats, chats) &&
            const DeepCollectionEquality()
                .equals(other.activeMatches, activeMatches) &&
            const DeepCollectionEquality()
                .equals(other.taPermissionsMap, taPermissionsMap) &&
            const DeepCollectionEquality()
                .equals(other.oaPermissionsMap, oaPermissionsMap) &&
            const DeepCollectionEquality()
                .equals(other.twitchUsername, twitchUsername) &&
            const DeepCollectionEquality()
                .equals(other.lobbyCheckIn, lobbyCheckIn) &&
            const DeepCollectionEquality().equals(other.token, token) &&
            const DeepCollectionEquality()
                .equals(other.permissions, permissions) &&
            const DeepCollectionEquality().equals(other.username, username) &&
            const DeepCollectionEquality().equals(other.avatar, avatar) &&
            const DeepCollectionEquality().equals(other.countryId, countryId) &&
            const DeepCollectionEquality().equals(other.console, console) &&
            const DeepCollectionEquality().equals(other.flags, flags));
  }

  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        const DeepCollectionEquality().hash(id),
        const DeepCollectionEquality().hash(firstName),
        const DeepCollectionEquality().hash(lastName),
        const DeepCollectionEquality().hash(email),
        const DeepCollectionEquality().hash(birthYear),
        const DeepCollectionEquality().hash(birthMonth),
        const DeepCollectionEquality().hash(birthDay),
        const DeepCollectionEquality().hash(gender),
        const DeepCollectionEquality().hash(friends),
        const DeepCollectionEquality().hash(friendRequests),
        const DeepCollectionEquality().hash(sentFriendRequests),
        const DeepCollectionEquality().hash(notifications),
        const DeepCollectionEquality().hash(chats),
        const DeepCollectionEquality().hash(activeMatches),
        const DeepCollectionEquality().hash(taPermissionsMap),
        const DeepCollectionEquality().hash(oaPermissionsMap),
        const DeepCollectionEquality().hash(twitchUsername),
        const DeepCollectionEquality().hash(lobbyCheckIn),
        const DeepCollectionEquality().hash(token),
        const DeepCollectionEquality().hash(permissions),
        const DeepCollectionEquality().hash(username),
        const DeepCollectionEquality().hash(avatar),
        const DeepCollectionEquality().hash(countryId),
        const DeepCollectionEquality().hash(console),
        const DeepCollectionEquality().hash(flags)
      ]);

  @JsonKey(ignore: true)
  @override
  _$UserCopyWith<_User> get copyWith =>
      __$UserCopyWithImpl<_User>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UserToJson(this);
  }
}

abstract class _User extends User
    implements UserExtended, UserBasicInfo, UserAuthenticated {
  factory _User(
      {required int id,
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
      List<ActiveMatch>? activeMatches,
      Map<dynamic, dynamic>? taPermissionsMap,
      Map<dynamic, dynamic>? oaPermissionsMap,
      String? twitchUsername,
      LobbyCheckIn? lobbyCheckIn,
      required String token,
      int? permissions,
      required String username,
      String? avatar,
      int? countryId,
      Console? console,
      required int flags}) = _$_User;
  _User._() : super._();

  factory _User.fromJson(Map<String, dynamic> json) = _$_User.fromJson;

  @override
  int get id;
  @override
  String? get firstName;
  @override
  String? get lastName;
  @override
  String? get email;
  @override
  int? get birthYear;
  @override
  int? get birthMonth;
  @override
  int? get birthDay;
  @override
  Gender? get gender;
  @override
  List<Map>? get friends;
  @override
  List<UserBasicInfo>? get friendRequests;
  @override
  List<UserBasicInfo>? get sentFriendRequests;
  @override
  List<Notification>? get notifications;
  @override
  List<Map>? get chats;
  @override
  List<ActiveMatch>? get activeMatches;
  @override
  Map<dynamic, dynamic>? get taPermissionsMap;
  @override
  Map<dynamic, dynamic>? get oaPermissionsMap;
  @override
  String? get twitchUsername;
  @override
  LobbyCheckIn? get lobbyCheckIn;
  @override
  String get token;
  @override
  int? get permissions;
  @override
  String get username;
  @override
  String? get avatar;
  @override
  int? get countryId;
  @override
  Console? get console;
  @override
  int get flags;
  @override
  @JsonKey(ignore: true)
  _$UserCopyWith<_User> get copyWith => throw _privateConstructorUsedError;
}
