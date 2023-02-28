// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'evidence.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Evidence _$EvidenceFromJson(Map<String, dynamic> json) {
  return _Evidence.fromJson(json);
}

/// @nodoc
class _$EvidenceTearOff {
  const _$EvidenceTearOff();

  _Evidence call(
      {required int id,
      required int userId,
      required String? image,
      required String? youtubeId,
      @TimestampConverter() required DateTime inserted}) {
    return _Evidence(
      id: id,
      userId: userId,
      image: image,
      youtubeId: youtubeId,
      inserted: inserted,
    );
  }

  Evidence fromJson(Map<String, Object?> json) {
    return Evidence.fromJson(json);
  }
}

/// @nodoc
const $Evidence = _$EvidenceTearOff();

/// @nodoc
mixin _$Evidence {
  int get id => throw _privateConstructorUsedError;
  int get userId => throw _privateConstructorUsedError;
  String? get image => throw _privateConstructorUsedError;
  String? get youtubeId => throw _privateConstructorUsedError;
  @TimestampConverter()
  DateTime get inserted => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $EvidenceCopyWith<Evidence> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EvidenceCopyWith<$Res> {
  factory $EvidenceCopyWith(Evidence value, $Res Function(Evidence) then) =
      _$EvidenceCopyWithImpl<$Res>;
  $Res call(
      {int id,
      int userId,
      String? image,
      String? youtubeId,
      @TimestampConverter() DateTime inserted});
}

/// @nodoc
class _$EvidenceCopyWithImpl<$Res> implements $EvidenceCopyWith<$Res> {
  _$EvidenceCopyWithImpl(this._value, this._then);

  final Evidence _value;
  // ignore: unused_field
  final $Res Function(Evidence) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? userId = freezed,
    Object? image = freezed,
    Object? youtubeId = freezed,
    Object? inserted = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      userId: userId == freezed
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int,
      image: image == freezed
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
      youtubeId: youtubeId == freezed
          ? _value.youtubeId
          : youtubeId // ignore: cast_nullable_to_non_nullable
              as String?,
      inserted: inserted == freezed
          ? _value.inserted
          : inserted // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
abstract class _$EvidenceCopyWith<$Res> implements $EvidenceCopyWith<$Res> {
  factory _$EvidenceCopyWith(_Evidence value, $Res Function(_Evidence) then) =
      __$EvidenceCopyWithImpl<$Res>;
  @override
  $Res call(
      {int id,
      int userId,
      String? image,
      String? youtubeId,
      @TimestampConverter() DateTime inserted});
}

/// @nodoc
class __$EvidenceCopyWithImpl<$Res> extends _$EvidenceCopyWithImpl<$Res>
    implements _$EvidenceCopyWith<$Res> {
  __$EvidenceCopyWithImpl(_Evidence _value, $Res Function(_Evidence) _then)
      : super(_value, (v) => _then(v as _Evidence));

  @override
  _Evidence get _value => super._value as _Evidence;

  @override
  $Res call({
    Object? id = freezed,
    Object? userId = freezed,
    Object? image = freezed,
    Object? youtubeId = freezed,
    Object? inserted = freezed,
  }) {
    return _then(_Evidence(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      userId: userId == freezed
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int,
      image: image == freezed
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
      youtubeId: youtubeId == freezed
          ? _value.youtubeId
          : youtubeId // ignore: cast_nullable_to_non_nullable
              as String?,
      inserted: inserted == freezed
          ? _value.inserted
          : inserted // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Evidence extends _Evidence with DiagnosticableTreeMixin {
  const _$_Evidence(
      {required this.id,
      required this.userId,
      required this.image,
      required this.youtubeId,
      @TimestampConverter() required this.inserted})
      : super._();

  factory _$_Evidence.fromJson(Map<String, dynamic> json) =>
      _$$_EvidenceFromJson(json);

  @override
  final int id;
  @override
  final int userId;
  @override
  final String? image;
  @override
  final String? youtubeId;
  @override
  @TimestampConverter()
  final DateTime inserted;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Evidence(id: $id, userId: $userId, image: $image, youtubeId: $youtubeId, inserted: $inserted)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Evidence'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('userId', userId))
      ..add(DiagnosticsProperty('image', image))
      ..add(DiagnosticsProperty('youtubeId', youtubeId))
      ..add(DiagnosticsProperty('inserted', inserted));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Evidence &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.userId, userId) &&
            const DeepCollectionEquality().equals(other.image, image) &&
            const DeepCollectionEquality().equals(other.youtubeId, youtubeId) &&
            const DeepCollectionEquality().equals(other.inserted, inserted));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(userId),
      const DeepCollectionEquality().hash(image),
      const DeepCollectionEquality().hash(youtubeId),
      const DeepCollectionEquality().hash(inserted));

  @JsonKey(ignore: true)
  @override
  _$EvidenceCopyWith<_Evidence> get copyWith =>
      __$EvidenceCopyWithImpl<_Evidence>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_EvidenceToJson(this);
  }
}

abstract class _Evidence extends Evidence {
  const factory _Evidence(
      {required int id,
      required int userId,
      required String? image,
      required String? youtubeId,
      @TimestampConverter() required DateTime inserted}) = _$_Evidence;
  const _Evidence._() : super._();

  factory _Evidence.fromJson(Map<String, dynamic> json) = _$_Evidence.fromJson;

  @override
  int get id;
  @override
  int get userId;
  @override
  String? get image;
  @override
  String? get youtubeId;
  @override
  @TimestampConverter()
  DateTime get inserted;
  @override
  @JsonKey(ignore: true)
  _$EvidenceCopyWith<_Evidence> get copyWith =>
      throw _privateConstructorUsedError;
}

UserEvidence _$UserEvidenceFromJson(Map<String, dynamic> json) {
  return _UserEvidence.fromJson(json);
}

/// @nodoc
class _$UserEvidenceTearOff {
  const _$UserEvidenceTearOff();

  _UserEvidence call(
      {required int id,
      required int userId,
      required String? image,
      required String? youtubeId,
      @TimestampConverter() required DateTime inserted,
      required String username,
      required String? avatar}) {
    return _UserEvidence(
      id: id,
      userId: userId,
      image: image,
      youtubeId: youtubeId,
      inserted: inserted,
      username: username,
      avatar: avatar,
    );
  }

  UserEvidence fromJson(Map<String, Object?> json) {
    return UserEvidence.fromJson(json);
  }
}

/// @nodoc
const $UserEvidence = _$UserEvidenceTearOff();

/// @nodoc
mixin _$UserEvidence {
  int get id => throw _privateConstructorUsedError;
  int get userId => throw _privateConstructorUsedError;
  String? get image => throw _privateConstructorUsedError;
  String? get youtubeId => throw _privateConstructorUsedError;
  @TimestampConverter()
  DateTime get inserted => throw _privateConstructorUsedError;
  String get username => throw _privateConstructorUsedError;
  String? get avatar => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserEvidenceCopyWith<UserEvidence> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserEvidenceCopyWith<$Res> {
  factory $UserEvidenceCopyWith(
          UserEvidence value, $Res Function(UserEvidence) then) =
      _$UserEvidenceCopyWithImpl<$Res>;
  $Res call(
      {int id,
      int userId,
      String? image,
      String? youtubeId,
      @TimestampConverter() DateTime inserted,
      String username,
      String? avatar});
}

/// @nodoc
class _$UserEvidenceCopyWithImpl<$Res> implements $UserEvidenceCopyWith<$Res> {
  _$UserEvidenceCopyWithImpl(this._value, this._then);

  final UserEvidence _value;
  // ignore: unused_field
  final $Res Function(UserEvidence) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? userId = freezed,
    Object? image = freezed,
    Object? youtubeId = freezed,
    Object? inserted = freezed,
    Object? username = freezed,
    Object? avatar = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      userId: userId == freezed
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int,
      image: image == freezed
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
      youtubeId: youtubeId == freezed
          ? _value.youtubeId
          : youtubeId // ignore: cast_nullable_to_non_nullable
              as String?,
      inserted: inserted == freezed
          ? _value.inserted
          : inserted // ignore: cast_nullable_to_non_nullable
              as DateTime,
      username: username == freezed
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      avatar: avatar == freezed
          ? _value.avatar
          : avatar // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$UserEvidenceCopyWith<$Res>
    implements $UserEvidenceCopyWith<$Res> {
  factory _$UserEvidenceCopyWith(
          _UserEvidence value, $Res Function(_UserEvidence) then) =
      __$UserEvidenceCopyWithImpl<$Res>;
  @override
  $Res call(
      {int id,
      int userId,
      String? image,
      String? youtubeId,
      @TimestampConverter() DateTime inserted,
      String username,
      String? avatar});
}

/// @nodoc
class __$UserEvidenceCopyWithImpl<$Res> extends _$UserEvidenceCopyWithImpl<$Res>
    implements _$UserEvidenceCopyWith<$Res> {
  __$UserEvidenceCopyWithImpl(
      _UserEvidence _value, $Res Function(_UserEvidence) _then)
      : super(_value, (v) => _then(v as _UserEvidence));

  @override
  _UserEvidence get _value => super._value as _UserEvidence;

  @override
  $Res call({
    Object? id = freezed,
    Object? userId = freezed,
    Object? image = freezed,
    Object? youtubeId = freezed,
    Object? inserted = freezed,
    Object? username = freezed,
    Object? avatar = freezed,
  }) {
    return _then(_UserEvidence(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      userId: userId == freezed
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int,
      image: image == freezed
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
      youtubeId: youtubeId == freezed
          ? _value.youtubeId
          : youtubeId // ignore: cast_nullable_to_non_nullable
              as String?,
      inserted: inserted == freezed
          ? _value.inserted
          : inserted // ignore: cast_nullable_to_non_nullable
              as DateTime,
      username: username == freezed
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      avatar: avatar == freezed
          ? _value.avatar
          : avatar // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UserEvidence extends _UserEvidence with DiagnosticableTreeMixin {
  const _$_UserEvidence(
      {required this.id,
      required this.userId,
      required this.image,
      required this.youtubeId,
      @TimestampConverter() required this.inserted,
      required this.username,
      required this.avatar})
      : super._();

  factory _$_UserEvidence.fromJson(Map<String, dynamic> json) =>
      _$$_UserEvidenceFromJson(json);

  @override
  final int id;
  @override
  final int userId;
  @override
  final String? image;
  @override
  final String? youtubeId;
  @override
  @TimestampConverter()
  final DateTime inserted;
  @override
  final String username;
  @override
  final String? avatar;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'UserEvidence(id: $id, userId: $userId, image: $image, youtubeId: $youtubeId, inserted: $inserted, username: $username, avatar: $avatar)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'UserEvidence'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('userId', userId))
      ..add(DiagnosticsProperty('image', image))
      ..add(DiagnosticsProperty('youtubeId', youtubeId))
      ..add(DiagnosticsProperty('inserted', inserted))
      ..add(DiagnosticsProperty('username', username))
      ..add(DiagnosticsProperty('avatar', avatar));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _UserEvidence &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.userId, userId) &&
            const DeepCollectionEquality().equals(other.image, image) &&
            const DeepCollectionEquality().equals(other.youtubeId, youtubeId) &&
            const DeepCollectionEquality().equals(other.inserted, inserted) &&
            const DeepCollectionEquality().equals(other.username, username) &&
            const DeepCollectionEquality().equals(other.avatar, avatar));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(userId),
      const DeepCollectionEquality().hash(image),
      const DeepCollectionEquality().hash(youtubeId),
      const DeepCollectionEquality().hash(inserted),
      const DeepCollectionEquality().hash(username),
      const DeepCollectionEquality().hash(avatar));

  @JsonKey(ignore: true)
  @override
  _$UserEvidenceCopyWith<_UserEvidence> get copyWith =>
      __$UserEvidenceCopyWithImpl<_UserEvidence>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UserEvidenceToJson(this);
  }
}

abstract class _UserEvidence extends UserEvidence {
  const factory _UserEvidence(
      {required int id,
      required int userId,
      required String? image,
      required String? youtubeId,
      @TimestampConverter() required DateTime inserted,
      required String username,
      required String? avatar}) = _$_UserEvidence;
  const _UserEvidence._() : super._();

  factory _UserEvidence.fromJson(Map<String, dynamic> json) =
      _$_UserEvidence.fromJson;

  @override
  int get id;
  @override
  int get userId;
  @override
  String? get image;
  @override
  String? get youtubeId;
  @override
  @TimestampConverter()
  DateTime get inserted;
  @override
  String get username;
  @override
  String? get avatar;
  @override
  @JsonKey(ignore: true)
  _$UserEvidenceCopyWith<_UserEvidence> get copyWith =>
      throw _privateConstructorUsedError;
}
