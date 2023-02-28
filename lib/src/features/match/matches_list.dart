import 'package:async_data_bloc/async_data_bloc.dart';
import 'package:fifa/r.dart';
import 'package:fifa/src/app/dependency_injection.dart';
import 'package:fifa/src/app/keys.dart';
import 'package:fifa/src/common/widgets/appendable_list.dart';
import 'package:fifa/src/common/domain/match/match.dart';
import 'package:fifa/src/common/domain/team/team.dart';
import 'package:fifa/src/common/domain/tournament/tournament.dart';
import 'package:fifa/src/common/domain/user/user.dart';
import 'package:fifa/src/common/exceptions.dart';
import 'package:fifa/src/common/extensions.dart';
import 'package:fifa/src/common/widgets/app_image.dart';
import 'package:fifa/src/common/widgets/custom_shimmer.dart';
import 'package:fifa/src/common/widgets/exception_widget.dart';
import 'package:fifa/src/features/home/home_page.dart';
import 'package:fifa/src/features/match/match_repository.dart';
import 'package:fifa/src/features/match/model/match.dart';
import 'package:fifa/src/features/play_match/match_bloc/match_lobby_bloc.dart';
import 'package:flutter/material.dart';
import 'package:fpdart/fpdart.dart' show Either;
import 'package:routemaster/routemaster.dart';

class AsyncMatchesSection extends StatefulWidget {
  final Widget? prepend;
  final AsyncCubit<List<Match>> matches;

  const AsyncMatchesSection({Key? key, required this.matches, this.prepend}) : super(key: key);

  @override
  State<AsyncMatchesSection> createState() => _AsyncMatchesSectionState();
}

class _AsyncMatchesSectionState extends State<AsyncMatchesSection>
    with AutomaticKeepAliveClientMixin<AsyncMatchesSection> {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return AsyncCubitBuilder<List<Match>>(
      key: const ValueKey('AsyncMatches'),
      bloc: widget.matches,
      builder: (context, data) => data.maybeMap(
        data: (d) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 19),
            child: MatchesList(
              prepend: widget.prepend,
              matches: d.value,
              append: const SvenskaHomePartner(),
            ),
          );
        },
        error: (e) {
          Widget wrapper(Widget w) => Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  if (widget.prepend != null) widget.prepend!,
                  w,
                ],
              ));

          if (e.error is NoDataException) return wrapper(NoElementsExceptionWidget(text: context.l10n.noData));
          return wrapper(const NetworkExceptionWidget());
        },
        orElse: () => MatchesList.loading(prepend: widget.prepend),
      ),
    );
  }
}

class MatchesSection extends StatefulWidget {
  const MatchesSection({Key? key}) : super(key: key);

  @override
  _MatchesSectionState createState() => _MatchesSectionState();
}

class _MatchesSectionState extends State<MatchesSection> {
  late final MatchRepository repository = getIt();

  late final Future<Either<NetworkException, List<Match>>> _matches = repository.listMatches(featured: '1');

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        key: Keys.matchesHomeSection,
        future: _matches,
        builder: (context, AsyncSnapshot<Either<NetworkException, List<Match>>> snapshot) {
          if (snapshot.hasData && snapshot.data != null) {
            return snapshot.data!.fold(
              (error) => const NetworkExceptionWidget(),
              (matches) => MatchesList(matches: matches),
            );
          }
          return const Center(child: CircularProgressIndicator.adaptive());
        });
  }
}

class OrgMatchesList extends StatelessWidget {
  final List<LatestMatch> matches;
  final bool shrinkWrap;
  final ScrollPhysics? scrollPhysics;

  const OrgMatchesList({Key? key, required this.matches, this.shrinkWrap = true, this.scrollPhysics}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: shrinkWrap,
        physics: scrollPhysics,
        itemCount: matches.length,
        itemBuilder: (ctx, i) {
          return OrgMatchCard(match: matches[i] as OrgMatch);
        });
  }
}

class _LoadingMatchesSection extends StatelessWidget {
  final Widget? prepend;

  const _LoadingMatchesSection({Key? key, this.prepend}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 19),
      child: ListView.separated(
        shrinkWrap: true,
        itemCount: 10,
        itemBuilder: (_, i) {
          if (i == 0 && prepend != null) return prepend!;
          return CustomShimmer(
            child: ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(4)),
              child: Container(
                color: Colors.black12.withOpacity(1),
                height: 147,
              ),
            ),
          );
        },
        separatorBuilder: (BuildContext context, int index) => const SizedBox(height: 17),
      ),
    );
  }
}

class OrgMatchCard extends StatelessWidget {
  final OrgMatch match;

  const OrgMatchCard({
    Key? key,
    required this.match,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final team1Score = (match is LatestMatch)
        ? (match as LatestMatch)
            .matches
            .fold<int>(0, (previousValue, element) => previousValue + (element.user1.score ?? 0))
        : 0;
    final team2Score = (match is LatestMatch)
        ? (match as LatestMatch)
            .matches
            .fold<int>(0, (previousValue, element) => previousValue + (element.user2.score ?? 0))
        : 0;
    final gamesCount = (match is LatestMatch) ? (match as LatestMatch).matches.length : 0;

    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        borderRadius: R.shapes.radius_4,
        color: R.colors.cardBackground,
      ),
      child: InkWell(
        onTap: () {
          Routemaster.of(context).pushWithScope(
              R.routeNames.matchDetailsWithData(
                gamesCount: gamesCount,
                team1Score: team1Score,
                team2Score: team2Score,
              ),
              value: match);
        },
        borderRadius: R.shapes.radius_4,
        child: ClipRRect(
          borderRadius: R.shapes.radius_4,
          child: Column(
            children: [
              TeamListTile(
                team: match.team1,
                score: team1Score,
                isWinner: match is NextMatch ? null : team1Score >= team2Score,
              ),
              TeamListTile(
                team: match.team2,
                score: team2Score,
                isWinner: match is NextMatch ? null : team2Score >= team1Score,
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 13),
                color: R.colors.menuBarBackground,
                height: 47,
                child: Row(
                  children: [
                    AppImage(
                      imageSize: const Size(24, 24),
                      image: match.tournament.logo ?? '',
                      error: (context) => const Icon(
                        Icons.shield_outlined,
                        color: Colors.white,
                      ),
                      placeholder: (_) => const Icon(
                        Icons.shield_outlined,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            match.tournament.name ?? '-',
                            style: const TextStyle(color: Colors.white, fontSize: 11),
                            overflow: TextOverflow.fade,
                          ),
                          Text(
                            getFormattedDate(context),
                            style: TextStyle(color: context.theme.colorScheme.secondary, fontSize: 11),
                            overflow: TextOverflow.fade,
                          ),
                        ],
                      ),
                    ),
                    if (gamesCount > 0)
                      Container(
                        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 7),
                        decoration: BoxDecoration(
                          color: R.colors.gameCountTagBackground,
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: Text(
                          '$gamesCount Games',
                          style: TextStyle(color: context.theme.colorScheme.secondary, fontSize: 10),
                          overflow: TextOverflow.fade,
                        ),
                      ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  String getFormattedDate(BuildContext context) {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final yesterday = DateTime(now.year, now.month, now.day - 1);

    final matchDate = DateTime(match.startsAt.year, match.startsAt.month, match.startsAt.day);

    if (matchDate.isAtSameMomentAs(today)) {
      return context.l10n.todayText;
    } else if (matchDate.isAtSameMomentAs(yesterday)) {
      return context.l10n.yesterdayTextText;
    } else {
      return R.dateSpecifications.localizeMD(match.startsAt, context);
    }
  }
}

class TeamListTile extends StatelessWidget {
  final NextMatchTeam team;
  final int? score;
  final bool? isWinner;

  const TeamListTile({
    Key? key,
    required this.team,
    this.score,
    this.isWinner,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final teamsTextStyle = TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w400,
      color: R.colors.inputBoxTextInitiative,
    );

    return Container(
      height: 50,
      padding: const EdgeInsets.symmetric(
        horizontal: 13,
      ),
      child: Row(
        children: [
          AppImage(
            imageSize: const Size(35, 35),
            image: team.logo ?? '',
            error: (context) => Icon(
              Icons.shield_outlined,
              color: isWinner ?? true ? Colors.white : R.colors.inputBoxTextInitiative,
            ),
            placeholder: (_) => Icon(
              Icons.shield_outlined,
              color: isWinner ?? true ? Colors.white : R.colors.inputBoxTextInitiative,
            ),
          ),
          const SizedBox(
            width: 16,
          ),
          Expanded(
            child: Text(
              team.name ?? '-',
              style: isWinner ?? true
                  ? teamsTextStyle.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                    )
                  : teamsTextStyle,
              overflow: TextOverflow.fade,
            ),
          ),
          Text(
            (score ?? '...').toString(),
            style: isWinner == null
                ? teamsTextStyle.copyWith(color: Colors.white)
                : isWinner!
                    ? teamsTextStyle.copyWith(
                        color: context.theme.colorScheme.secondary,
                        fontWeight: FontWeight.w500,
                      )
                    : teamsTextStyle,
          ),
        ],
      ),
    );
  }
}

class MatchesList extends StatelessWidget {
  final List<Match> matches;
  final TournamentRef? tournament;
  final Widget? prepend;
  final Widget? append;
  final EdgeInsets? padding;
  final bool shrinkWrap;
  final ScrollPhysics? physics;

  const MatchesList({
    Key? key,
    required this.matches,
    this.tournament,
    this.prepend,
    this.append,
    this.padding,
    this.shrinkWrap = false,
    this.physics,
  }) : super(key: key);

  static Widget loading({Key? keyl, Widget? prepend}) => _LoadingMatchesSection(prepend: prepend);

  @override
  Widget build(BuildContext context) {
    return AppendableList(
        key: Keys.matchesList,
        prepend: prepend,
        append: append,
        animated: true,
        shrinkWrap: shrinkWrap,
        physics: physics,
        itemBuilder: (_, i) {
          final match = matches[i];
          return MatchCard(match: match, tournament: tournament);
        },
        itemCount: matches.length);
  }
}

class MatchCard extends StatelessWidget {
  final Match match;
  final TournamentRef? tournament;

  const MatchCard({
    Key? key,
    required this.match,
    this.tournament,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        borderRadius: R.shapes.radius_4,
        color: R.colors.cardBackground,
      ),
      child: InkWell(
        onTap: () {
          getIt<MatchLobbyBloc>().add(MatchLobbyEvent.restoreState(
              user: context.currentUser,
              activeMatch: ActiveMatch(matchId: match.id, tournamentId: match.tournamentId)));
        },
        borderRadius: R.shapes.radius_4,
        child: ClipRRect(
          borderRadius: R.shapes.radius_4,
          child: Column(
            children: [
              UserListTile(
                user: match.user1,
                team: match.team1,
                score: match.user1Score,
                isWinner: match.user1Score != null && match.user1Score! >= (match.user2Score ?? 0),
                walkover: match.walkover,
              ),
              UserListTile(
                user: match.user2,
                team: match.team2,
                score: match.user2Score,
                isWinner: match.user2Score != null && match.user2Score! >= (match.user1Score ?? 0),
                walkover: match.walkover,
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 13),
                color: R.colors.menuBarBackground,
                height: 47,
                child: Row(
                  children: [
                    AppImage(
                      imageSize: const Size(24, 24),
                      image: match.tournament?.logo ?? tournament?.logo ?? '',
                      error: (context) => const Icon(
                        Icons.shield_outlined,
                        color: Colors.white,
                      ),
                      placeholder: (_) => const Icon(
                        Icons.shield_outlined,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            match.tournament?.name ?? tournament?.name ?? '-',
                            style: const TextStyle(color: Colors.white, fontSize: 11),
                            overflow: TextOverflow.fade,
                          ),
                          Text(
                            getFormattedDate(match.inserted, context),
                            style: TextStyle(color: context.theme.colorScheme.secondary, fontSize: 11),
                            overflow: TextOverflow.fade,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  String getFormattedDate(DateTime inserted, BuildContext context) {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final yesterday = DateTime(now.year, now.month, now.day - 1);

    final matchDate = DateTime(inserted.year, inserted.month, inserted.day);

    if (matchDate.isAtSameMomentAs(today)) {
      return context.l10n.todayText;
    } else if (matchDate.isAtSameMomentAs(yesterday)) {
      return context.l10n.yesterdayTextText;
    } else {
      return R.dateSpecifications.localizeMD(match.inserted, context);
    }
  }
}

class UserListTile extends StatelessWidget {
  final UserBasicInfo user;
  final int? score;
  final bool isWinner;
  final TeamRef? team;
  final bool walkover;

  const UserListTile({
    Key? key,
    required this.user,
    this.score,
    this.isWinner = false,
    this.team,
    this.walkover = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final teamsTextStyle = TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w400,
      color: R.colors.inputBoxTextInitiative,
    );
    const size = 35.0;

    final placeholder = Container(
      height: size,
      width: size,
      color: R.colors.circleAvatarColor,
    );

    return InkWell(
      onTap: () {
        if (user.id == context.currentUser.id) {
          Routemaster.of(context).push(R.routeNames.profileSection);
        } else if (user.id != null) {
          Routemaster.of(context).pushWithScope(
            R.routeNames.profileDetailsWithId(user.id!),
            value: user,
          );
        }
      },
      child: Container(
        height: 50,
        padding: const EdgeInsets.symmetric(
          horizontal: 13,
        ),
        child: Row(
          children: [
            ClipOval(
              child: AppImage(
                imageSize: const Size(size, size),
                image: user.avatar ?? '',
                error: (context) => placeholder,
                placeholder: (_) => placeholder,
              ),
            ),
            const SizedBox(
              width: 16,
            ),
            Expanded(
              child: Text(
                user.username,
                style: isWinner
                    ? teamsTextStyle.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                      )
                    : teamsTextStyle,
                overflow: TextOverflow.fade,
              ),
            ),
            AppImage(
              imageSize: const Size(size, size),
              image: team?.logo ?? '',
              error: (context) => const SizedBox.shrink(),
              placeholder: (_) => const SizedBox.shrink(),
            ),
            const SizedBox(
              width: 5,
            ),
            Text(
              walkover
                  ? isWinner
                      ? context.l10n.wo
                      : '-'
                  : (score ?? '-').toString(),
              style: isWinner
                  ? teamsTextStyle.copyWith(
                      color: context.theme.colorScheme.secondary,
                      fontWeight: FontWeight.w500,
                    )
                  : teamsTextStyle,
            ),
          ],
        ),
      ),
    );
  }
}
