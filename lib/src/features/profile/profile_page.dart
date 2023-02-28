import 'dart:developer';

import 'package:async_data_bloc/async_data_bloc.dart';
import 'package:fifa/r.dart';
import 'package:fifa/resources/e_fotball_icons.dart';
import 'package:fifa/src/app/dependency_injection.dart';
import 'package:fifa/src/app/keys.dart';
import 'package:fifa/src/common/exceptions.dart';
import 'package:fifa/src/common/extensions.dart';
import 'package:fifa/src/common/widgets/app_image.dart';
import 'package:fifa/src/common/widgets/components/custom_tab_bar.dart';
import 'package:fifa/src/common/widgets/components/section_header.dart';
import 'package:fifa/src/common/widgets/counter_badge.dart';
import 'package:fifa/src/common/widgets/custom_shimmer.dart';
import 'package:fifa/src/common/widgets/exception_widget.dart';
import 'package:fifa/src/common/widgets/stats.dart';
import 'package:fifa/src/features/club/club_page.dart';
import 'package:fifa/src/features/club/model/org_featured_player.dart';
import 'package:fifa/src/features/match/matches_list.dart';
import 'package:fifa/src/features/match/model/match.dart';
import 'package:fifa/src/features/profile/models/user_profile.dart';
import 'package:fifa/src/features/profile/profile_page_cubit.dart';
import 'package:fifa/src/notifications/notification_app_bar.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:routemaster/routemaster.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

class ProfilePage extends StatelessWidget {
  final int? userId;

  const ProfilePage({Key? key, this.userId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (context) => ProfilePageCubit(
        matchRepository: getIt(),
        profileRepository: getIt(),
        friendRepository: getIt(),
        userId: userId ?? context.currentUser.id,
      ),
      child: const ProfileView(),
    );
  }
}

class ProfileView extends StatefulWidget {
  const ProfileView({Key? key}) : super(key: key);
  static const pagePadding = EdgeInsets.symmetric(horizontal: 17);

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  late ValueNotifier<bool> isFetchingMore = ValueNotifier(false);

  @override
  void dispose() {
    isFetchingMore.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final pageState = context.read<ProfilePageCubit>();

    return DefaultTabController(
      length: 2,
      child: Builder(
        builder: (context) {
          return Scaffold(
            key: Keys.profilePage,
            appBar: NotificationAppBar(title: Text(context.l10n.profileLabel)),
            body: NotificationListener<ScrollUpdateNotification>(
              onNotification: (notification) {
                final selectedPage = DefaultTabController.of(context)!.index;

                loadMore(notification, selectedPage, pageState);

                return false;
              },
              child: ListView(
                padding: ProfileView.pagePadding,
                children: [
                  const SizedBox(height: 32),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      AsyncCubitBuilder<UserProfile>(
                        bloc: pageState.profile,
                        builder: (_, state) {
                          return state.maybeMap(
                            orElse: () => const SizedBox.shrink(),
                            data: (profile) => Stack(
                              children: [
                                Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    ProfileAvatarWidget(profile: profile.value),
                                    _StatsBoard(stats: profile.value.stats),
                                    const SizedBox(height: 10),
                                    const _SocialBoard(),
                                    const SizedBox(height: 10),
                                    _ProfileTabBar(profile: profile.value),
                                    const SizedBox(height: 10),
                                    AnimatedContainer(
                                      duration: const Duration(milliseconds: 150),
                                      child: AnimatedSwitcher(
                                        duration: const Duration(milliseconds: 150),
                                        child: _ProfileTabView(
                                          tabController: DefaultTabController.of(context)!,
                                          isFetchingMore: isFetchingMore,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                                if (profile.value.id == context.currentUser.id)
                                  Positioned(
                                    top: 0,
                                    right: 0,
                                    child: InkWell(
                                      key: Keys.profilePageEditProfileButton,
                                      radius: 50,
                                      onTap: () {
                                        Routemaster.of(context).pushWithScope(
                                          R.routeNames.profileSettings,
                                          value: context.read<ProfilePageCubit>(),
                                        );
                                      },
                                      borderRadius: BorderRadius.circular(50),
                                      child: const Icon(
                                        Icons.settings,
                                        size: 35,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                              ],
                            ),
                            loading: (_) => const ProfileInfoLoading(),
                            error: DefaultErrorBuilder.new,
                          );
                        },
                      )
                    ],
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  void loadMore(
    ScrollUpdateNotification notification,
    int selectedPage,
    ProfilePageCubit pageState,
  ) {
    if (notification.shouldLoadMoreFlag && !isFetchingMore.value) {
      if (selectedPage == 0) {
        isFetchingMore.value = true;
        //todo(marcos)
        isFetchingMore.value = false;
      } else {
        pageState.friends.state.maybeMap(
          orElse: () {},
          data: (data) {
            isFetchingMore.value = true;
            pageState.loadMoreFriends().then((_) => isFetchingMore.value = false);
          },
        );
      }
    }
  }
}

class _ProfileTabView extends StatefulWidget {
  final TabController tabController;
  final ValueNotifier<bool> isFetchingMore;

  const _ProfileTabView({Key? key, required this.tabController, required this.isFetchingMore}) : super(key: key);

  @override
  _ProfileTabViewState createState() => _ProfileTabViewState();
}

class _ProfileTabViewState extends State<_ProfileTabView> {
  late final TabController tabController = widget.tabController;

  void _updateState() {
    if (tabController.indexIsChanging) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    final index = tabController.index;
    late Widget child;

    if (index == 0) {
      child = const ProfileHome();
    } else if (index == 1) {
      child = FriendView(isFetchingMore: widget.isFetchingMore);
    } else {
      child = const UnderConstruction();
    }

    return child;
  }

  @override
  void initState() {
    super.initState();
    tabController.addListener(_updateState);
  }

  @override
  void dispose() {
    tabController.removeListener(_updateState);
    super.dispose();
  }
}

class ProfileHome extends StatelessWidget {
  const ProfileHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final pageState = context.read<ProfilePageCubit>();
    return AsyncCubitBuilder<List<Match>>(
      bloc: pageState.userMatches,
      builder: (_, state) {
        return state.maybeMap(
          orElse: () => const SizedBox.shrink(),
          data: (matches) => MatchesList(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            prepend: SectionHeader(
              title: context.l10n.results,
              padding: const EdgeInsets.symmetric(vertical: 20),
            ),
            padding: EdgeInsets.zero,
            matches: matches.value,
          ),
          loading: (_) => const Center(child: CircularProgressIndicator.adaptive()),
          error: (e) {
            final error = e.error;
            if (error is NetworkException) {
              return error.map(
                (value) => const NetworkExceptionWidget(),
                noDataException: (value) => NoElementsExceptionWidget(
                  text: context.l10n.noMatches,
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
        );
      },
    );
  }
}

class FriendView extends StatefulWidget {
  const FriendView({Key? key, required this.isFetchingMore}) : super(key: key);

  final ValueNotifier<bool> isFetchingMore;

  @override
  State<FriendView> createState() => _FriendViewState();
}

class _FriendViewState extends State<FriendView> {
  late final controller = TextEditingController();

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final pageState = context.read<ProfilePageCubit>();
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        //todo(marcos) test it
        if (pageState.friends.state.valueOrNull != null) ...[
          const SizedBox(height: 10),
          _FriendSearchTextField(
            controller: controller,
          ),
          const SizedBox(height: 20)
        ],
        AsyncCubitBuilder<List<Friend>>(
          bloc: pageState.friends,
          builder: (_, state) {
            return state.maybeMap(
              orElse: () => const SizedBox.shrink(),
              data: (friends) => FriendList(
                friends: friends.value,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
              ),
              loading: (_) => FriendList.loading(),
              error: (e) {
                final error = e.error;
                if (error is NetworkException) {
                  return error.map(
                    (value) => NetworkExceptionWidget(
                      refresh: pageState.friends.refresh,
                    ),
                    noDataException: (value) => NoElementsExceptionWidget(
                      text: context.l10n.noResults,
                      refresh: pageState.friends.refresh,
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
                    refresh: pageState.friends.refresh,
                  );
                }
              },
            );
          },
        ),
        ValueListenableBuilder<bool>(
          valueListenable: widget.isFetchingMore,
          builder: (context, isFetching, _) {
            return AnimatedSwitcher(
              duration: const Duration(milliseconds: 200),
              child: isFetching
                  ? Column(
                      children: [
                        FriendList.loading(count: 3),
                      ],
                    )
                  : const SizedBox.shrink(),
            );
          },
        ),
        const SizedBox(height: 10),
      ],
    );
  }

  void reloadFriendList(ProfilePageCubit pageState) {}
}

class _FriendSearchTextField extends StatelessWidget {
  const _FriendSearchTextField({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    final pageState = context.read<ProfilePageCubit>();

    return Align(
      alignment: Alignment.topLeft,
      child: Theme(
        data: context.theme.copyWith(
          hintColor: R.colors.searchFieldUnderlineColor,
          inputDecorationTheme: InputDecorationTheme(
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: R.colors.searchFieldUnderlineColor),
            ),
          ),
        ),
        child: TextField(
          controller: controller,
          textAlignVertical: TextAlignVertical.center,
          decoration: InputDecoration(
            prefixIcon: Padding(
              padding: const EdgeInsets.only(left: 3, right: 8, bottom: 4),
              child: Icon(
                Icons.search,
                color: R.colors.inputBoxTextInitiative,
                size: 20,
              ),
            ),
            hintText: context.l10n.search,
            hintStyle: const TextStyle(color: Colors.white, fontSize: 13, fontWeight: FontWeight.w400),
            constraints: const BoxConstraints(
              maxHeight: 40,
              maxWidth: 192,
            ),
            prefixIconConstraints: const BoxConstraints(
              maxHeight: 40,
            ),
            isDense: true,
          ),
          onChanged: (query) {
            pageState.searchFriends(query.isNullOrEmpty ? null : query);
          },
        ),
      ),
    );
  }
}

class FriendList extends StatelessWidget {
  final List<Friend> friends;
  final ScrollPhysics? physics;
  final bool shrinkWrap;

  const FriendList({Key? key, required this.friends, this.physics, this.shrinkWrap = false}) : super(key: key);

  static Widget loading({Key? key, int count = 5}) => _LoadingFriendList(
        count: count,
      );

  @override
  Widget build(BuildContext context) {
    return AnimationLimiter(
      child: ListView.builder(
        shrinkWrap: shrinkWrap,
        physics: physics,
        itemCount: friends.length,
        itemBuilder: (ctx, i) {
          return AnimationConfiguration.staggeredList(
            position: i,
            duration: const Duration(milliseconds: 325),
            delay: const Duration(milliseconds: 25),
            child: FadeInAnimation(
              child: FriendCard(friend: friends[i]),
            ),
          );
        },
      ),
    );
  }
}

class FriendCard extends StatelessWidget {
  final Friend friend;

  const FriendCard({Key? key, required this.friend}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const size = 30.0;

    final placeholder = Container(
      height: size,
      width: size,
      decoration: BoxDecoration(
        color: R.colors.circleAvatarColor,
        shape: BoxShape.circle,
      ),
    );

    return Container(
      margin: const EdgeInsets.only(bottom: 4),
      child: InkWell(
        onTap: () {
          if (friend.id == context.currentUser.id) {
            Routemaster.of(context).push(R.routeNames.profileSection);
          } else if (friend.id != null) {
            Routemaster.of(context).pushWithScope(
              R.routeNames.profileDetailsWithId(friend.id!),
              value: friend,
            );
          }
        },
        borderRadius: R.shapes.radius_4,
        child: Container(
          padding: const EdgeInsets.only(left: 13, right: 23),
          height: 50,
          alignment: AlignmentDirectional.center,
          decoration: BoxDecoration(
            borderRadius: R.shapes.radius_4,
            color: R.colors.boxBackground,
          ),
          child: Row(
            children: [
              AppImage(
                imageSize: const Size(35, 35),
                circularShape: true,
                image: friend.avatar,
                error: (context) => placeholder,
                placeholder: (_) => placeholder,
              ),
              const SizedBox(
                width: 15,
              ),
              Expanded(
                child: Text(
                  friend.username,
                  style: const TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w500),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _LoadingFriendList extends StatelessWidget {
  const _LoadingFriendList({Key? key, this.count = 5}) : super(key: key);
  final int count;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      itemCount: count,
      itemBuilder: (_, i) => CustomShimmer(
        child: ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(4)),
          child: Container(
            color: Colors.black12.withOpacity(1),
            height: 50,
          ),
        ),
      ),
      separatorBuilder: (BuildContext context, int index) => const SizedBox(height: 4),
    );
  }
}

class _ProfileTabBar extends StatelessWidget {
  final UserProfile profile;

  const _ProfileTabBar({
    Key? key,
    required this.profile,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final numberOfFriends = profile.friends?.length ?? 0;

    return CustomTabBar(
      tabs: [
        Tab(
          key: Keys.profilePageTabOverview,
          child: Text(context.l10n.overview, style: TextStyles.tab),
        ),
        Tab(
          key: Keys.profilePageTabFriends,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(context.l10n.friends, style: TextStyles.tab),
              if (numberOfFriends > 0) ...[
                const SizedBox(width: 5),
                CounterBadge(count: numberOfFriends),
              ],
            ],
          ),
        ),
      ],
    );
  }
}

class _SocialBoard extends StatelessWidget {
  const _SocialBoard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: 54,
      decoration: BoxDecoration(
        color: R.colors.menuBarBackground,
        borderRadius: const BorderRadius.vertical(bottom: Radius.circular(4)),
      ),
      child: IconTheme(
        data: IconThemeData(
          color: R.colors.notFilledSocialMedia,
          size: 24,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: const [
            Icon(
              FontAwesomeIcons.twitter,
            ),
            Icon(
              FontAwesomeIcons.instagram,
            ),
            Icon(
              FontAwesomeIcons.twitch,
            ),
            Icon(
              FontAwesomeIcons.youtube,
            ),
          ],
        ),
      ),
    );
  }
}

class _StatsBoard extends StatelessWidget {
  final UserProfileStats stats;

  const _StatsBoard({
    Key? key,
    required this.stats,
  }) : super(key: key);
  static const animationDuration = Duration(milliseconds: 800);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: 160,
      decoration: BoxDecoration(
        color: R.colors.menuBarBackground,
        borderRadius: const BorderRadius.vertical(bottom: Radius.circular(4)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                EFotball.gamepad,
                color: context.theme.colorScheme.secondary,
                size: 60,
              ),
              const SizedBox(height: 10),
              TweenAnimationBuilder(
                duration: animationDuration,
                tween: IntTween(begin: 0, end: stats.totalMatches),
                builder: (BuildContext context, int value, Widget? child) {
                  return StatListTile(
                    value: '$value',
                    label: context.l10n.played,
                  );
                },
              )
            ],
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              RepaintBoundary(
                child: SizedBox(
                  height: 57,
                  width: 57,
                  child: TweenAnimationBuilder(
                    duration: animationDuration,
                    tween: Tween<double>(begin: 0, end: stats.winRatio ?? 0),
                    builder: (BuildContext context, double value, Widget? child) {
                      return CircularProgressIndicator(
                        value: value,
                        strokeWidth: 11,
                      );
                    },
                  ),
                ),
              ),
              const SizedBox(height: 10),
              TweenAnimationBuilder(
                duration: animationDuration,
                tween: Tween<double>(begin: 0, end: stats.winPercentage ?? 0),
                builder: (BuildContext context, double value, Widget? child) {
                  return StatListTile(
                    value: '${value.truncateToDecimals(1)}  %',
                    label: context.l10n.winRate,
                    spacing: 2,
                  );
                },
              )
            ],
          ),
        ],
      ),
    );
  }
}

class ProfileAvatarWidget extends StatelessWidget {
  final UserProfile profile;

  const ProfileAvatarWidget({
    Key? key,
    required this.profile,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const size = 107.0;

    final placeholder = Container(
      height: size,
      width: size,
      color: R.colors.circleAvatarColor,
    );

    return SizedBox(
      height: 162,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ClipOval(
            child: AppImage(
              imageSize: const Size(size, size),
              image: profile.avatar ?? '',
              fit: BoxFit.cover,
              error: (context) => placeholder,
              placeholder: (_) => placeholder,
            ),
          ),
          const SizedBox(height: 3),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                profile.username,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: context.theme.colorScheme.secondary,
                ),
              ),
              const SizedBox(width: 15),
              for (final console in profile.consoles)
                Container(
                  height: 30,
                  width: 30,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(color: R.colors.menuBarBackground, shape: BoxShape.circle),
                  child: Icon(console.icon, size: 16),
                ),
            ],
          ),
        ],
      ),
    );
  }
}

class ProfileInfoLoading extends StatelessWidget {
  const ProfileInfoLoading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomShimmer(
      child: ListView(
        shrinkWrap: true,
        children: [
          const CircleAvatar(radius: 54),
          const SizedBox(height: 65),
          Container(height: 160, color: Colors.black12.withOpacity(1)),
          const SizedBox(height: 10),
          Container(height: 60, color: Colors.black12.withOpacity(1)),
        ],
      ),
    );
  }
}
