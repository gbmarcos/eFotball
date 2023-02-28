import 'dart:developer';

import 'package:async_data_bloc/async_data_bloc.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:fifa/r.dart';
import 'package:fifa/src/app/dependency_injection.dart';
import 'package:fifa/src/app/keys.dart';
import 'package:fifa/src/authentication/authentication.dart';
import 'package:fifa/src/common/dialogs.dart';
import 'package:fifa/src/common/domain/user/user.dart';
import 'package:fifa/src/common/exceptions.dart';
import 'package:fifa/src/common/extensions.dart';
import 'package:fifa/src/common/utils.dart';
import 'package:fifa/src/common/widgets/app_html.dart';
import 'package:fifa/src/common/widgets/app_image.dart';
import 'package:fifa/src/common/widgets/components/custom_circle_avatar.dart';
import 'package:fifa/src/common/widgets/components/custom_tab_bar.dart';
import 'package:fifa/src/common/widgets/components/section_header.dart';
import 'package:fifa/src/common/widgets/counter_badge.dart';
import 'package:fifa/src/common/widgets/custom_form_button.dart';
import 'package:fifa/src/common/widgets/custom_form_field.dart';
import 'package:fifa/src/common/widgets/exception_widget.dart';
import 'package:fifa/src/features/club/model/club.dart';
import 'package:fifa/src/features/home/home_page_cubit.dart';
import 'package:fifa/src/features/news/model/news.dart';
import 'package:fifa/src/features/news/news_detail/news_detail_cubit.dart';
import 'package:fifa/src/features/news/news_list.dart';
import 'package:fifa/src/features/news/news_repository.dart';
import 'package:fifa/src/notifications/notification_app_bar.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:fpdart/fpdart.dart' show Either;
import 'package:routemaster/routemaster.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

class NewsDetailPage extends StatefulWidget {
  final int id;
  final News? news;

  const NewsDetailPage({
    Key? key,
    required this.id,
    this.news,
  }) : super(key: key);

  @override
  State<NewsDetailPage> createState() => _NewsDetailPageState();
}

class _NewsDetailPageState extends State<NewsDetailPage> {
  late final News? initialNew = widget.news ?? context.fromSacco<News>();

  late final AsyncCubit<News> _new = initialNew == null
      ? AsyncCubit(() => getIt<NewsRepository>().readNew(id: widget.id).then(getOrThrow))
      : AsyncCubit.stub(initialValue: AsyncData(initialNew!));

  @override
  Widget build(BuildContext context) {
    return _new.state.maybeMap(
      orElse: () => const CircularProgressIndicator(),
      data: (d) => RepositoryProvider(
        create: (_) => NewsDetailCubit(newsRepository: getIt(), initialNew: d.value),
        child: const DefaultTabController(length: 2, child: NewsDetailView()),
      ),
    );
  }
}

class NewsDetailView extends StatelessWidget {
  const NewsDetailView({Key? key}) : super(key: key);
  static const EdgeInsets defaultPadding = EdgeInsets.only(left: 18, right: 18);

  @override
  Widget build(BuildContext context) {
    final newsBloc = context.read<NewsDetailCubit>();
    return Scaffold(
      key: Keys.newsPage,
      appBar: NotificationAppBar(title: Text(context.l10n.news)),
      body: Padding(
        padding: const EdgeInsets.only(top: 20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: defaultPadding,
              child: CustomTabBar(
                tabs: [
                  Tab(
                    key: Keys.newsPageArticleTab,
                    child: Text(context.l10n.article),
                  ),
                  Tab(
                    key: Keys.newsPageCommentsTab,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(flex: 3, child: Text(context.l10n.comments)),
                        AsyncCubitBuilder<List<Comment>>(
                          bloc: newsBloc.comments,
                          builder: (_, state) {
                            return Flexible(
                              child: Padding(
                                padding: const EdgeInsets.only(left: 7),
                                child: state.maybeMap(
                                  orElse: () => const CounterBadge(),
                                  data: (data) => CounterBadge(count: data.value.length),
                                ),
                              ),
                            );
                          },
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: TabBarView(
                children: [
                  AsyncCubitBuilder<News>(
                    bloc: newsBloc.news,
                    builder: (_, state) {
                      return state.maybeMap(
                        orElse: () => const SizedBox.shrink(),
                        loading: (_) => const CircularProgressIndicator.adaptive(),
                        data: (data) => NewsContentSection(news: data.value, padding: const EdgeInsets.only(top: 32)),
                      );
                    },
                  ),
                  AsyncCubitBuilder<List<Comment>>(
                    bloc: newsBloc.comments,
                    builder: (_, state) {
                      return state.maybeMap(
                        orElse: () => const SizedBox.shrink(),
                        error: (e) {
                          final error = e.error;
                          if (error is NetworkException) {
                            return error.map(
                              (value) => const NetworkExceptionWidget(),
                              noDataException: (value) => Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 20),
                                child: Column(
                                  children: [
                                    const AddComment(),
                                    NoElementsExceptionWidget(
                                      text: context.l10n.noComments,
                                    ),
                                  ],
                                ),
                              ),
                            );
                          } else {
                            if (kReleaseMode) {
                              Sentry.captureException(error, stackTrace: e.stackTrace);
                            } else {
                              log('${e.stackTrace}');
                              log('${e.error}');
                            }
                            return const UnexpectedExceptionWidget();
                          }
                        },
                        loading: (_) => const Center(child: CircularProgressIndicator.adaptive()),
                        data: (data) => CommentsSection(comments: data.value, padding: const EdgeInsets.only(top: 32)),
                      );
                    },
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class NewsContentSection extends StatefulWidget {
  final News news;
  final EdgeInsetsGeometry? padding;

  const NewsContentSection({Key? key, required this.news, this.padding}) : super(key: key);

  @override
  State<NewsContentSection> createState() => _NewsContentSectionState();
}

class _NewsContentSectionState extends State<NewsContentSection> with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    final newsBloc = context.read<NewsDetailCubit>();

    return ListView(
      shrinkWrap: true,
      padding: widget.padding,
      children: [
        Padding(
          padding: NewsDetailView.defaultPadding,
          child: Text(
            widget.news.title,
            style: TextStyles.h1,
          ),
        ),
        const SizedBox(height: 16),
        Padding(
          padding: NewsDetailView.defaultPadding,
          child: Text(R.dateSpecifications.formatDMY(widget.news.inserted)),
        ),
        Padding(
          padding: NewsDetailView.defaultPadding + const EdgeInsets.symmetric(horizontal: 2, vertical: 10),
          child: ShimmerAppImage(
            image: widget.news.thumbnail ?? widget.news.image,
          ),
        ),
        Padding(
          padding: NewsDetailView.defaultPadding,
          child: AppHtml(widget.news.preview!),
        ),
        const SizedBox(height: 16),
        SizedBox(
          height: 232,
          child: AsyncCubitBuilder<List<News>>(
            bloc: newsBloc.latestNews,
            builder: (_, state) {
              return state.maybeMap(
                orElse: () => const SizedBox.shrink(),
                loading: (_) => const Center(child: CircularProgressIndicator.adaptive()),
                data: (data) => Column(
                  children: [
                    Padding(
                      padding: NewsDetailView.defaultPadding,
                      child: SectionHeader(
                        title: context.l10n.latestNews,
                        subtitle: context.l10n.allNews,
                        subtitleKey: Keys.newsHeaderAllNews,
                        onSubtitleTap: () {
                          Routemaster.of(context).pushWithScope(
                            R.routeNames.newsArchive,
                            value: Either<Club, List<Club>>.right(
                              context.read<HomePageCubit>().featuredClubs.state.valueOrNull!,
                            ),
                          );
                        },
                      ),
                    ),
                    Flexible(
                      child: NewsList(
                        news: data.value,
                        displayCommentCount: false,
                        displayClubLogo: false,
                        axis: Axis.horizontal,
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        )
      ],
    );
  }

  @override
  bool get wantKeepAlive => true;
}

// Comment Tab content
class CommentsSection extends StatefulWidget {
  final List<Comment> comments;
  final EdgeInsets padding;

  const CommentsSection({Key? key, required this.comments, required this.padding}) : super(key: key);

  @override
  State<CommentsSection> createState() => _CommentsSectionState();
}

class _CommentsSectionState extends State<CommentsSection> with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: AnimationLimiter(
        child: ListView.builder(
          padding: widget.padding,
          itemBuilder: (BuildContext context, int index) {
            if (index == 0) {
              return const AddComment();
            } else {
              final currentComment = widget.comments[index - 1];
              return AnimationConfiguration.staggeredList(
                position: index,
                duration: const Duration(milliseconds: 375),
                child: SlideAnimation(
                  verticalOffset: 50,
                  child: FadeInAnimation(
                    child: Column(
                      children: [
                        CommentTile(comment: currentComment),
                        const Divider(height: 16),
                      ],
                    ),
                  ),
                ),
              );
            }
          },
          itemCount: widget.comments.length + 1,
        ),
      ),
    );
  }
}

class CommentTile extends StatefulWidget {
  final Comment comment;

  const CommentTile({Key? key, required this.comment}) : super(key: key);

  @override
  State<CommentTile> createState() => _CommentTileState();
}

class _CommentTileState extends State<CommentTile> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      isThreeLine: true,
      key: ValueKey(widget.comment.id),
      leading: CustomCircleAvatar(
        backgroundImage:
            widget.comment.author.avatar != null ? AppImage.provider(url: widget.comment.author.avatar!) : null,
        radius: 19,
      ),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            child: InkWell(
              onTap: () {
                final userId = widget.comment.author.id;
                if (userId == context.currentUser.id) {
                  Routemaster.of(context).push(R.routeNames.profileSection);
                } else if (userId != null) {
                  Routemaster.of(context).pushWithScope(
                    R.routeNames.profileDetailsWithId(userId),
                    value: widget.comment.author,
                  );
                }
              },
              child: AutoSizeText(
                widget.comment.author.username,
                style: TextStyles.listTileTitle.copyWith(color: Theme.of(context).colorScheme.primary),
              ),
            ),
          ),
          Flexible(
            flex: 2,
            child: AutoSizeText(
              R.dateSpecifications.formatTimeago(widget.comment.inserted, Localizations.localeOf(context)),
              style: TextStyles.listTileTrailing,
              minFontSize: 9,
              maxFontSize: 12,
              maxLines: 1,
            ),
          ),
        ],
      ),
      subtitle: Padding(
        padding: const EdgeInsets.only(top: 7),
        child: AppHtml(widget.comment.message),
      ),
    );
  }
}

class AddComment extends StatefulWidget {
  const AddComment({Key? key}) : super(key: key);

  @override
  State<AddComment> createState() => _AddCommentState();
}

class _AddCommentState extends State<AddComment> {
  late final commentController = TextEditingController();
  late final User? user = context.read<AuthenticationBloc>().state.user;
  late final String? avatarImage = user?.avatar;
  late ValueNotifier<bool> hasNonEmptyText = ValueNotifier(commentController.value.text.isNotNullOrEmpty);

  @override
  void dispose() {
    super.dispose();
    commentController
      ..removeListener(updateCommentIsNotEmpty)
      ..dispose();
    hasNonEmptyText.dispose();
  }

  @override
  void initState() {
    super.initState();
    commentController.addListener(updateCommentIsNotEmpty);
  }

  void updateCommentIsNotEmpty() {
    hasNonEmptyText.value = commentController.value.text.isNotNullOrEmpty;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 16, left: 16),
              child: CustomCircleAvatar(
                radius: 19,
                backgroundImage: avatarImage != null ? AppImage.provider(url: avatarImage!) : null,
              ),
            ),
            Expanded(
              child: CommentFormField(
                key: Keys.newsPageAddCommentForm,
                controller: commentController,
                hintText: context.l10n.addAComment,
              ),
            ),
          ],
        ),
        if (user != null)
          ValueListenableBuilder<bool>(
            valueListenable: hasNonEmptyText,
            builder: (context, hasNonEmptyText, child) {
              return Padding(
                padding: const EdgeInsets.only(top: 4, bottom: 2),
                child: Align(
                  alignment: AlignmentDirectional.centerEnd,
                  child: AnimatedContainer(
                    height: hasNonEmptyText ? 36 : 0,
                    width: hasNonEmptyText ? 69 : 0,
                    duration: const Duration(milliseconds: 200),
                    child: CustomFormButton.loading(
                      onTap: () async {
                        final commentText = commentController.value.text;

                        final postComment = await context.read<NewsDetailCubit>().postComment(commentText, user!);
                        postComment.fold((l) {
                          showCustomMessage(
                            context: context,
                            message: l.responseMessage ?? context.l10n.networkError,
                          );
                        }, (r) {
                          showCustomMessage(
                            context: context,
                            message: context.l10n.commentPostedSuccessfully,
                          );
                          commentController.clear();
                        });
                      },
                      buttonText: context.l10n.post,
                    ),
                  ),
                ),
              );
            },
          )
      ],
    );
  }
}
