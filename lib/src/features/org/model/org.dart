
import 'package:fifa/src/common/data/converters.dart';
import 'package:fifa/src/common/domain/org/org.dart';
import 'package:fifa/src/features/club/model/club.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'org.freezed.dart';
part 'org.g.dart';

List<Org> orgsFromJson(List<dynamic> str) =>
    List<Org>.from(str.map<Org>((dynamic x) => Org.fromJson(x as Map<String, dynamic>)));

@freezed
class Org with _$Org {
  @Implements<OrgRef>()
  const factory Org({
    required int id,
    required String name,
    required String logo,
    String? background,
    String? bannerUrl,
    required String slug,
    required int flags,
    @TimestampConverter() required DateTime inserted,
    int? memberCount,
    List<Club>? parents,
    List<Club>? children,
    List<Club>? siblings,
  }) = _Org;

  factory Org.fromJson(Map<String, dynamic> json) => _$OrgFromJson(json);
}
