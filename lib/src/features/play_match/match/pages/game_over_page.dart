import 'dart:developer';

import 'package:fifa/r.dart';
import 'package:fifa/src/app/dependency_injection.dart';

import 'package:fifa/src/common/extensions.dart';
import 'package:fifa/src/features/match/model/match.dart';
import 'package:fifa/src/features/play_match/lobby/match_lobby_cubit.dart';
import 'package:fifa/src/features/play_match/match/pages/match_lobby_page.dart';
import 'package:fifa/src/features/play_match/match_bloc/match_lobby_bloc.dart';
import 'package:fifa/src/features/tournaments/tournament_details/models/participant.dart';
import 'package:fifa/src/notifications/notification_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:fpdart/fpdart.dart';

class GameOverView extends StatelessWidget {
  final MatchLobbyData matchLobbyData;
  final MatchScores results;

  GameOverView({
    Key? key,
    required this.matchLobbyData,
    required this.results,
  }) : super(key: key);

  Tuple2<TournamentParticipant, int> _winner() {
    if (results.user1Score! > results.user2Score!) {
      if (matchLobbyData.user1.id == results.user1Id) {
        return Tuple2(matchLobbyData.user1, results.user1Score!);
      }
      if (matchLobbyData.user2.id == results.user1Id) {
        return Tuple2(matchLobbyData.user2, results.user1Score!);
      }
    }
    return Tuple2(matchLobbyData.user2, results.user2Score!);
  }

  late final winner = _winner();

  int? get user1ActualScore {
    final user1Id = matchLobbyData.user1.id;
    return _getScoreByUserId(user1Id);
  }

  int? get user2ActualScore {
    final user2Id = matchLobbyData.user2.id;
    return _getScoreByUserId(user2Id);
  }

  int? _getScoreByUserId(int id) {
    if (results.user1Id == id) {
      return results.user1Score;
    } else if (results.user2Id == id) {
      return results.user2Score;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NotificationAppBar(
        onBackPressed: () {
          closeMatch(context);
        },
        title: Text(matchLobbyData.matchInfo.walkover ? context.l10n.fullTimeWalkover : context.l10n.fullTime),
        showBanner: false,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 55),
            OpponentStatusAvatar.fromTournamentParticipant(winner.first),
            const SizedBox(height: 24),
            Text(
              context.l10n.playerWins(winner.first.username),
              style: TextStyles.title.copyWith(color: Theme.of(context).colorScheme.primary, fontSize: 18),
            ),
            const SizedBox(height: 24),
            if (matchLobbyData.matchInfo.walkover)
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    context.l10n.walkover,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    winner.first.id == context.currentUser.id
                        ? context.l10n.yourOpponentDidNotCheckIn
                        : context.l10n.youDidNotCheckIn,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 11,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 24),
                ],
              ),
            SizedBox(
              width: 210,
              child: BackToTournamentButton(
                onPressed: () {
                  closeMatch(context);
                },
              ),
            ),
            const SizedBox(height: 24),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                alignment: Alignment.center,
                height: 100,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: R.colors.cardBackground,
                  borderRadius: R.shapes.radius_4,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // sort winner first
                    if (matchLobbyData.user1.id == winner.first.id) ...[
                      SimplePlayerTile(
                        id: matchLobbyData.user1.id,
                        name: matchLobbyData.user1.username,
                        score: user1ActualScore!,
                        isWinner: matchLobbyData.user1.id == winner.first.id,
                        walkover: matchLobbyData.matchInfo.walkover,
                      ),
                      const SizedBox(height: 20),
                      SimplePlayerTile(
                        id: matchLobbyData.user2.id,
                        name: matchLobbyData.user2.username,
                        score: user2ActualScore!,
                        isWinner: matchLobbyData.user2.id == winner.first.id,
                        walkover: matchLobbyData.matchInfo.walkover,
                      )
                    ] else if (matchLobbyData.user2.id == winner.first.id) ...[
                      SimplePlayerTile(
                        id: matchLobbyData.user2.id,
                        name: matchLobbyData.user2.username,
                        score: user2ActualScore!,
                        isWinner: matchLobbyData.user2.id == winner.first.id,
                        walkover: matchLobbyData.matchInfo.walkover,
                      ),
                      const SizedBox(height: 20),
                      SimplePlayerTile(
                        id: matchLobbyData.user1.id,
                        name: matchLobbyData.user1.username,
                        score: user1ActualScore!,
                        isWinner: matchLobbyData.user1.id == winner.first.id,
                        walkover: matchLobbyData.matchInfo.walkover,
                      ),
                    ],
                  ],
                ),
              ),
            ),
            const SizedBox(height: 40),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TournamentTile(tournament: matchLobbyData.matchInfo.tournament),
            )
          ],
        ),
      ),
    );
  }
}

void closeMatch(BuildContext context) {
  log('closing match');
  while (Navigator.of(context).canPop()) {
    Navigator.of(context).pop();
  }
  getIt<MatchLobbyBloc>().add(const MatchLobbyEvent.close());
  log('match closed');
}

class BackToTournamentButton extends StatelessWidget {
  const BackToTournamentButton({
    Key? key,
    required this.onPressed,
  }) : super(key: key);
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        backgroundColor: R.colors.menuBarBackground,
      ),
      onPressed: onPressed,
      child: Text(
        context.l10n.back,
      ),
    );
  }
}

class SimplePlayerTile extends StatelessWidget {
  final String name;
  final int score;
  final bool isWinner;
  final bool walkover;
  final int id;

  const SimplePlayerTile({
    Key? key,
    required this.id,
    required this.name,
    required this.score,
    this.isWinner = false,
    this.walkover = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          name,
          style: TextStyle(
            color: isWinner ? Colors.white : R.colors.inputBoxTextInitiative,
            fontSize: 14,
            fontWeight: isWinner ? FontWeight.w500 : FontWeight.w400,
          ),
        ),
        Text(
          walkover
              ? isWinner
                  ? context.l10n.wo
                  : '-'
              : score.toString(),
          style: TextStyle(
            color: isWinner ? context.theme.colorScheme.secondary : R.colors.inputBoxTextInitiative,
            fontSize: 18,
            fontWeight: isWinner ? FontWeight.w500 : FontWeight.w400,
          ),
        ),
      ],
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty('walkover', walkover));
  }
}
