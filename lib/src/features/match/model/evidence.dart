import 'package:fifa/src/common/data/converters.dart';
import 'package:fifa/src/common/widgets/app_image.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'evidence.freezed.dart';
part 'evidence.g.dart';

@freezed
class Evidence with _$Evidence {
  const factory Evidence({
    required int id,
    required int userId,
    required String? image,
    required String? youtubeId,
    @TimestampConverter() required DateTime inserted,
  }) = _Evidence;
  const Evidence._();

  factory Evidence.fromJson(Map<String, dynamic> json) => _$EvidenceFromJson(json);
}

@freezed
class UserEvidence with _$UserEvidence {
  // @With<Evidence>()
  const factory UserEvidence({
    required int id,
    required int userId,
    required String? image,
    required String? youtubeId,
    @TimestampConverter() required DateTime inserted,
    required String username,
    required String? avatar,
  }) = _UserEvidence;
  const UserEvidence._();

  bool isValid() {
    return image != null || youtubeId != null;
  }

  String? get title {
    if (image != null) return 'Image # $id';
    if (youtubeId != null) return 'https://www.youtube.com/watch?v=$youtubeId';
  }

  String? get url {
    if (image != null) return buildImageUrl(image!, null);
    if (youtubeId != null) return 'https://www.youtube.com/watch?v=$youtubeId';
  }

  factory UserEvidence.fromJson(Map<String, dynamic> json) => _$UserEvidenceFromJson(json);
}
