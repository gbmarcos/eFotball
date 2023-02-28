import 'dart:async';

import 'package:extended_nested_scroll_view/extended_nested_scroll_view.dart';
import 'package:fifa/r.dart';
import 'package:fifa/resources/resources.dart';
import 'package:fifa/src/app/dependency_injection.dart';
import 'package:fifa/src/app/keys.dart';

import 'package:fifa/src/common/extensions.dart';
import 'package:fifa/src/common/widgets/components/custom_tab_bar.dart';
import 'package:fifa/src/common/widgets/custom_search_field.dart';
import 'package:fifa/src/features/club/club_row.dart';
import 'package:fifa/src/features/club/widgets/partner_card.dart';
import 'package:fifa/src/features/home/home_page_cubit.dart';
import 'package:fifa/src/features/match/matches_list.dart';
import 'package:fifa/src/features/news/news_list.dart';
import 'package:fifa/src/features/tournaments/tournament_section.dart';
import 'package:fifa/src/notifications/notification_app_bar.dart';
import 'package:fifa/src/push_notification/push_notification.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const DefaultTabController(
      length: 3,
      initialIndex: 1,
      child: HomeView(),
    );
  }
}

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  late final controller = TextEditingController();
  late final focus = FocusNode();
  late final scroll = ScrollController();

  @override
  void dispose() {
    controller.dispose();
    focus.dispose();
    scroll.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final homeState = getIt<HomePageCubit>();
    return Scaffold(
      key: Keys.homePage,
      backgroundColor: R.colors.background,
      appBar: NotificationAppBar(title: Text(context.l10n.homeFeed, maxLines: 1)),
      body: SafeArea(
        child: ExtendedNestedScrollView(
          controller: scroll,
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
                    AsyncClubSection(clubs: homeState.featuredClubs),
                    CustomTabBar(
                      padding: const EdgeInsets.only(left: 17, right: 17, top: 8),
                      tabs: [
                        Tab(key: Keys.homePageEventsTab, child: Text(context.l10n.events, style: TextStyles.tab)),
                        Tab(key: Keys.homePageNewsTab, child: Text(context.l10n.news, style: TextStyles.tab)),
                        Tab(key: Keys.homePageMatchesTab, child: Text(context.l10n.matches, style: TextStyles.tab)),
                      ],
                    )
                  ],
                ),
              )
            ];
          },
          body: TabBarView(
            children: [
              RefreshIndicator(
                  onRefresh: () async {
                    homeState.tournamentsAndCollections.refresh();
                  },
                  child: AsyncTournamentSection(tournamentsAndCollections: homeState.tournamentsAndCollections)),
              RefreshIndicator(
                  onRefresh: () async {
                    homeState.news.refresh();
                  },
                  child: AsyncNewsSection(news: homeState.news)),
              RefreshIndicator(
                onRefresh: () async {
                  homeState.matches.refresh();
                },
                child: AsyncMatchesSection(
                    matches: homeState.matches,
                    prepend: Column(
                      key: const ValueKey('matches_search_section'),
                      children: [
                        const SizedBox(height: 33),
                        Padding(
                          padding: const EdgeInsets.only(right: 19),
                          child: CustomSearchTextField(
                            key: const ValueKey('matches_search_controller'),
                            controller: controller,
                            focusNode: focus,
                            onChanged: (query) {
                              homeState.searchMatches(query.isNullOrEmpty ? null : query);
                            },
                            alignment: Alignment.topRight,
                            hintText: context.l10n.search,
                            maxWidth: 150,
                          ),
                        ),
                        const SizedBox(height: 20),
                      ],
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> testC() => [
        ListView.builder(
          //store Page state
          key: const PageStorageKey<String>('Tab0'),
          physics: const ClampingScrollPhysics(),
          itemBuilder: (BuildContext c, int i) {
            return Container(
              alignment: Alignment.center,
              height: 60.0,
              child: Text(const Key('Tab0').toString() + ': ListView$i'),
            );
          },
          itemCount: 50,
        ),
        ListView.builder(
          //store Page state
          key: const PageStorageKey<String>('Tab1'),
          physics: const ClampingScrollPhysics(),
          itemBuilder: (BuildContext c, int i) {
            return Container(
              alignment: Alignment.center,
              height: 60.0,
              color: Colors.accents[i % Colors.accents.length],
              child: Text(const Key('Tab1').toString() + ': ListView$i'),
            );
          },
          itemCount: 50,
        ),
        ListView.builder(
          //store Page state
          key: const PageStorageKey<String>('Tab2'),
          physics: const ClampingScrollPhysics(),
          itemBuilder: (BuildContext c, int i) {
            return Container(
              alignment: Alignment.center,
              height: 60.0,
              child: Text(const Key('Tab2').toString() + ': ListView$i'),
            );
          },
          itemCount: 50,
        ),
      ];

  Widget slivers() {
    final homeState = getIt<HomePageCubit>();

    return CustomScrollView(
      controller: scroll,
      slivers: [
        const SliverToBoxAdapter(),
        //☝⏫  Workaround until https://github.com/flutter/flutter/pull/96377 is merged into stable (>2.12)
        SliverAsyncClubSection(clubs: homeState.featuredClubs),

        SliverToBoxAdapter(
          child: Column(
            children: [
              CustomTabBar(
                padding: const EdgeInsets.only(left: 17, right: 17, top: 8, bottom: 23),
                tabs: [
                  Tab(key: Keys.homePageEventsTab, child: Text(context.l10n.events, style: TextStyles.tab)),
                  Tab(key: Keys.homePageNewsTab, child: Text(context.l10n.news, style: TextStyles.tab)),
                  Tab(key: Keys.homePageMatchesTab, child: Text(context.l10n.matches, style: TextStyles.tab)),
                ],
              )
            ],
          ),
        ),
        SliverFillRemaining(
          child: TabBarView(
            children: [
              RefreshIndicator(
                  onRefresh: () async {
                    homeState.tournamentsAndCollections.refresh();
                  },
                  child: AsyncTournamentSection(tournamentsAndCollections: homeState.tournamentsAndCollections)),
              RefreshIndicator(
                  onRefresh: () async {
                    homeState.news.refresh();
                  },
                  child: AsyncNewsSection(
                    news: homeState.news,
                    scrollController: scroll,
                  )),
              Column(
                children: [
                  const SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.only(right: 19),
                    child: CustomSearchTextField(
                      controller: controller,
                      onChanged: (query) {
                        homeState.searchMatches(query.isNullOrEmpty ? null : query);
                      },
                      alignment: Alignment.topRight,
                      hintText: context.l10n.search,
                      maxWidth: 150,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Expanded(
                    child: RefreshIndicator(
                      onRefresh: () async {
                        homeState.matches.refresh();
                      },
                      child: AsyncMatchesSection(matches: homeState.matches),
                    ),
                  ),
                ],
              ),
            ],
          ),
        )
      ],
    );
  }

  Widget neww() {
    final homeState = getIt<HomePageCubit>();
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            children: [
              AsyncClubSection(clubs: homeState.featuredClubs),
              CustomTabBar(
                padding: const EdgeInsets.only(left: 17, right: 17, top: 8),
                tabs: [
                  Tab(child: Text(context.l10n.events, style: TextStyles.tab)),
                  Tab(child: Text(context.l10n.news, style: TextStyles.tab)),
                  Tab(child: Text(context.l10n.matches, style: TextStyles.tab)),
                ],
              )
            ],
          ),
        ),
        SliverPadding(
          padding: const EdgeInsets.only(top: 23),
          sliver: SliverFillRemaining(
            fillOverscroll: true,
            child: TabBarView(
              children: [
                RefreshIndicator(
                    onRefresh: () async {
                      homeState.tournamentsAndCollections.refresh();
                    },
                    child: AsyncTournamentSection(tournamentsAndCollections: homeState.tournamentsAndCollections)),
                RefreshIndicator(
                    onRefresh: () async {
                      homeState.news.refresh();
                    },
                    child: AsyncNewsSection(news: homeState.news)),
                Column(
                  children: [
                    const SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.only(right: 19),
                      child: CustomSearchTextField(
                        controller: controller,
                        onChanged: (query) {
                          homeState.searchMatches(query.isNullOrEmpty ? null : query);
                        },
                        alignment: Alignment.topRight,
                        hintText: context.l10n.search,
                        maxWidth: 150,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Expanded(
                      child: RefreshIndicator(
                        onRefresh: () async {
                          homeState.matches.refresh();
                        },
                        child: AsyncMatchesSection(matches: homeState.matches),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget old() {
    final homeState = getIt<HomePageCubit>();

    return NestedScrollView(
      headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
        return <Widget>[
          SliverOverlapAbsorber(
            handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
            sliver: SliverAppBar(
              backgroundColor: Colors.transparent,
              floating: true,
              snap: true,
              expandedHeight: 247.0 + 23,
              forceElevated: innerBoxIsScrolled,
              flexibleSpace: FlexibleSpaceBar(
                collapseMode: CollapseMode.pin,
                background: AsyncClubSection(clubs: homeState.featuredClubs),
              ),
              bottom: CustomTabBar(
                padding: const EdgeInsets.only(left: 17, right: 17, top: 8, bottom: 23),
                tabs: [
                  Tab(child: Text(context.l10n.events, style: TextStyles.tab)),
                  Tab(child: Text(context.l10n.news, style: TextStyles.tab)),
                  Tab(child: Text(context.l10n.matches, style: TextStyles.tab)),
                ],
              ),
            ),
          ),
        ];
      },
      body: TabBarView(
        children: [
          RefreshIndicator(
              onRefresh: () async {
                homeState.tournamentsAndCollections.refresh();
              },
              child: AsyncTournamentSection(tournamentsAndCollections: homeState.tournamentsAndCollections)),
          RefreshIndicator(
              onRefresh: () async {
                homeState.news.refresh();
              },
              child: AsyncNewsSection(news: homeState.news)),
          Column(
            children: [
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.only(right: 19),
                child: CustomSearchTextField(
                  controller: controller,
                  onChanged: (query) {
                    homeState.searchMatches(query.isNullOrEmpty ? null : query);
                  },
                  alignment: Alignment.topRight,
                  hintText: context.l10n.search,
                  maxWidth: 150,
                ),
              ),
              const SizedBox(height: 20),
              Expanded(
                child: RefreshIndicator(
                  onRefresh: () async {
                    homeState.matches.refresh();
                  },
                  child: AsyncMatchesSection(matches: homeState.matches),
                ),
              ),
            ],
          ),
        ],
        // .map((e) => CustomScrollView(
        //       slivers: [
        //         SliverOverlapInjector(
        //           handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
        //         ),
        //         SliverToBoxAdapter(child: e)
        //       ],
        //     ))
        // .toList(),
        // );
      ),
    );
  }

  @override
  void initState() {
    unawaited(Future<void>.delayed(const Duration(seconds: 3)).then((dynamic value) {
      if (mounted) {
        unawaited(getIt<PushNotificationService>().requestNotificationPermission());
      }
    }));

    super.initState();
  }
}

/// Default partner that should be dislpa
class SvenskaHomePartner extends StatelessWidget {
  const SvenskaHomePartner({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      key: const ValueKey("Svenska"),
      children: [
        Center(
          child: Padding(
            padding: const EdgeInsets.only(right: 8, left: 8, top: 20),
            child: Text(context.l10n.partners),
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(right: 8, left: 8, bottom: 20, top: 10),
          child: MockPartnerCard(Images.partnerSvenskefotboll),
        ),
      ],
    );
  }
}
