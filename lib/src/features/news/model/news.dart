import 'package:fifa/src/common/data/converters.dart';
import 'package:fifa/src/common/domain/user/user.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'news.freezed.dart';
part 'news.g.dart';

List<News> newsFromJson(List<dynamic> str) =>
    List<News>.from(str.map<News>((dynamic x) => News.fromJson(x as Map<String, dynamic>)));

List<Comment> commentsFromJson(List<dynamic> str) =>
    List<Comment>.from(str.map<Comment>((dynamic x) => Comment.fromJson(x as Map<String, dynamic>)));

@freezed
class News with _$News {
  const factory News({
    required int id,
    required String title,
    NewsCategory? category,
    required String content,
    String? image,
    String? thumbnail,
    UserBasicInfo? author,
    @TimestampConverter() required DateTime inserted,
    String? preview,
    required Org org,
    Category? flags,
    int? commentCount,
  }) = _News;

  const News._();

  factory News.fromJson(Map<String, dynamic> json) => _$NewsFromJson(json);

  @Deprecated('User `inserted` instead')
  DateTime get insertedDate => inserted;
}

@freezed
class NewsCategory with _$NewsCategory {
  const factory NewsCategory({
    required int id,
    required String name,
  }) = _NewsCategory;

  factory NewsCategory.fromJson(Map<String, dynamic> json) => _$NewsCategoryFromJson(json);
}

@freezed
class Org with _$Org {
  const factory Org({
    required int id,
    String? name,
    String? logo,
    String? background,
    String? bannerUrl,
    String? slug,
    int? flags,
    int? inserted,
  }) = _Org;

  factory Org.fromJson(Map<String, dynamic> json) => _$OrgFromJson(json);
}

enum Category {
  @JsonValue(0)
  undefined,
  @JsonValue(1)
  main,
  @JsonValue(2)
  featured,
}

@freezed
class Comment with _$Comment {
  const factory Comment({
    required int id,
    required UserBasicInfo author,
    required String message,
    @TimestampConverter() required DateTime inserted,

    ///If not null, then the comment has been deleted.
    int? deleted,
  }) = _Comment;

  factory Comment.fromJson(Map<String, dynamic> json) => _$CommentFromJson(json);
}
