import 'package:fifa/r.dart';
import 'package:fifa/src/common/extensions.dart';
import 'package:fifa/src/features/play_match/lobby/match_lobby_cubit.dart';
import 'package:fifa/src/features/play_match/match/pages/add_match_result_page.dart';
import 'package:fifa/src/features/play_match/match/pages/game_over_page.dart';
import 'package:fifa/src/features/play_match/match/pages/match_lobby_page.dart';
import 'package:fifa/src/notifications/notification_app_bar.dart';
import 'package:flutter/material.dart';

class WaitingForConfirmationView extends StatelessWidget {
  final MatchLobbyData matchLobbyData;
  final int score1;
  final int score2;

  const WaitingForConfirmationView({Key? key, required this.matchLobbyData, required this.score1, required this.score2})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NotificationAppBar(
        onBackPressed: () {
          closeMatch(context);
        },
        title: Text(context.l10n.awaitingConfirmation),
        showBanner: false,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(
              height: 55,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                OpponentStatusAvatar.fromTournamentParticipant(matchLobbyData.user1),
                const SizedBox(width: 35),
                OpponentStatusAvatar.fromTournamentParticipant(matchLobbyData.user2)
              ],
            ),
            const SizedBox(
              height: 25,
            ),
            SizedBox(
              width: 210,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ScoreField.readOnly(label: matchLobbyData.user1.username, value: score1),
                  const Expanded(
                    child: Center(
                      child: Text(
                        ':',
                        style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 24),
                      ),
                    ),
                  ),
                  ScoreField.readOnly(label: matchLobbyData.user2.username, value: score2),
                ],
              ),
            ),
            const SizedBox(height: 18),
            InformationBox(
              message: context.l10n.waitingForConfirmation,
            ),
            const SizedBox(
              height: 40,
            ),
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

class InformationBox extends StatelessWidget {
  const InformationBox({
    Key? key,
    required this.message,
  }) : super(key: key);

  final String message;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Material(
        color: R.colors.menuBarBackground,
        borderRadius: R.shapes.radius_4,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 13),
            child: Text(
              message,
              style: TextStyles.title.copyWith(
                color: Theme.of(context).colorScheme.primary,
                fontSize: 16,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
