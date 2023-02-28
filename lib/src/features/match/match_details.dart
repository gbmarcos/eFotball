import 'package:fifa/r.dart';
import 'package:fifa/src/common/domain/match/match.dart';
import 'package:fifa/src/common/domain/team/team.dart';
import 'package:fifa/src/common/domain/user/user.dart';
import 'package:fifa/src/common/extensions.dart';
import 'package:fifa/src/common/widgets/app_image.dart';
import 'package:fifa/src/features/match/model/match.dart';
import 'package:fifa/src/notifications/notification_app_bar.dart';
import 'package:flutter/material.dart';

class MatchDetails extends StatefulWidget {
  final int team1Score;
  final int team2Score;
  final int gamesCount;
  final OrgMatch? match;

  const MatchDetails({
    Key? key,
    required this.team1Score,
    required this.team2Score,
    required this.gamesCount,
    this.match,
  }) : super(key: key);

  @override
  _MatchDetailsState createState() => _MatchDetailsState();
}

class _MatchDetailsState extends State<MatchDetails> {
  late final pagePadding = const EdgeInsets.symmetric(horizontal: 18);

//Todo make the URL restore friendly

  late final OrgMatch match = widget.match ?? context.fromSacco<OrgMatch>()!;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NotificationAppBar(
        title: Text(context.l10n.matchResultTitle, maxLines: 1),
      ),
      body: ListView(
        padding: pagePadding + const EdgeInsets.only(bottom: 20),
        children: [
          _TeamsScoreWidget(
            team1Score: widget.team1Score,
            team2Score: widget.team2Score,
            match: match,
            gamesCount: widget.gamesCount,
          ),
          _TournamentDataWidget(match: match),
          const SizedBox(height: 17),
          _SubMatchesList(
            matches: match is LatestMatch ? (match as LatestMatch).matches : [],
            team1: match.team1,
            team2: match.team2,
          ),
        ],
      ),
    );
  }
}

class _SubMatchesList extends StatelessWidget {
  final List<LatestMatchMatch> matches;
  final NextMatchTeam team1;
  final NextMatchTeam team2;

  const _SubMatchesList({
    Key? key,
    required this.matches,
    required this.team1,
    required this.team2,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return matches.isEmpty
        ? Align(
            child: Text(
              context.l10n.noMatches,
              style: TextStyle(color: context.theme.colorScheme.secondary),
            ),
          )
        : ListView.builder(

            shrinkWrap: true,
            itemCount: matches.length,
            itemBuilder: (ctx, i) {
              return _LatestMatchMatchCard(
                match: matches[i],
                team1: team1,
                team2: team2,
              );
            });
  }
}

class _LatestMatchMatchCard extends StatelessWidget {
  final LatestMatchMatch match;
  final NextMatchTeam team1;
  final NextMatchTeam team2;

  const _LatestMatchMatchCard({
    Key? key,
    required this.match,
    required this.team1,
    required this.team2,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 10, right: 20, top: 12, bottom: 12),
      margin: const EdgeInsets.only(bottom: 14),
      decoration: BoxDecoration(
        borderRadius: R.shapes.radius_4,
        color: R.colors.cardBackground,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _PlayerListTile(
            user: match.user1,
            isWinner: match.user1.score != null && match.user1.score! >= (match.user2.score ?? 0),
            team: team1,
          ),
          _PlayerListTile(
            user: match.user2,
            isWinner: match.user2.score != null && match.user2.score! >= (match.user1.score ?? 0),
            team: team2,
          ),
        ],
      ),
    );
  }
}

class _PlayerListTile extends StatelessWidget {
  final LatestMatchUser user;
  final NextMatchTeam team;
  final bool isWinner;

  const _PlayerListTile({
    Key? key,
    required this.user,
    required this.isWinner,
    required this.team,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final teamsTextStyle = TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w400,
      color: R.colors.inputBoxTextInitiative,
    );

    return SizedBox(
      height: 40,
      child: Row(
        children: [
          AppImage(
            imageSize: const Size(35, 35),
            image: user.image ?? '',
            error: (context) => Icon(
              Icons.person,
              color: isWinner ? Colors.white : R.colors.inputBoxTextInitiative,
            ),
            placeholder: (_) => Icon(
              Icons.person,
              color: isWinner ? Colors.white : R.colors.inputBoxTextInitiative,
            ),
          ),
          const SizedBox(
            width: 12,
          ),
          Expanded(
            child: Text(
              user.name ?? '-',
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
            imageSize: const Size(28, 28),
            image: team.logo ?? '',
            error: (context) => Icon(
              Icons.shield_outlined,
              color: isWinner ? Colors.white : R.colors.inputBoxTextInitiative,
            ),
            placeholder: (_) => Icon(
              Icons.shield_outlined,
              color: isWinner ? Colors.white : R.colors.inputBoxTextInitiative,
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          Text(
            (user.score ?? '...').toString(),
            style: isWinner
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

class _TournamentDataWidget extends StatelessWidget {
  final OrgMatch match;

  const _TournamentDataWidget({Key? key, required this.match}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: R.shapes.radius_4,
        color: R.colors.tableScoreColor,
      ),
      child: Row(
        children: [
          AppImage(
            imageSize: const Size(40, 40),
            image: match.tournament.logo ?? '',
            error: (context) => const Icon(
              Icons.shield_outlined,
              size: 35,
              color: Colors.white,
            ),
            placeholder: (_) => const Icon(
              Icons.shield_outlined,
              size: 35,
              color: Colors.white,
            ),
          ),
          const SizedBox(
            width: 13,
          ),
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  match.tournament.name ?? '-',
                  style: const TextStyle(color: Colors.white, fontSize: 13),
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
        ],
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

class _TeamsScoreWidget extends StatelessWidget {
  final int team1Score;
  final int team2Score;
  final OrgMatch match;
  final int gamesCount;

  const _TeamsScoreWidget({
    Key? key,
    required this.team1Score,
    required this.team2Score,
    required this.match,
    required this.gamesCount,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Flexible(
            child: _TeamWidget(
              team: match.team1,
              isWinner: team1Score >= team2Score,
            ),
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              _ScoreBoard(
                team1Score: team1Score,
                team2Score: team2Score,
                isANextMatch: match is NextMatch,
              ),
              const SizedBox(height: 13),
              Text(
                '$gamesCount Games',
                style: TextStyle(
                  fontSize: 10,
                  color: context.theme.colorScheme.secondary,
                ),
              ),
            ],
          ),
          Flexible(
            child: _TeamWidget(
              team: match.team2,
              isWinner: team2Score >= team1Score,
            ),
          )
        ],
      ),
    );
  }
}

class _TeamWidget extends StatelessWidget {
  final NextMatchTeam team;
  final bool isWinner;

  const _TeamWidget({
    Key? key,
    required this.team,
    required this.isWinner,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        AppImage(
          imageSize: const Size(75, 75),
          image: team.logo ?? '',
          error: (context) => Icon(
            Icons.shield_outlined,
            size: 65,
            color: isWinner ? Colors.white : R.colors.inputBoxTextInitiative,
          ),
          placeholder: (_) => Icon(
            Icons.shield_outlined,
            size: 65,
            color: isWinner ? Colors.white : R.colors.inputBoxTextInitiative,
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Text(
          team.name ?? '-',
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: isWinner ? Colors.white : R.colors.inputBoxTextInitiative,
          ),
        ),
      ],
    );
  }
}

class _ScoreBoard extends StatelessWidget {
  final int team1Score;
  final int team2Score;
  final bool isANextMatch;

  const _ScoreBoard({
    Key? key,
    required this.team1Score,
    required this.team2Score,
    required this.isANextMatch,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const textStyle = TextStyle(fontSize: 22, fontWeight: FontWeight.w500);

    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: R.shapes.radius_4,
        color: R.colors.gameCountTagBackground,
      ),
      child: Row(
        children: [
          Text(
            '$team1Score',
            style: textStyle.copyWith(
                color: isANextMatch
                    ? Colors.white
                    : team1Score >= team2Score
                        ? context.theme.colorScheme.secondary
                        : R.colors.inputBoxTextInitiative),
          ),
          const SizedBox(width: 8),
          Text(
            '-',
            style: textStyle.copyWith(color: Colors.white),
          ),
          const SizedBox(width: 8),
          Text(
            '$team2Score',
            style: textStyle.copyWith(
                color: isANextMatch
                    ? Colors.white
                    : team2Score >= team1Score
                        ? context.theme.colorScheme.secondary
                        : R.colors.inputBoxTextInitiative),
          ),
        ],
      ),
    );
  }
}
