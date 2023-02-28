import 'dart:developer';
import 'dart:math' as math;

import 'package:async_data_bloc/async_data_bloc.dart';
import 'package:extended_nested_scroll_view/extended_nested_scroll_view.dart';
import 'package:fifa/r.dart';
import 'package:fifa/src/app/dependency_injection.dart';
import 'package:fifa/src/app/keys.dart';

import 'package:fifa/src/common/domain/match/match.dart';
import 'package:fifa/src/common/domain/tournament/tournament.dart';
import 'package:fifa/src/common/exceptions.dart';
import 'package:fifa/src/common/extensions.dart';
import 'package:fifa/src/common/get_it_scoped_widget.dart';
import 'package:fifa/src/common/widgets/components/custom_tab_bar.dart';
import 'package:fifa/src/common/widgets/components/section_header.dart';
import 'package:fifa/src/common/widgets/exception_widget.dart';
import 'package:fifa/src/features/club/club_page_cubit.dart';
import 'package:fifa/src/features/club/model/club.dart';
import 'package:fifa/src/features/club/model/org_featured_player.dart';
import 'package:fifa/src/features/club/model/ranking.dart';
import 'package:fifa/src/features/club/model/social_media.dart';
import 'package:fifa/src/features/club/widgets/club_card.dart';
import 'package:fifa/src/features/club/widgets/featured_players.dart';
import 'package:fifa/src/features/club/widgets/partner_card.dart';
import 'package:fifa/src/features/club/widgets/ranking_table.dart';
import 'package:fifa/src/features/club/widgets/social_media_card.dart';
import 'package:fifa/src/features/match/matches_list.dart';
import 'package:fifa/src/features/match/model/match.dart';
import 'package:fifa/src/features/news/model/news.dart';
import 'package:fifa/src/features/news/news_list.dart';
import 'package:fifa/src/features/tournaments/model/tournament.dart';
import 'package:fifa/src/features/tournaments/tournament_section.dart';
import 'package:fifa/src/notifications/notification_app_bar.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:fpdart/fpdart.dart' show Either;
import 'package:provider/provider.dart';
import 'package:routemaster/routemaster.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

class ClubPage extends StatelessWidget {
  final int id;

  const ClubPage({
    Key? key,
    required this.id,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final club = getIt<Sacco>().isRegistered<Club>(Routemaster.of(context).currentRoute.fullPath)
        ? context.fromSacco<Club>()
        : null;

    return Provider(
      create: (context) => ClubPageCubit(
        clubId: id,
        clubRepository: getIt(),
        tournamentRepository: getIt(),
        tournamentCollectionRepository: getIt(),
        newsRepository: getIt(),
        matchRepository: getIt(),
        club: club,
      ),
      child: const DefaultTabController(length: 3, child: ClubView()),
    );
  }
}

class ClubView extends StatelessWidget {
  const ClubView({Key? key}) : super(key: key);
  static const pagePadding = EdgeInsets.only(left: 15, right: 13);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: Keys.clubPage,
      appBar: NotificationAppBar(
        title: AsyncCubitBuilder<Club>(
          bloc: context.read<ClubPageCubit>().selectedClub,
          builder: (context, data) =>
              data.maybeMap(data: (d) => Text(d.value.name), orElse: () => const SizedBox.shrink()),
        ),
      ),
      body: ExtendedNestedScrollView(
        //1.[pinned sliver header issue](https://github.com/flutter/flutter/issues/22393)
        pinnedHeaderSliverHeightBuilder: () {
          return CustomTabBar.height;
        },
        //2.[inner scrollables in tabview sync issue](https://github.com/flutter/flutter/issues/21868)
        onlyOneScrollInBody: true,
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverToBoxAdapter(
              child: Column(
                children: [
                  const SizedBox(height: 21),
                  Padding(
                    padding: pagePadding,
                    child: AsyncCubitBuilder<Club>(
                      bloc: context.read<ClubPageCubit>().selectedClub,
                      builder: (context, data) => data.maybeMap(
                        data: (d) => ClubListTile(club: d.value),
                        loading: (d) => ClubListTile.loading(),
                        orElse: () => const SizedBox.shrink(),
                      ),
                    ),
                  ),
                  Padding(
                    padding: pagePadding + const EdgeInsets.symmetric(horizontal: 2),
                    child: CustomTabBar(
                      tabs: [
                        Tab(key: Keys.clubPageFeedTab, text: context.l10n.feed),
                        Tab(key: Keys.clubPageEventsTab, text: context.l10n.events),
                        Tab(key: Keys.clubPageMatchesTab, text: context.l10n.matches),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ];
        },
        body: const TabBarView(
          children: [
            _FeedView(),
            _EventsView(),
            _MatchView(),
          ],
        ),
      ),
    );
  }
}

class _FeedView extends StatefulWidget {
  const _FeedView({Key? key}) : super(key: key);

  @override
  State<_FeedView> createState() => _FeedViewState();
}

class _FeedViewState extends State<_FeedView> with AutomaticKeepAliveClientMixin<_FeedView> {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    final pageState = context.read<ClubPageCubit>();
    return ListView(
      // mainAxisSize: MainAxisSize.min,
      children: [
        const SizedBox(height: 32),
        AsyncCubitBuilder<List<News>>(
          bloc: pageState.news,
          builder: (_, state) {
            return state.maybeMap(
              orElse: () => const SizedBox.shrink(),
              data: (d) => Column(
                children: [
                  SectionHeader(
                    padding: ClubView.pagePadding + const EdgeInsets.only(left: 5, bottom: 8),
                    title: context.l10n.latestNews,
                    subtitle: '${context.l10n.allNews}   >',
                    onSubtitleTap: () {
                      final club = pageState.selectedClub.state.valueOrNull!;
                      Routemaster.of(context).pushWithScope(
                        R.routeNames.newsArchive,
                        value: Either<Club, List<Club>>.left(club),
                      );
                    },
                  ),
                  Padding(
                    padding: ClubView.pagePadding + const EdgeInsets.only(left: 5),
                    child: NewsList(
                      news: d.value.sublist(0, math.min(2, d.value.length)),
                      displayClubLogo: false,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                    ),
                  ),
                ],
              ),
              loading: (_) => Column(
                children: [
                  SectionHeader(
                    padding: ClubView.pagePadding + const EdgeInsets.only(left: 5),
                    title: context.l10n.latestNews,
                    subtitle: '${context.l10n.allNews}   >',
                  ),
                  Padding(
                    padding: ClubView.pagePadding + const EdgeInsets.only(left: 5),
                    child: NewsList.loading(),
                  ),
                ],
              ),
            );
          },
        ),
        AsyncCubitBuilder<List<SocialMedia>?>(
          bloc: pageState.socialMedia,
          builder: (_, state) {
            return state.maybeMap(
              orElse: () => const SizedBox.shrink(),
              data: (d) => d.value != null ? SocialMediaSection(posts: d.value!) : const SizedBox.shrink(),
              loading: (_) => Center(child: NewsList.loading()),
            );
          },
        ),
        AsyncCubitBuilder<GameRanking?>(
          bloc: pageState.gameRanking,
          builder: (_, state) {
            return state.maybeMap(
              orElse: () => const SizedBox.shrink(),
              data: (d) => d.value != null
                  ? Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: RankingSection(gameRanking: d.value!),
                    )
                  : const SizedBox.shrink(),
            );
          },
        ),
        AsyncCubitBuilder<List<OrgFeaturedPlayer>>(
          bloc: pageState.featuredPlayers,
          builder: (_, state) {
            return state.maybeMap(
              orElse: () => const SizedBox.shrink(),
              data: (d) => FeaturedPlayersList(featuredPlayers: d.value),
              loading: (_) => Center(child: NewsList.loading()),
            );
          },
        ),
        const SizedBox(height: 40),
        AsyncCubitBuilder<Club>(
          bloc: context.read<ClubPageCubit>().selectedClub,
          builder: (context, data) => data.maybeMap(
            data: (d) => PartnersSection(clubSlug: d.value.slug),
            loading: (d) => ClubListTile.loading(),
            orElse: () => const SizedBox.shrink(),
          ),
        ),
        const SizedBox(height: 40),
      ],
    );
  }
}

class _EventsView extends StatefulWidget {
  const _EventsView({Key? key}) : super(key: key);

  @override
  State<_EventsView> createState() => _EventsViewState();
}

class _EventsViewState extends State<_EventsView> with AutomaticKeepAliveClientMixin<_EventsView> {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    final pageState = context.read<ClubPageCubit>();
    return AsyncCubitBuilder<List<TournamentInterface>>(
      bloc: pageState.allTournamentsAndCollections,
      builder: (_, state) {
        return Padding(
          padding: const EdgeInsets.only(top: 32),
          child: state.maybeMap(
            orElse: () => const SizedBox.shrink(),
            data: (d) {
              //obtain live now tournament
              final tournaments = d.value;

              final sortedList = tournaments.sorted(
                (a, b) => b.startsAt.compareTo(a.startsAt),
              );

              final liveNowTournament = sortedList.firstWhereOrNull(
                (element) =>
                    element.hasFlag(TournamentFlags.orgFeatured) &&
                    !element.hasInternalFlag(InternalTournamentFlags.tournamentStarted),
              );
              return Padding(
                padding: ClubView.pagePadding + const EdgeInsets.only(left: 5),
                child: TournamentsList(
                  prepend: Column(
                    children: [
                      if (liveNowTournament != null)
                        AnimationConfiguration.staggeredList(
                          position: -1,
                          duration: const Duration(milliseconds: 325),
                          delay: const Duration(milliseconds: 25),
                          child: FadeInAnimation(
                            child: Padding(
                              padding: ClubView.pagePadding,
                              child: LiveNowTournamentCard(tournament: liveNowTournament),
                            ),
                          ),
                        ),
                      if (liveNowTournament != null) const SizedBox(height: 19),
                      SectionHeader(
                        padding: ClubView.pagePadding,
                        title: context.l10n.featuredTournaments,
                      ),
                      const SizedBox(height: 19),
                    ],
                  ),
                  tournaments: tournaments.where((tournament) => tournament.id != liveNowTournament?.id).toList(),
                ),
              );
            },
            loading: (_) => TournamentsList.loading(),
            error: (e) {
              final error = e.error;
              if (error is NetworkException) {
                return error.map(
                  (value) => const NetworkExceptionWidget(),
                  noDataException: (value) => NoElementsExceptionWidget(
                    text: context.l10n.noTournaments,
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
          ),
        );
      },
    );
  }
}

class _MatchView extends StatefulWidget {
  const _MatchView({Key? key}) : super(key: key);

  @override
  State<_MatchView> createState() => _MatchViewState();
}

class _MatchViewState extends State<_MatchView> with AutomaticKeepAliveClientMixin<_MatchView> {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    final pageState = context.read<ClubPageCubit>();

    return AsyncCubitListBuilder<LatestMatch>(
      bloc: pageState.latestMatches,
      itemBuilder: (_, i) => Padding(
        padding: ClubView.pagePadding + const EdgeInsets.only(left: 5),
        child: OrgMatchCard(match: i as OrgMatch),
      ),
      loading: (_) => Center(child: NewsList.loading()),
      error: DefaultErrorBuilder.new,
      prepend: (s) => [
        const SizedBox(height: 32),
        AsyncCubitBuilder<NextMatch>(
          bloc: pageState.nextMatch,
          builder: (_, state) {
            return state.maybeMap(
              orElse: () => const SizedBox.shrink(),
              data: (d) => Column(
                children: [
                  SectionHeader(
                    padding: ClubView.pagePadding + const EdgeInsets.only(left: 5, bottom: 15),
                    title: context.l10n.nextMatchTitle,
                  ),
                  Padding(
                    padding: ClubView.pagePadding + const EdgeInsets.only(left: 5),
                    child: OrgMatchCard(match: d.value as OrgMatch),
                  ),
                ],
              ),
              loading: (_) => Center(child: NewsList.loading()),
            );
          },
        ),
        if (s is AsyncData)
          SectionHeader(
            padding: ClubView.pagePadding + const EdgeInsets.only(left: 5, top: 16, bottom: 15),
            title: context.l10n.matchResultsTitle,
          ),
      ],
    );
  }
}

class DefaultErrorBuilder<E> extends StatelessWidget {
  final AsyncError<E> error;

  const DefaultErrorBuilder(this.error, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _error = error.error;
    if (_error is NetworkException) {
      return _error.map(
        (value) => const NetworkExceptionWidget(),
        noDataException: (value) => NoElementsExceptionWidget(
          text: context.l10n.noLatestMatches,
        ),
      );
    } else {
      if (kReleaseMode) {
        Sentry.captureException(_error, stackTrace: error.stackTrace);
      } else {
        log('Error of $E ', error: error.error, stackTrace: error.stackTrace);
      }
      return const UnexpectedExceptionWidget();
    }
  }
}
