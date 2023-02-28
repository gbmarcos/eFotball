import 'dart:developer';

import 'package:async_data_bloc/async_data_bloc.dart';
import 'package:fifa/r.dart';
import 'package:fifa/src/app/dependency_injection.dart';
import 'package:fifa/src/app/keys.dart';
import 'package:fifa/src/common/dialogs.dart' as snack_bars;
import 'package:fifa/src/common/exceptions.dart';
import 'package:fifa/src/common/extensions.dart';
import 'package:fifa/src/common/widgets/app_image.dart';
import 'package:fifa/src/common/widgets/components/custom_tab_bar.dart';
import 'package:fifa/src/common/widgets/custom_shimmer.dart';
import 'package:fifa/src/common/widgets/exception_widget.dart';
import 'package:fifa/src/features/news/news_list.dart';
import 'package:fifa/src/features/streams/model/stream.dart';
import 'package:fifa/src/features/streams/stream_page_cubit.dart';
import 'package:fifa/src/notifications/notification_app_bar.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:provider/provider.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:youtube_metadata/youtube.dart';

class StreamListPage extends StatelessWidget {
  const StreamListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(create: (context) => StreamPageCubit(streamRepository: getIt())),
      ],
      child: const DefaultTabController(length: 2, child: StreamListView()),
    );
  }
}

class StreamListView extends StatefulWidget {
  const StreamListView({Key? key}) : super(key: key);

  @override
  State<StreamListView> createState() => _StreamListViewState();
}

class _StreamListViewState extends State<StreamListView> {
  late ValueNotifier<bool> isFetchingMore = ValueNotifier(false);

  @override
  void dispose() {
    isFetchingMore.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final pageState = context.read<StreamPageCubit>();
    return Scaffold(
      key: Keys.streamPage,
      appBar: NotificationAppBar(title: Text(context.l10n.streamsLabel)),
      body: NotificationListener<ScrollUpdateNotification>(
        onNotification: (notification) {
          final selectedPage = DefaultTabController.of(context)!.index;

          // loadMoreStreams(notification, selectedPage, pageState);

          return false;
        },
        child: RefreshIndicator(
          onRefresh: () async {
            if (DefaultTabController.of(context)!.index == 0) {
              pageState.liveStreamList.refresh();
            } else {
              pageState.archivedStreamList.refresh();
            }
          },
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 17, right: 17, top: 8),
                child: CustomTabBar(
                  tabs: [
                    Tab(key: Keys.streamPageLiveTab, child: Text(context.l10n.live, style: TextStyles.tab)),
                    Tab(key: Keys.streamPageArchiveTab, child: Text(context.l10n.archive, style: TextStyles.tab)),
                  ],
                ),
              ),
              Expanded(
                child: TabBarView(children: [
                  LiveStreamView(isFetchingMore: isFetchingMore),
                  ArchivedStreamView(isFetchingMore: isFetchingMore),
                ]),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void loadMoreStreams(ScrollUpdateNotification notification, int selectedPage, StreamPageCubit pageState) {
    if (notification.shouldLoadMoreFlag && !isFetchingMore.value) {
      if (selectedPage == 0) {
        pageState.liveStreamList.state.maybeMap(
          orElse: () {},
          data: (data) {
            isFetchingMore.value = true;
            pageState.loadMoreLiveStreams().then((_) => isFetchingMore.value = false);
          },
        );
      } else {
        pageState.archivedStreamList.state.maybeMap(
          orElse: () {},
          data: (data) {
            isFetchingMore.value = true;
            pageState.loadMoreArchivedStreams().then((_) => isFetchingMore.value = false);
          },
        );
      }
    }
  }
}

class LiveStreamView extends StatelessWidget {
  final ValueNotifier<bool> isFetchingMore;

  const LiveStreamView({Key? key, required this.isFetchingMore}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final pageState = context.read<StreamPageCubit>();

    return AsyncCubitBuilder<List<Stream>>(
      bloc: pageState.liveStreamList,
      builder: (_, state) {
        return state.maybeMap(
          data: (streamList) {
            final validStreams = <Stream>[];

            filterStreams(
              validStreams: validStreams,
              originalStreamList: streamList.value,
            );

            return validStreams.isNotEmpty
                ? StreamList(
                    streamList: validStreams,
                    isFetchingMore: isFetchingMore,
                  )
                : Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 19, vertical: 23),
                    child: NoElementsExceptionWidget(
                      text: context.l10n.noLiveStreams,
                      refresh: pageState.liveStreamList.refresh,
                    ),
                  );
          },
          error: (e) {
            final error = e.error;
            if (error is NetworkException) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 19, vertical: 23),
                child: error.map(
                  (value) => NetworkExceptionWidget(
                    refresh: pageState.liveStreamList.refresh,
                  ),
                  noDataException: (value) => NoElementsExceptionWidget(
                    text: context.l10n.noLiveStreams,
                    refresh: pageState.liveStreamList.refresh,
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
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 19, vertical: 23),
                child: UnexpectedExceptionWidget(
                  refresh: pageState.liveStreamList.refresh,
                ),
              );
            }
          },
          orElse: StreamList.loading,
        );
      },
    );
  }
}

class ArchivedStreamView extends StatelessWidget {
  final ValueNotifier<bool> isFetchingMore;

  const ArchivedStreamView({Key? key, required this.isFetchingMore}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final pageState = context.read<StreamPageCubit>();

    return AsyncCubitBuilder<List<Stream>>(
      bloc: pageState.archivedStreamList,
      builder: (_, state) {
        return state.maybeMap(
          data: (streamList) {
            final validStreams = <Stream>[];

            filterStreams(
              validStreams: validStreams,
              originalStreamList: streamList.value,
            );

            return validStreams.isNotEmpty
                ? StreamList(streamList: validStreams, isFetchingMore: isFetchingMore)
                : NoElementsExceptionWidget(
                    text: context.l10n.noLiveStreams,
                    refresh: pageState.archivedStreamList.refresh,
                  );
          },
          error: (e) {
            final error = e.error;
            if (error is NetworkException) {
              return error.map(
                (value) => NetworkExceptionWidget(
                  refresh: pageState.archivedStreamList.refresh,
                ),
                noDataException: (value) => NoElementsExceptionWidget(
                  text: context.l10n.noStreams,
                  refresh: pageState.archivedStreamList.refresh,
                ),
              );
            } else {
              if (kReleaseMode) {
                Sentry.captureException(error, stackTrace: e.stackTrace);
              } else {
                log('${e.stackTrace}');
                log('${e.error}');
              }
              return UnexpectedExceptionWidget(
                refresh: pageState.archivedStreamList.refresh,
              );
            }
          },
          orElse: StreamList.loading,
        );
      },
    );
  }
}

void filterStreams({
  required List<Stream> validStreams,
  required List<Stream> originalStreamList,
}) {
  validStreams
      .addAll(originalStreamList.where((stream) => stream.url != null || stream.twitchUsername != null).toList());

  final nonValidStreams =
      originalStreamList.where((stream) => stream.url == null && stream.twitchUserId == null).toList();

  if (nonValidStreams.isNotEmpty) {
    //todo: to list stream ids.
    final exception = StreamsHavingNullUrlException(
      streamIds: nonValidStreams.map((stream) => 0).toList(),
    );

    log(nonValidStreams.toString());

    if (kReleaseMode) {
      Sentry.captureException(exception);
    } else {
      log('$exception');
    }
  }
}

class StreamList extends StatelessWidget {
  final List<Stream> streamList;
  final bool live;
  final ValueNotifier<bool>? isFetchingMore;

  const StreamList({
    Key? key,
    required this.streamList,
    this.live = false,
    this.isFetchingMore,
  }) : super(key: key);

  static Widget loading({Key? key, Axis axis = Axis.vertical, int length = 10}) => _LoadingStreamList(
        axis: axis,
        length: length,
      );

  @override
  Widget build(BuildContext context) {
    print('isFetchingMore: ${isFetchingMore?.value}');
    return Column(
      children: [
        Expanded(
          child: AnimationLimiter(
            child: ListView.separated(
              padding: const EdgeInsets.symmetric(horizontal: 19, vertical: 23),
              physics: const ClampingScrollPhysics(),
              shrinkWrap: true,
              itemCount: streamList.length,
              separatorBuilder: (context, index) => const SizedBox(
                height: 15,
              ),
              itemBuilder: (ctx, i) {
                return AnimationConfiguration.staggeredList(
                  position: i,
                  duration: const Duration(milliseconds: 325),
                  delay: const Duration(milliseconds: 25),
                  child: FadeInAnimation(
                    child: _StreamCard(
                      streamPlatform:
                          streamList[i].twitchUserId != null ? StreamPlatform.twitch : StreamPlatform.youtube,
                      stream: streamList[i],
                      live: live,
                    ),
                  ),
                );
              },
            ),
          ),
        ),
        if (isFetchingMore != null && isFetchingMore!.value)
          Flexible(
            child: ValueListenableBuilder<bool>(
              valueListenable: isFetchingMore!,
              builder: (context, isFetching, _) {
                return AnimatedSwitcher(
                  duration: const Duration(milliseconds: 200),
                  child: isFetching
                      ? Column(
                          children: [
                            const SizedBox(height: 17),
                            StreamList.loading(length: 1),
                          ],
                        )
                      : const SizedBox.shrink(),
                );
              },
            ),
          ),
      ],
    );
  }
}

class _LoadingStreamList extends StatelessWidget {
  final Axis axis;
  final int length;

  const _LoadingStreamList({Key? key, required this.axis, this.length = 10}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // return SizedBox.shrink();
    return ListView.separated(
      shrinkWrap: true,
      physics: const ClampingScrollPhysics(),
      itemCount: length,
      itemBuilder: (_, i) => CustomShimmer(
        child: ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(4)),
          child: Container(
            color: CardTheme.of(context).color ?? Theme.of(context).cardColor,
            height: 220,
            width: axis == Axis.horizontal ? 215 : null,
          ),
        ),
      ),
      separatorBuilder: (BuildContext context, int index) => const SizedBox(height: 17),
    );
  }
}

class _StreamCard extends StatelessWidget {
  final Stream stream;
  final bool live;
  final StreamPlatform streamPlatform;

  const _StreamCard({
    Key? key,
    required this.stream,
    this.live = false,
    required this.streamPlatform,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: R.shapes.radius_4,
      child: InkWell(
        onTap: () {
          if (stream.urlOfRedirection != null) {
            launch(stream.urlOfRedirection!);
          } else {
            snack_bars.showCustomMessage(
              context: context,
              message: context.l10n.couldNotFindAUrlToRedirect,
            );
          }
        },
        child: Stack(
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Flexible(
                  child: ShimmerAppImage(
                    image: getThumbnail(stream),
                    borderRadius: BorderRadius.zero,
                    forceExplicitUrl: true,
                  ),
                ),
                if (stream.org != null)
                  ColoredBox(
                    color: R.colors.menuBarBackground,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 10),
                          child: SizedBox(
                            width: 40,
                            height: 40,
                            child: AppImage(
                              image: stream.org!.logo,
                            ),
                          ),
                        ),
                        Expanded(
                            child: Padding(
                          padding: const EdgeInsets.only(right: 6, top: 10, bottom: 10),
                          child: streamPlatform == StreamPlatform.twitch
                              ? _StreamCardListTile(
                                  title: stream.status,
                                  subtitle: stream.twitchUsername,
                                )
                              : FutureBuilder(
                                  future: YoutubeMetaData.getData(stream.url!),
                                  builder: (context, AsyncSnapshot<MetaDataModel> snapshot) {
                                    if (!snapshot.hasData) {
                                      return _StreamCardListTile.loading();
                                    }

                                    return _StreamCardListTile(
                                      title: snapshot.data?.authorName,
                                      subtitle: snapshot.data?.title,
                                    );
                                  },
                                ),
                        )),
                      ],
                    ),
                  ),
              ],
            ),
            if (live)
              const Positioned(
                top: 15,
                left: 15,
                child: LiveIndicator(),
              ),
          ],
        ),
      ),
    );
  }

  static const twitchThumbnailResolution = '256x144';
  static const resolutionTemplate = '{width}x{height}';

  String? getThumbnail(Stream stream) {
    if (stream.thumbnailUrl == null) {
      return '${stream.url?.replaceAll('www', 'img').replaceAll('watch?v=', 'vi/')}/mqdefault.jpg';
    }
    return stream.thumbnailUrl!.replaceAll(resolutionTemplate, twitchThumbnailResolution);
  }
}

class _StreamCardListTile extends StatelessWidget {
  const _StreamCardListTile({
    Key? key,
    this.title,
    this.subtitle,
  }) : super(key: key);

  final String? title;
  final String? subtitle;

  static Widget loading() => const _LoadingYoutubeData();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          title ?? '...',
          style: const TextStyle(
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(
          height: 2,
        ),
        Text(
          subtitle ?? '...',
          style: TextStyle(
            color: context.theme.colorScheme.secondary,
          ),
        ),
      ],
    );
  }
}

class _LoadingYoutubeData extends StatelessWidget {
  const _LoadingYoutubeData({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final color = R.colors.tabBarUnselected;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        CustomShimmer(
          color: color,
          child: FractionallySizedBox(
            widthFactor: 0.7,
            child: Container(
              height: 16,
              decoration: BoxDecoration(color: color, borderRadius: R.shapes.radius_4),
            ),
          ),
        ),
        const SizedBox(
          height: 3,
        ),
        CustomShimmer(
          color: color,
          child: Container(
            height: 16,
            decoration: BoxDecoration(color: color, borderRadius: R.shapes.radius_4),
          ),
        ),
      ],
    );
  }
}

class LiveIndicator extends StatelessWidget {
  const LiveIndicator({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      decoration: BoxDecoration(
        borderRadius: R.shapes.radius_4,
        color: R.colors.liveIndicator,
      ),
      child: Text(
        context.l10n.live.toUpperCase(),
        style: const TextStyle(
          color: Colors.white,
          fontSize: 14,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
