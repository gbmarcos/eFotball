import 'package:async_data_bloc/async_data_bloc.dart';
import 'package:fifa/r.dart';
import 'package:fifa/src/app/dependency_injection.dart';
import 'package:fifa/src/app/keys.dart';
import 'package:fifa/src/common/exceptions.dart';
import 'package:fifa/src/common/extensions.dart';
import 'package:fifa/src/common/widgets/app_image.dart';
import 'package:fifa/src/common/widgets/appendable_list.dart';
import 'package:fifa/src/common/widgets/custom_shimmer.dart';
import 'package:fifa/src/common/widgets/exception_widget.dart';
import 'package:fifa/src/common/widgets/stack_inkwell.dart';
import 'package:fifa/src/features/home/home_page.dart';
import 'package:fifa/src/features/news/model/news.dart';
import 'package:fifa/src/features/news/news_repository.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:fpdart/fpdart.dart' show Either;
import 'package:routemaster/routemaster.dart';

class AsyncNewsSection extends StatefulWidget {
  final AsyncCubit<List<News>> news;
  final ScrollController? scrollController;

  const AsyncNewsSection({Key? key, required this.news, this.scrollController}) : super(key: key);

  @override
  State<AsyncNewsSection> createState() => _AsyncNewsSectionState();
}

class _AsyncNewsSectionState extends State<AsyncNewsSection> with AutomaticKeepAliveClientMixin<AsyncNewsSection> {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return AsyncCubitBuilder<List<News>>(
        key: const ValueKey('AsyncNews'),
        bloc: widget.news,
        builder: (context, data) => Padding(
              padding: const EdgeInsets.symmetric(horizontal: 19),
              child: data.maybeMap(
                  data: (d) {
                    return NewsList(
                      news: d.value,
                      append: const SvenskaHomePartner(),
                      prepend: const SizedBox.square(dimension: 23),
                      scrollController: widget.scrollController,
                    );
                  },
                  error: (e) {
                    return const NetworkExceptionWidget();
                  },
                  orElse: NewsList.loading),
            ));
  }
}

class NewsSection extends StatefulWidget {
  const NewsSection({Key? key}) : super(key: key);

  @override
  _NewsSectionState createState() => _NewsSectionState();
}

class _NewsSectionState extends State<NewsSection> {
  late final NewsRepository repository = getIt();

  late final Future<Either<NetworkException, List<News>>> _news = repository.listNews(featured: true);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        key: Keys.newsHomeSection,
        future: _news,
        builder: (context, AsyncSnapshot<Either<NetworkException, List<News>>> snapshot) {
          if (snapshot.hasData && snapshot.data != null) {
            return snapshot.data!.fold((l) => const NetworkExceptionWidget(), (r) => NewsList(news: r));
          }
          return const Center(child: CircularProgressIndicator.adaptive());
        });
  }
}

class NewsList extends StatelessWidget {
  final List<News> news;
  final bool displayClubLogo;
  final bool displayCommentCount;
  final Axis axis;
  final Widget? prepend;
  final Widget? append;
  final bool shrinkWrap;
  final ScrollPhysics? physics;
  final ScrollController? scrollController;
  final EdgeInsetsGeometry? padding;

  const NewsList({
    Key? key,
    required this.news,
    this.displayClubLogo = true,
    this.axis = Axis.vertical,
    this.displayCommentCount = true,
    this.prepend,
    this.append,
    this.shrinkWrap = false,
    this.physics,
    this.scrollController,
    this.padding,
  }) : super(key: key);

  static Widget loading({Key? key, Axis axis = Axis.vertical}) => _LoadingNewsSection(axis: axis);

  @override
  Widget build(BuildContext context) {
    return AppendableList(
      key: Keys.newsList,
      append: append,
      shrinkWrap: shrinkWrap,
      physics: physics,
      scrollController: scrollController,
      prepend: Row(
        children: [if (prepend != null) prepend!, const SizedBox.square(dimension: 20)],
      ),
      itemCount: news.length,
      scrollDirection: axis,
      itemExtent: getItemSize(),
      itemBuilder: (context, index) {
        final newsCard = Padding(
          padding: getPadding(axis),
          child: NewsCard(
            onTap: () {
              Routemaster.of(context).pushWithScope(
                R.routeNames.newsDetailsWithId(news[index].id),
                value: news[index],
              );
            },
            news: news[index],
            displayClubLogo: displayClubLogo,
            displayCommentCount: displayCommentCount,
          ),
        );

        if (axis == Axis.horizontal) {
          return SizedBox(width: getItemSize(), child: newsCard);
        }
        return newsCard;
      },
    );
  }

  double getItemSize() {
    switch (axis) {
      case Axis.horizontal:
        return 230.0 + 17;
      case Axis.vertical:
        return 254 + 18;
    }
  }

  static EdgeInsetsDirectional getPadding(Axis axis) {
    switch (axis) {
      case Axis.horizontal:
        return const EdgeInsetsDirectional.only(end: 17);
      case Axis.vertical:
        return const EdgeInsetsDirectional.only(bottom: 18);
    }
  }
}

class _LoadingNewsSection extends StatelessWidget {
  final Axis axis;

  const _LoadingNewsSection({Key? key, required this.axis}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // return SizedBox.shrink();
    return ListView.separated(
      padding: EdgeInsetsDirectional.only(
        top: axis == Axis.vertical ? 20 : 0,
        start: axis == Axis.horizontal ? 20 : 0,
      ),
      shrinkWrap: true,
      itemCount: 10,
      itemBuilder: (_, i) => CustomShimmer(
        child: ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(4)),
          child: Container(
            color: Colors.black12.withOpacity(1),
            height: 249,
            width: axis == Axis.horizontal ? 230 : null,
          ),
        ),
      ),
      separatorBuilder: (BuildContext context, int index) => const SizedBox(height: 17),
    );
  }
}

class ShimmerAppImage extends StatelessWidget {
  final String? image;
  final BorderRadius borderRadius;
  final bool forceExplicitUrl;
  final Size? imageSize;

  const ShimmerAppImage({
    Key? key,
    this.image,
    this.borderRadius = const BorderRadius.all(Radius.circular(8)),
    this.forceExplicitUrl = false,
    this.imageSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return ClipRRect(
      borderRadius: borderRadius,
      child: AppImage(
        image: image,
        fit: BoxFit.cover,
        imageSize: imageSize,
        forceExplicitUrl: forceExplicitUrl,
        boxSize: Size(MediaQuery.of(context).size.width, 190),
        placeholder: (context) {
          return CustomShimmer(
            child: Container(color: colorScheme.surface),
          );
        },
        error: (_) {
          return SizedBox.expand(
            child: Container(
              color: R.colors.inputBoxTextInitiative,
              child: const Icon(
                Icons.help_center_outlined,
                color: Colors.grey,
                size: 32,
              ),
            ),
          );
        },
      ),
    );
  }
}

class NewsCard extends StatelessWidget {
  final News news;
  final VoidCallback? onTap;
  final bool displayClubLogo;
  final bool displayCommentCount;

  const NewsCard(
      {Key? key, required this.news, this.onTap, this.displayClubLogo = true, this.displayCommentCount = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTopPadding = displayClubLogo ? 20.0 : 18.0;

    return StackInkWell(onTap: onTap, borderRadius: const BorderRadius.all(Radius.circular(8)), children: [
      Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Flexible(
            child: ShimmerAppImage(
              image: news.thumbnail ?? news.image,
              //todo reduce image size while maintaining aspect ratio
            ),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              if (displayClubLogo)
                Padding(
                  padding: const EdgeInsets.only(top: 22, left: 6, right: 10),
                  child: SizedBox(
                    width: 40,
                    height: 40,
                    child: AppImage(image: news.org.logo ?? '', imageSize: const Size.square(40)),
                  ),
                ),
              Flexible(
                child: Padding(
                  padding: EdgeInsets.only(top: textTopPadding, bottom: 4),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      DefaultTextStyle.merge(
                        style: TextStyles.title,
                        child: Text(news.title, maxLines: 1),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8),
                        child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                          Text(
                            R.dateSpecifications.localizeMD(news.inserted, context),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyles.subTitle,
                          ),
                          if (displayCommentCount && news.commentCount != null)
                            _CommentCount(amount: news.commentCount!)
                        ]),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ],
      )
    ]);
  }
}

class _CommentCount extends StatefulWidget {
  final int amount;

  const _CommentCount({Key? key, required this.amount}) : super(key: key);

  @override
  State<_CommentCount> createState() => _CommentCountState();
}

class _CommentCountState extends State<_CommentCount> {
  late final ColorScheme colorScheme = Theme.of(context).colorScheme;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        FaIcon(FontAwesomeIcons.solidMessage, color: colorScheme.primary, size: 16),
        const SizedBox(width: 8),
        Text('${widget.amount}', style: const TextStyle(color: Colors.white)),
      ],
    );
  }
}
