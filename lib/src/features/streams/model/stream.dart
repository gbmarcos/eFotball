import 'package:fifa/src/common/domain/org/org.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'stream.freezed.dart';

part 'stream.g.dart';

List<Stream> streamsFromJson(List<dynamic> str) =>
    List<Stream>.from(str.map<Stream>((dynamic x) => Stream.fromJson(x as Map<String, dynamic>)));

@freezed
class Stream with _$Stream {
  const factory Stream({
    String? url,
    int? tournamentId,
    String? twitchUserId,
    String? twitchUsername,
    int? userId,
    String? username,
    String? status,
    String? thumbnailUrl,
    int? viewers,
    OrgRef? org,
  }) = _Stream;

  const Stream._();

  String? get urlOfRedirection {
    if (url != null || twitchUsername != null) {
      return url ?? 'https://www.twitch.tv/$twitchUsername';
    }
  }

  factory Stream.fromJson(Map<String, dynamic> json) => _$StreamFromJson(json);
}

enum StreamPlatform {
  youtube,
  twitch,
}
