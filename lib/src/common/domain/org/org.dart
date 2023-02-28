import 'package:fifa/src/common/data/converters.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'org.g.dart';

@JsonSerializable()
class OrgRef {
  final int id;
  final String name;
  final String? logo;
  final String? background;
  final String? bannerUrl;
  final String slug;
  final int flags;
  @TimestampConverter()
  final DateTime inserted;

  OrgRef({
    required this.id,
    required this.name,
    this.logo,
    this.background,
    this.bannerUrl,
    required this.slug,
    required this.flags,
    required this.inserted,
  });

  factory OrgRef.fromJson(Map<String, dynamic> json) => _$OrgRefFromJson(json);
}
