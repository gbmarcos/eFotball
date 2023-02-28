// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'user_profile.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UserProfile _$UserProfileFromJson(Map<String, dynamic> json) {
  return _UserProfile.fromJson(json);
}

/// @nodoc
class _$UserProfileTearOff {
  const _$UserProfileTearOff();

  _UserProfile call(
      {int? id,
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
      String? psnId}) {
    return _UserProfile(
      id: id,
      username: username,
      avatar: avatar,
      email: email,
      countryId: countryId,
      flags: flags,
      onlineStatus: onlineStatus,
      inserted: inserted,
      admin: admin,
      banned: banned,
      friends: friends,
      usernameHistory: usernameHistory,
      stats: stats,
      stream: stream,
      hasXbox: hasXbox,
      hasPlaystation: hasPlaystation,
      xboxTag: xboxTag,
      psnId: psnId,
    );
  }

  UserProfile fromJson(Map<String, Object?> json) {
    return UserProfile.fromJson(json);
  }
}

/// @nodoc
const $UserProfile = _$UserProfileTearOff();

/// @nodoc
mixin _$UserProfile {
  int? get id => throw _privateConstructorUsedError;
  String get username => throw _privateConstructorUsedError;
  String? get avatar => throw _privateConstructorUsedError;
  String? get email => throw _privateConstructorUsedError;
  int? get countryId => throw _privateConstructorUsedError;
  int get flags => throw _privateConstructorUsedError;
  OnlineStatus get onlineStatus => throw _privateConstructorUsedError;
  @TimestampConverter()
  DateTime get inserted => throw _privateConstructorUsedError;
  bool? get admin => throw _privateConstructorUsedError;
  bool get banned => throw _privateConstructorUsedError;
  List<Friend>? get friends => throw _privateConstructorUsedError;
  List<UsernameHistoryEntry>? get usernameHistory =>
      throw _privateConstructorUsedError;
  UserProfileStats get stats => throw _privateConstructorUsedError;
  UserTwitchStream get stream => throw _privateConstructorUsedError;
  bool? get hasXbox => throw _privateConstructorUsedError;
  bool? get hasPlaystation => throw _privateConstructorUsedError;
  String? get xboxTag => throw _privateConstructorUsedError;
  String? get psnId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserProfileCopyWith<UserProfile> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserProfileCopyWith<$Res> {
  factory $UserProfileCopyWith(
          UserProfile value, $Res Function(UserProfile) then) =
      _$UserProfileCopyWithImpl<$Res>;
  $Res call(
      {int? id,
      String username,
      String? avatar,
      String? email,
      int? countryId,
      int flags,
      OnlineStatus onlineStatus,
      @TimestampConverter() DateTime inserted,
      bool? admin,
      bool banned,
      List<Friend>? friends,
      List<UsernameHistoryEntry>? usernameHistory,
      UserProfileStats stats,
      UserTwitchStream stream,
      bool? hasXbox,
      bool? hasPlaystation,
      String? xboxTag,
      String? psnId});

  $UserProfileStatsCopyWith<$Res> get stats;
  $UserTwitchStreamCopyWith<$Res> get stream;
}

/// @nodoc
class _$UserProfileCopyWithImpl<$Res> implements $UserProfileCopyWith<$Res> {
  _$UserProfileCopyWithImpl(this._value, this._then);

  final UserProfile _value;
  // ignore: unused_field
  final $Res Function(UserProfile) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? username = freezed,
    Object? avatar = freezed,
    Object? email = freezed,
    Object? countryId = freezed,
    Object? flags = freezed,
    Object? onlineStatus = freezed,
    Object? inserted = freezed,
    Object? admin = freezed,
    Object? banned = freezed,
    Object? friends = freezed,
    Object? usernameHistory = freezed,
    Object? stats = freezed,
    Object? stream = freezed,
    Object? hasXbox = freezed,
    Object? hasPlaystation = freezed,
    Object? xboxTag = freezed,
    Object? psnId = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      username: username == freezed
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      avatar: avatar == freezed
          ? _value.avatar
          : avatar // ignore: cast_nullable_to_non_nullable
              as String?,
      email: email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      countryId: countryId == freezed
          ? _value.countryId
          : countryId // ignore: cast_nullable_to_non_nullable
              as int?,
      flags: flags == freezed
          ? _value.flags
          : flags // ignore: cast_nullable_to_non_nullable
              as int,
      onlineStatus: onlineStatus == freezed
          ? _value.onlineStatus
          : onlineStatus // ignore: cast_nullable_to_non_nullable
              as OnlineStatus,
      inserted: inserted == freezed
          ? _value.inserted
          : inserted // ignore: cast_nullable_to_non_nullable
              as DateTime,
      admin: admin == freezed
          ? _value.admin
          : admin // ignore: cast_nullable_to_non_nullable
              as bool?,
      banned: banned == freezed
          ? _value.banned
          : banned // ignore: cast_nullable_to_non_nullable
              as bool,
      friends: friends == freezed
          ? _value.friends
          : friends // ignore: cast_nullable_to_non_nullable
              as List<Friend>?,
      usernameHistory: usernameHistory == freezed
          ? _value.usernameHistory
          : usernameHistory // ignore: cast_nullable_to_non_nullable
              as List<UsernameHistoryEntry>?,
      stats: stats == freezed
          ? _value.stats
          : stats // ignore: cast_nullable_to_non_nullable
              as UserProfileStats,
      stream: stream == freezed
          ? _value.stream
          : stream // ignore: cast_nullable_to_non_nullable
              as UserTwitchStream,
      hasXbox: hasXbox == freezed
          ? _value.hasXbox
          : hasXbox // ignore: cast_nullable_to_non_nullable
              as bool?,
      hasPlaystation: hasPlaystation == freezed
          ? _value.hasPlaystation
          : hasPlaystation // ignore: cast_nullable_to_non_nullable
              as bool?,
      xboxTag: xboxTag == freezed
          ? _value.xboxTag
          : xboxTag // ignore: cast_nullable_to_non_nullable
              as String?,
      psnId: psnId == freezed
          ? _value.psnId
          : psnId // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }

  @override
  $UserProfileStatsCopyWith<$Res> get stats {
    return $UserProfileStatsCopyWith<$Res>(_value.stats, (value) {
      return _then(_value.copyWith(stats: value));
    });
  }

  @override
  $UserTwitchStreamCopyWith<$Res> get stream {
    return $UserTwitchStreamCopyWith<$Res>(_value.stream, (value) {
      return _then(_value.copyWith(stream: value));
    });
  }
}

/// @nodoc
abstract class _$UserProfileCopyWith<$Res>
    implements $UserProfileCopyWith<$Res> {
  factory _$UserProfileCopyWith(
          _UserProfile value, $Res Function(_UserProfile) then) =
      __$UserProfileCopyWithImpl<$Res>;
  @override
  $Res call(
      {int? id,
      String username,
      String? avatar,
      String? email,
      int? countryId,
      int flags,
      OnlineStatus onlineStatus,
      @TimestampConverter() DateTime inserted,
      bool? admin,
      bool banned,
      List<Friend>? friends,
      List<UsernameHistoryEntry>? usernameHistory,
      UserProfileStats stats,
      UserTwitchStream stream,
      bool? hasXbox,
      bool? hasPlaystation,
      String? xboxTag,
      String? psnId});

  @override
  $UserProfileStatsCopyWith<$Res> get stats;
  @override
  $UserTwitchStreamCopyWith<$Res> get stream;
}

/// @nodoc
class __$UserProfileCopyWithImpl<$Res> extends _$UserProfileCopyWithImpl<$Res>
    implements _$UserProfileCopyWith<$Res> {
  __$UserProfileCopyWithImpl(
      _UserProfile _value, $Res Function(_UserProfile) _then)
      : super(_value, (v) => _then(v as _UserProfile));

  @override
  _UserProfile get _value => super._value as _UserProfile;

  @override
  $Res call({
    Object? id = freezed,
    Object? username = freezed,
    Object? avatar = freezed,
    Object? email = freezed,
    Object? countryId = freezed,
    Object? flags = freezed,
    Object? onlineStatus = freezed,
    Object? inserted = freezed,
    Object? admin = freezed,
    Object? banned = freezed,
    Object? friends = freezed,
    Object? usernameHistory = freezed,
    Object? stats = freezed,
    Object? stream = freezed,
    Object? hasXbox = freezed,
    Object? hasPlaystation = freezed,
    Object? xboxTag = freezed,
    Object? psnId = freezed,
  }) {
    return _then(_UserProfile(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      username: username == freezed
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      avatar: avatar == freezed
          ? _value.avatar
          : avatar // ignore: cast_nullable_to_non_nullable
              as String?,
      email: email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      countryId: countryId == freezed
          ? _value.countryId
          : countryId // ignore: cast_nullable_to_non_nullable
              as int?,
      flags: flags == freezed
          ? _value.flags
          : flags // ignore: cast_nullable_to_non_nullable
              as int,
      onlineStatus: onlineStatus == freezed
          ? _value.onlineStatus
          : onlineStatus // ignore: cast_nullable_to_non_nullable
              as OnlineStatus,
      inserted: inserted == freezed
          ? _value.inserted
          : inserted // ignore: cast_nullable_to_non_nullable
              as DateTime,
      admin: admin == freezed
          ? _value.admin
          : admin // ignore: cast_nullable_to_non_nullable
              as bool?,
      banned: banned == freezed
          ? _value.banned
          : banned // ignore: cast_nullable_to_non_nullable
              as bool,
      friends: friends == freezed
          ? _value.friends
          : friends // ignore: cast_nullable_to_non_nullable
              as List<Friend>?,
      usernameHistory: usernameHistory == freezed
          ? _value.usernameHistory
          : usernameHistory // ignore: cast_nullable_to_non_nullable
              as List<UsernameHistoryEntry>?,
      stats: stats == freezed
          ? _value.stats
          : stats // ignore: cast_nullable_to_non_nullable
              as UserProfileStats,
      stream: stream == freezed
          ? _value.stream
          : stream // ignore: cast_nullable_to_non_nullable
              as UserTwitchStream,
      hasXbox: hasXbox == freezed
          ? _value.hasXbox
          : hasXbox // ignore: cast_nullable_to_non_nullable
              as bool?,
      hasPlaystation: hasPlaystation == freezed
          ? _value.hasPlaystation
          : hasPlaystation // ignore: cast_nullable_to_non_nullable
              as bool?,
      xboxTag: xboxTag == freezed
          ? _value.xboxTag
          : xboxTag // ignore: cast_nullable_to_non_nullable
              as String?,
      psnId: psnId == freezed
          ? _value.psnId
          : psnId // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
@Implements<UserBasicInfo>()
class _$_UserProfile extends _UserProfile with DiagnosticableTreeMixin {
  _$_UserProfile(
      {this.id,
      required this.username,
      this.avatar,
      this.email,
      this.countryId,
      required this.flags,
      required this.onlineStatus,
      @TimestampConverter() required this.inserted,
      this.admin,
      required this.banned,
      this.friends,
      this.usernameHistory,
      required this.stats,
      required this.stream,
      this.hasXbox,
      this.hasPlaystation,
      this.xboxTag,
      this.psnId})
      : super._();

  factory _$_UserProfile.fromJson(Map<String, dynamic> json) =>
      _$$_UserProfileFromJson(json);

  @override
  final int? id;
  @override
  final String username;
  @override
  final String? avatar;
  @override
  final String? email;
  @override
  final int? countryId;
  @override
  final int flags;
  @override
  final OnlineStatus onlineStatus;
  @override
  @TimestampConverter()
  final DateTime inserted;
  @override
  final bool? admin;
  @override
  final bool banned;
  @override
  final List<Friend>? friends;
  @override
  final List<UsernameHistoryEntry>? usernameHistory;
  @override
  final UserProfileStats stats;
  @override
  final UserTwitchStream stream;
  @override
  final bool? hasXbox;
  @override
  final bool? hasPlaystation;
  @override
  final String? xboxTag;
  @override
  final String? psnId;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'UserProfile(id: $id, username: $username, avatar: $avatar, email: $email, countryId: $countryId, flags: $flags, onlineStatus: $onlineStatus, inserted: $inserted, admin: $admin, banned: $banned, friends: $friends, usernameHistory: $usernameHistory, stats: $stats, stream: $stream, hasXbox: $hasXbox, hasPlaystation: $hasPlaystation, xboxTag: $xboxTag, psnId: $psnId)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'UserProfile'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('username', username))
      ..add(DiagnosticsProperty('avatar', avatar))
      ..add(DiagnosticsProperty('email', email))
      ..add(DiagnosticsProperty('countryId', countryId))
      ..add(DiagnosticsProperty('flags', flags))
      ..add(DiagnosticsProperty('onlineStatus', onlineStatus))
      ..add(DiagnosticsProperty('inserted', inserted))
      ..add(DiagnosticsProperty('admin', admin))
      ..add(DiagnosticsProperty('banned', banned))
      ..add(DiagnosticsProperty('friends', friends))
      ..add(DiagnosticsProperty('usernameHistory', usernameHistory))
      ..add(DiagnosticsProperty('stats', stats))
      ..add(DiagnosticsProperty('stream', stream))
      ..add(DiagnosticsProperty('hasXbox', hasXbox))
      ..add(DiagnosticsProperty('hasPlaystation', hasPlaystation))
      ..add(DiagnosticsProperty('xboxTag', xboxTag))
      ..add(DiagnosticsProperty('psnId', psnId));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _UserProfile &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.username, username) &&
            const DeepCollectionEquality().equals(other.avatar, avatar) &&
            const DeepCollectionEquality().equals(other.email, email) &&
            const DeepCollectionEquality().equals(other.countryId, countryId) &&
            const DeepCollectionEquality().equals(other.flags, flags) &&
            const DeepCollectionEquality()
                .equals(other.onlineStatus, onlineStatus) &&
            const DeepCollectionEquality().equals(other.inserted, inserted) &&
            const DeepCollectionEquality().equals(other.admin, admin) &&
            const DeepCollectionEquality().equals(other.banned, banned) &&
            const DeepCollectionEquality().equals(other.friends, friends) &&
            const DeepCollectionEquality()
                .equals(other.usernameHistory, usernameHistory) &&
            const DeepCollectionEquality().equals(other.stats, stats) &&
            const DeepCollectionEquality().equals(other.stream, stream) &&
            const DeepCollectionEquality().equals(other.hasXbox, hasXbox) &&
            const DeepCollectionEquality()
                .equals(other.hasPlaystation, hasPlaystation) &&
            const DeepCollectionEquality().equals(other.xboxTag, xboxTag) &&
            const DeepCollectionEquality().equals(other.psnId, psnId));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(username),
      const DeepCollectionEquality().hash(avatar),
      const DeepCollectionEquality().hash(email),
      const DeepCollectionEquality().hash(countryId),
      const DeepCollectionEquality().hash(flags),
      const DeepCollectionEquality().hash(onlineStatus),
      const DeepCollectionEquality().hash(inserted),
      const DeepCollectionEquality().hash(admin),
      const DeepCollectionEquality().hash(banned),
      const DeepCollectionEquality().hash(friends),
      const DeepCollectionEquality().hash(usernameHistory),
      const DeepCollectionEquality().hash(stats),
      const DeepCollectionEquality().hash(stream),
      const DeepCollectionEquality().hash(hasXbox),
      const DeepCollectionEquality().hash(hasPlaystation),
      const DeepCollectionEquality().hash(xboxTag),
      const DeepCollectionEquality().hash(psnId));

  @JsonKey(ignore: true)
  @override
  _$UserProfileCopyWith<_UserProfile> get copyWith =>
      __$UserProfileCopyWithImpl<_UserProfile>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UserProfileToJson(this);
  }
}

abstract class _UserProfile extends UserProfile implements UserBasicInfo {
  factory _UserProfile(
      {int? id,
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
      String? psnId}) = _$_UserProfile;
  _UserProfile._() : super._();

  factory _UserProfile.fromJson(Map<String, dynamic> json) =
      _$_UserProfile.fromJson;

  @override
  int? get id;
  @override
  String get username;
  @override
  String? get avatar;
  @override
  String? get email;
  @override
  int? get countryId;
  @override
  int get flags;
  @override
  OnlineStatus get onlineStatus;
  @override
  @TimestampConverter()
  DateTime get inserted;
  @override
  bool? get admin;
  @override
  bool get banned;
  @override
  List<Friend>? get friends;
  @override
  List<UsernameHistoryEntry>? get usernameHistory;
  @override
  UserProfileStats get stats;
  @override
  UserTwitchStream get stream;
  @override
  bool? get hasXbox;
  @override
  bool? get hasPlaystation;
  @override
  String? get xboxTag;
  @override
  String? get psnId;
  @override
  @JsonKey(ignore: true)
  _$UserProfileCopyWith<_UserProfile> get copyWith =>
      throw _privateConstructorUsedError;
}

Friend _$FriendFromJson(Map<String, dynamic> json) {
  return _Friend.fromJson(json);
}

/// @nodoc
class _$FriendTearOff {
  const _$FriendTearOff();

  _Friend call(
      {int? id,
      required String username,
      String? avatar,
      int? countryId,
      required int flags,
      Console? console,
      required OnlineStatus onlineStatus,
      @TimestampConverter() required DateTime inserted}) {
    return _Friend(
      id: id,
      username: username,
      avatar: avatar,
      countryId: countryId,
      flags: flags,
      console: console,
      onlineStatus: onlineStatus,
      inserted: inserted,
    );
  }

  Friend fromJson(Map<String, Object?> json) {
    return Friend.fromJson(json);
  }
}

/// @nodoc
const $Friend = _$FriendTearOff();

/// @nodoc
mixin _$Friend {
  int? get id => throw _privateConstructorUsedError;
  String get username => throw _privateConstructorUsedError;
  String? get avatar => throw _privateConstructorUsedError;
  int? get countryId => throw _privateConstructorUsedError;
  int get flags => throw _privateConstructorUsedError;
  Console? get console => throw _privateConstructorUsedError;
  OnlineStatus get onlineStatus => throw _privateConstructorUsedError;
  @TimestampConverter()
  DateTime get inserted => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FriendCopyWith<Friend> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FriendCopyWith<$Res> {
  factory $FriendCopyWith(Friend value, $Res Function(Friend) then) =
      _$FriendCopyWithImpl<$Res>;
  $Res call(
      {int? id,
      String username,
      String? avatar,
      int? countryId,
      int flags,
      Console? console,
      OnlineStatus onlineStatus,
      @TimestampConverter() DateTime inserted});
}

/// @nodoc
class _$FriendCopyWithImpl<$Res> implements $FriendCopyWith<$Res> {
  _$FriendCopyWithImpl(this._value, this._then);

  final Friend _value;
  // ignore: unused_field
  final $Res Function(Friend) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? username = freezed,
    Object? avatar = freezed,
    Object? countryId = freezed,
    Object? flags = freezed,
    Object? console = freezed,
    Object? onlineStatus = freezed,
    Object? inserted = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
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
      flags: flags == freezed
          ? _value.flags
          : flags // ignore: cast_nullable_to_non_nullable
              as int,
      console: console == freezed
          ? _value.console
          : console // ignore: cast_nullable_to_non_nullable
              as Console?,
      onlineStatus: onlineStatus == freezed
          ? _value.onlineStatus
          : onlineStatus // ignore: cast_nullable_to_non_nullable
              as OnlineStatus,
      inserted: inserted == freezed
          ? _value.inserted
          : inserted // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
abstract class _$FriendCopyWith<$Res> implements $FriendCopyWith<$Res> {
  factory _$FriendCopyWith(_Friend value, $Res Function(_Friend) then) =
      __$FriendCopyWithImpl<$Res>;
  @override
  $Res call(
      {int? id,
      String username,
      String? avatar,
      int? countryId,
      int flags,
      Console? console,
      OnlineStatus onlineStatus,
      @TimestampConverter() DateTime inserted});
}

/// @nodoc
class __$FriendCopyWithImpl<$Res> extends _$FriendCopyWithImpl<$Res>
    implements _$FriendCopyWith<$Res> {
  __$FriendCopyWithImpl(_Friend _value, $Res Function(_Friend) _then)
      : super(_value, (v) => _then(v as _Friend));

  @override
  _Friend get _value => super._value as _Friend;

  @override
  $Res call({
    Object? id = freezed,
    Object? username = freezed,
    Object? avatar = freezed,
    Object? countryId = freezed,
    Object? flags = freezed,
    Object? console = freezed,
    Object? onlineStatus = freezed,
    Object? inserted = freezed,
  }) {
    return _then(_Friend(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
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
      flags: flags == freezed
          ? _value.flags
          : flags // ignore: cast_nullable_to_non_nullable
              as int,
      console: console == freezed
          ? _value.console
          : console // ignore: cast_nullable_to_non_nullable
              as Console?,
      onlineStatus: onlineStatus == freezed
          ? _value.onlineStatus
          : onlineStatus // ignore: cast_nullable_to_non_nullable
              as OnlineStatus,
      inserted: inserted == freezed
          ? _value.inserted
          : inserted // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
@Implements<UserBasicInfo>()
class _$_Friend extends _Friend with DiagnosticableTreeMixin {
  _$_Friend(
      {this.id,
      required this.username,
      this.avatar,
      this.countryId,
      required this.flags,
      this.console,
      required this.onlineStatus,
      @TimestampConverter() required this.inserted})
      : super._();

  factory _$_Friend.fromJson(Map<String, dynamic> json) =>
      _$$_FriendFromJson(json);

  @override
  final int? id;
  @override
  final String username;
  @override
  final String? avatar;
  @override
  final int? countryId;
  @override
  final int flags;
  @override
  final Console? console;
  @override
  final OnlineStatus onlineStatus;
  @override
  @TimestampConverter()
  final DateTime inserted;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Friend(id: $id, username: $username, avatar: $avatar, countryId: $countryId, flags: $flags, console: $console, onlineStatus: $onlineStatus, inserted: $inserted)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Friend'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('username', username))
      ..add(DiagnosticsProperty('avatar', avatar))
      ..add(DiagnosticsProperty('countryId', countryId))
      ..add(DiagnosticsProperty('flags', flags))
      ..add(DiagnosticsProperty('console', console))
      ..add(DiagnosticsProperty('onlineStatus', onlineStatus))
      ..add(DiagnosticsProperty('inserted', inserted));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Friend &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.username, username) &&
            const DeepCollectionEquality().equals(other.avatar, avatar) &&
            const DeepCollectionEquality().equals(other.countryId, countryId) &&
            const DeepCollectionEquality().equals(other.flags, flags) &&
            const DeepCollectionEquality().equals(other.console, console) &&
            const DeepCollectionEquality()
                .equals(other.onlineStatus, onlineStatus) &&
            const DeepCollectionEquality().equals(other.inserted, inserted));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(username),
      const DeepCollectionEquality().hash(avatar),
      const DeepCollectionEquality().hash(countryId),
      const DeepCollectionEquality().hash(flags),
      const DeepCollectionEquality().hash(console),
      const DeepCollectionEquality().hash(onlineStatus),
      const DeepCollectionEquality().hash(inserted));

  @JsonKey(ignore: true)
  @override
  _$FriendCopyWith<_Friend> get copyWith =>
      __$FriendCopyWithImpl<_Friend>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_FriendToJson(this);
  }
}

abstract class _Friend extends Friend implements UserBasicInfo {
  factory _Friend(
      {int? id,
      required String username,
      String? avatar,
      int? countryId,
      required int flags,
      Console? console,
      required OnlineStatus onlineStatus,
      @TimestampConverter() required DateTime inserted}) = _$_Friend;
  _Friend._() : super._();

  factory _Friend.fromJson(Map<String, dynamic> json) = _$_Friend.fromJson;

  @override
  int? get id;
  @override
  String get username;
  @override
  String? get avatar;
  @override
  int? get countryId;
  @override
  int get flags;
  @override
  Console? get console;
  @override
  OnlineStatus get onlineStatus;
  @override
  @TimestampConverter()
  DateTime get inserted;
  @override
  @JsonKey(ignore: true)
  _$FriendCopyWith<_Friend> get copyWith => throw _privateConstructorUsedError;
}

UsernameHistoryEntry _$UsernameHistoryEntryFromJson(Map<String, dynamic> json) {
  return _UsernameHistoryEntry.fromJson(json);
}

/// @nodoc
class _$UsernameHistoryEntryTearOff {
  const _$UsernameHistoryEntryTearOff();

  _UsernameHistoryEntry call(
      {required int id,
      required String username,
      @TimestampConverter() required DateTime inserted}) {
    return _UsernameHistoryEntry(
      id: id,
      username: username,
      inserted: inserted,
    );
  }

  UsernameHistoryEntry fromJson(Map<String, Object?> json) {
    return UsernameHistoryEntry.fromJson(json);
  }
}

/// @nodoc
const $UsernameHistoryEntry = _$UsernameHistoryEntryTearOff();

/// @nodoc
mixin _$UsernameHistoryEntry {
  int get id => throw _privateConstructorUsedError;
  String get username => throw _privateConstructorUsedError;
  @TimestampConverter()
  DateTime get inserted => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UsernameHistoryEntryCopyWith<UsernameHistoryEntry> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UsernameHistoryEntryCopyWith<$Res> {
  factory $UsernameHistoryEntryCopyWith(UsernameHistoryEntry value,
          $Res Function(UsernameHistoryEntry) then) =
      _$UsernameHistoryEntryCopyWithImpl<$Res>;
  $Res call({int id, String username, @TimestampConverter() DateTime inserted});
}

/// @nodoc
class _$UsernameHistoryEntryCopyWithImpl<$Res>
    implements $UsernameHistoryEntryCopyWith<$Res> {
  _$UsernameHistoryEntryCopyWithImpl(this._value, this._then);

  final UsernameHistoryEntry _value;
  // ignore: unused_field
  final $Res Function(UsernameHistoryEntry) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? username = freezed,
    Object? inserted = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      username: username == freezed
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      inserted: inserted == freezed
          ? _value.inserted
          : inserted // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
abstract class _$UsernameHistoryEntryCopyWith<$Res>
    implements $UsernameHistoryEntryCopyWith<$Res> {
  factory _$UsernameHistoryEntryCopyWith(_UsernameHistoryEntry value,
          $Res Function(_UsernameHistoryEntry) then) =
      __$UsernameHistoryEntryCopyWithImpl<$Res>;
  @override
  $Res call({int id, String username, @TimestampConverter() DateTime inserted});
}

/// @nodoc
class __$UsernameHistoryEntryCopyWithImpl<$Res>
    extends _$UsernameHistoryEntryCopyWithImpl<$Res>
    implements _$UsernameHistoryEntryCopyWith<$Res> {
  __$UsernameHistoryEntryCopyWithImpl(
      _UsernameHistoryEntry _value, $Res Function(_UsernameHistoryEntry) _then)
      : super(_value, (v) => _then(v as _UsernameHistoryEntry));

  @override
  _UsernameHistoryEntry get _value => super._value as _UsernameHistoryEntry;

  @override
  $Res call({
    Object? id = freezed,
    Object? username = freezed,
    Object? inserted = freezed,
  }) {
    return _then(_UsernameHistoryEntry(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      username: username == freezed
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      inserted: inserted == freezed
          ? _value.inserted
          : inserted // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UsernameHistoryEntry extends _UsernameHistoryEntry
    with DiagnosticableTreeMixin {
  _$_UsernameHistoryEntry(
      {required this.id,
      required this.username,
      @TimestampConverter() required this.inserted})
      : super._();

  factory _$_UsernameHistoryEntry.fromJson(Map<String, dynamic> json) =>
      _$$_UsernameHistoryEntryFromJson(json);

  @override
  final int id;
  @override
  final String username;
  @override
  @TimestampConverter()
  final DateTime inserted;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'UsernameHistoryEntry(id: $id, username: $username, inserted: $inserted)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'UsernameHistoryEntry'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('username', username))
      ..add(DiagnosticsProperty('inserted', inserted));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _UsernameHistoryEntry &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.username, username) &&
            const DeepCollectionEquality().equals(other.inserted, inserted));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(username),
      const DeepCollectionEquality().hash(inserted));

  @JsonKey(ignore: true)
  @override
  _$UsernameHistoryEntryCopyWith<_UsernameHistoryEntry> get copyWith =>
      __$UsernameHistoryEntryCopyWithImpl<_UsernameHistoryEntry>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UsernameHistoryEntryToJson(this);
  }
}

abstract class _UsernameHistoryEntry extends UsernameHistoryEntry {
  factory _UsernameHistoryEntry(
          {required int id,
          required String username,
          @TimestampConverter() required DateTime inserted}) =
      _$_UsernameHistoryEntry;
  _UsernameHistoryEntry._() : super._();

  factory _UsernameHistoryEntry.fromJson(Map<String, dynamic> json) =
      _$_UsernameHistoryEntry.fromJson;

  @override
  int get id;
  @override
  String get username;
  @override
  @TimestampConverter()
  DateTime get inserted;
  @override
  @JsonKey(ignore: true)
  _$UsernameHistoryEntryCopyWith<_UsernameHistoryEntry> get copyWith =>
      throw _privateConstructorUsedError;
}

UserTwitchStream _$UserTwitchStreamFromJson(Map<String, dynamic> json) {
  return _UserTwitchStream.fromJson(json);
}

/// @nodoc
class _$UserTwitchStreamTearOff {
  const _$UserTwitchStreamTearOff();

  _UserTwitchStream call(
      {required String username, String? status, int? viewers}) {
    return _UserTwitchStream(
      username: username,
      status: status,
      viewers: viewers,
    );
  }

  UserTwitchStream fromJson(Map<String, Object?> json) {
    return UserTwitchStream.fromJson(json);
  }
}

/// @nodoc
const $UserTwitchStream = _$UserTwitchStreamTearOff();

/// @nodoc
mixin _$UserTwitchStream {
  String get username => throw _privateConstructorUsedError;
  String? get status => throw _privateConstructorUsedError;
  int? get viewers => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserTwitchStreamCopyWith<UserTwitchStream> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserTwitchStreamCopyWith<$Res> {
  factory $UserTwitchStreamCopyWith(
          UserTwitchStream value, $Res Function(UserTwitchStream) then) =
      _$UserTwitchStreamCopyWithImpl<$Res>;
  $Res call({String username, String? status, int? viewers});
}

/// @nodoc
class _$UserTwitchStreamCopyWithImpl<$Res>
    implements $UserTwitchStreamCopyWith<$Res> {
  _$UserTwitchStreamCopyWithImpl(this._value, this._then);

  final UserTwitchStream _value;
  // ignore: unused_field
  final $Res Function(UserTwitchStream) _then;

  @override
  $Res call({
    Object? username = freezed,
    Object? status = freezed,
    Object? viewers = freezed,
  }) {
    return _then(_value.copyWith(
      username: username == freezed
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      viewers: viewers == freezed
          ? _value.viewers
          : viewers // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
abstract class _$UserTwitchStreamCopyWith<$Res>
    implements $UserTwitchStreamCopyWith<$Res> {
  factory _$UserTwitchStreamCopyWith(
          _UserTwitchStream value, $Res Function(_UserTwitchStream) then) =
      __$UserTwitchStreamCopyWithImpl<$Res>;
  @override
  $Res call({String username, String? status, int? viewers});
}

/// @nodoc
class __$UserTwitchStreamCopyWithImpl<$Res>
    extends _$UserTwitchStreamCopyWithImpl<$Res>
    implements _$UserTwitchStreamCopyWith<$Res> {
  __$UserTwitchStreamCopyWithImpl(
      _UserTwitchStream _value, $Res Function(_UserTwitchStream) _then)
      : super(_value, (v) => _then(v as _UserTwitchStream));

  @override
  _UserTwitchStream get _value => super._value as _UserTwitchStream;

  @override
  $Res call({
    Object? username = freezed,
    Object? status = freezed,
    Object? viewers = freezed,
  }) {
    return _then(_UserTwitchStream(
      username: username == freezed
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      viewers: viewers == freezed
          ? _value.viewers
          : viewers // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UserTwitchStream extends _UserTwitchStream
    with DiagnosticableTreeMixin {
  _$_UserTwitchStream({required this.username, this.status, this.viewers})
      : super._();

  factory _$_UserTwitchStream.fromJson(Map<String, dynamic> json) =>
      _$$_UserTwitchStreamFromJson(json);

  @override
  final String username;
  @override
  final String? status;
  @override
  final int? viewers;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'UserTwitchStream(username: $username, status: $status, viewers: $viewers)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'UserTwitchStream'))
      ..add(DiagnosticsProperty('username', username))
      ..add(DiagnosticsProperty('status', status))
      ..add(DiagnosticsProperty('viewers', viewers));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _UserTwitchStream &&
            const DeepCollectionEquality().equals(other.username, username) &&
            const DeepCollectionEquality().equals(other.status, status) &&
            const DeepCollectionEquality().equals(other.viewers, viewers));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(username),
      const DeepCollectionEquality().hash(status),
      const DeepCollectionEquality().hash(viewers));

  @JsonKey(ignore: true)
  @override
  _$UserTwitchStreamCopyWith<_UserTwitchStream> get copyWith =>
      __$UserTwitchStreamCopyWithImpl<_UserTwitchStream>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UserTwitchStreamToJson(this);
  }
}

abstract class _UserTwitchStream extends UserTwitchStream {
  factory _UserTwitchStream(
      {required String username,
      String? status,
      int? viewers}) = _$_UserTwitchStream;
  _UserTwitchStream._() : super._();

  factory _UserTwitchStream.fromJson(Map<String, dynamic> json) =
      _$_UserTwitchStream.fromJson;

  @override
  String get username;
  @override
  String? get status;
  @override
  int? get viewers;
  @override
  @JsonKey(ignore: true)
  _$UserTwitchStreamCopyWith<_UserTwitchStream> get copyWith =>
      throw _privateConstructorUsedError;
}
