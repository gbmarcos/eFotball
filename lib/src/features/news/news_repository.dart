import 'package:fifa/src/common/exceptions.dart';
import 'package:fifa/src/common/data/network_service.dart';
import 'package:fifa/src/features/news/model/news.dart';
import 'package:fpdart/fpdart.dart';

typedef JSON = Map<String, dynamic>;

class NewsRepository {
  final NetworkService _client;

  NewsRepository({required NetworkService client}) : _client = client;

  /// An array of news articles ordered by newest to oldest.
  /// 	- [orgId] (optional u32)
  /// 		- A filter for the articles' club.
  /// 	- [categoryId] (optional u32)
  /// 		- A filter for the article's category.
  /// 	- [excludeId] (optional u32)
  /// 		- The news article ID to exclude from the results.
  ///
  Future<Either<NetworkException, List<News>>> listNews({
    int? orgId,
    int? categoryId,
    int? excludeId,
    bool featured = false,
  }) async {
    final data = {
      if (orgId != null) 'org_id': orgId,
      if (categoryId != null) 'category_id': categoryId,
      if (excludeId != null) 'exclude_id': excludeId,
      'featured': featured ? 1 : 0
    };

    final response = await _client.get('/news/latest', query: data);

    return response.map<List<News>>((dynamic a) => newsFromJson(a as List<dynamic>));
  }

  Future<Either<NetworkException, News>> readNew({required int id}) async {
    final data = {'id': id};

    final response = await _client.get('/news/get', query: data);

    return response.map<News>((dynamic a) => News.fromJson(a as JSON));
  }

  Future<Either<NetworkException, List<Comment>>> listComments({required int newsId}) async {
    final data = {'id': newsId};

    final response = await _client.get('/news/get_comments', query: data);
    return response.map<List<Comment>>((dynamic a) => commentsFromJson(a as List<dynamic>));
  }

  ///Posts a [comment] to a specific news by specifying its [newsId].
  ///It's mandatory to pass the `User` id and auth token.
  Future<Either<NetworkException, Comment>> postComment(
      {required int newsId, required String comment, required int userId, required String token}) async {
    final data = {
      'news_id': newsId,
      'message': comment,
      '_u': userId,
      '_t': token,
    };

    final response = await _client.postForm('/news/post_comment', body: data);
    return response.map<Comment>((dynamic a) => Comment.fromJson(a as JSON));
  }
}
