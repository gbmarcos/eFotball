import 'package:async_data_bloc/async_data_bloc.dart';
import 'package:collection/src/iterable_extensions.dart';
import 'package:fifa/src/common/exceptions.dart';
import 'package:fifa/src/common/utils.dart';
import 'package:fifa/src/features/news/model/news.dart';
import 'package:fifa/src/features/news/news_repository.dart';
import 'package:fifa/src/common/domain/user/user.dart';
import 'package:fpdart/fpdart.dart' show Either;

class NewsDetailCubit {
  final NewsRepository _newsRepository;

  final News _initialNew;
  late final AsyncCubit<News> news;
  late final AsyncCubit<List<Comment>> comments;
  late final AsyncCubit<List<News>> latestNews;

  NewsDetailCubit({required NewsRepository newsRepository, required News initialNew})
      : _newsRepository = newsRepository,
        _initialNew = initialNew {
    news = AsyncCubit(() => _newsRepository.readNew(id: initialNew.id).then(getOrThrow),
        initialValue: AsyncData(initialNew));

    comments = AsyncCubit(
      () => _newsRepository
          .listComments(newsId: initialNew.id)
          //Sort by most recent
          .then((value) => value.map<List<Comment>>((a) => a.sortedBy((e) => e.inserted).reversed.toList()))
          .then(getOrThrow),
      // do not display loading indicator when refreshing data
      refreshPolicy: RefreshPolicy.noLoading,
    );

    latestNews = AsyncCubit(
      () => _newsRepository.listNews(featured: true, orgId: _initialNew.org.id).then(getOrThrow),
    );
  }

  Future<Either<NetworkException, Comment>> postComment(String comment, User user) async {
    final commentPostResponse =
        await _newsRepository.postComment(newsId: _initialNew.id, comment: comment, userId: user.id, token: user.token);

    if (commentPostResponse.isRight()) {
      comments.refresh();
    }

    return commentPostResponse;
  }
}
