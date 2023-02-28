import 'package:fifa/src/common/data/converters.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'social_media.freezed.dart';
part 'social_media.g.dart';

List<SocialMedia> socialMediaFromJson(List<dynamic> str) => List<SocialMedia>.from(
    str.map<SocialMedia>((dynamic x) => SocialMedia.fromJson(x as Map<String, dynamic>)));

@freezed
abstract class SocialMedia with _$SocialMedia {
  const factory SocialMedia({
    required int id,
    required int mediaId,
    required SocialMediaPlatform platform,
    String? image,
    String? content,
    required String url,
    @TimestampConverter() required DateTime inserted,
  }) = _SocialMedia;

  factory SocialMedia.fromJson(Map<String, dynamic> json) => _$SocialMediaFromJson(json);
}

enum SocialMediaPlatform {
  @JsonValue(0)
  instagram,
  @JsonValue(1)
  twitter
}
