import 'package:fifa/r.dart';
import 'package:fifa/src/app/dependency_injection.dart';
import 'package:fifa/src/common/dialogs.dart' as snack_bars;
import 'package:fifa/src/common/extensions.dart';
import 'package:fifa/src/features/match/model/match.dart';
import 'package:fifa/src/features/play_match/lobby/match_lobby_cubit.dart';
import 'package:fifa/src/features/play_match/match/dispute/dispute_repository.dart';
import 'package:fifa/src/features/play_match/match/pages/add_match_result_page.dart';
import 'package:fifa/src/features/play_match/match/pages/game_over_page.dart';
import 'package:fifa/src/features/play_match/match/pages/match_lobby_page.dart';
import 'package:fifa/src/features/play_match/match_bloc/match_lobby_bloc.dart';
import 'package:fifa/src/notifications/notification_app_bar.dart';
import 'package:flutter/material.dart';

class ConfirmResultView extends StatefulWidget {
  final MatchLobbyData matchLobbyData;
  final MatchScores results;

  const ConfirmResultView({Key? key, required this.matchLobbyData, required this.results}) : super(key: key);

  @override
  State<ConfirmResultView> createState() => _ConfirmResultViewState();
}

class _ConfirmResultViewState extends State<ConfirmResultView> {
  late ValueNotifier<bool> startingDispute = ValueNotifier(false);

  int? get user1ActualScore {
    final user1Id = widget.matchLobbyData.user1.id;
    return _getScoreByUserId(user1Id);
  }

  int? get user2ActualScore {
    final user2Id = widget.matchLobbyData.user2.id;
    return _getScoreByUserId(user2Id);
  }

  int? _getScoreByUserId(int id) {
    if (widget.results.user1Id == id) {
      return widget.results.user1Score;
    } else if (widget.results.user2Id == id) {
      return widget.results.user2Score;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NotificationAppBar(
        onBackPressed: () {
          closeMatch(context);
        },
        title: Text(context.l10n.confirmResult),
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
                OpponentStatusAvatar.fromTournamentParticipant(widget.matchLobbyData.user1),
                const SizedBox(width: 35),
                OpponentStatusAvatar.fromTournamentParticipant(widget.matchLobbyData.user2),
              ],
            ),
            const SizedBox(
              height: 25,
            ),
            SizedBox(
              width: 210,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ScoreField.readOnly(
                        value: user1ActualScore,
                        label: widget.matchLobbyData.user1.username,
                      ),
                      const Expanded(
                        child: Center(
                          child: Text(
                            ':',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                              fontSize: 24,
                            ),
                          ),
                        ),
                      ),
                      ScoreField.readOnly(
                        value: user2ActualScore,
                        label: widget.matchLobbyData.user2.username,
                      ),
                    ],
                  ),
                  const SizedBox(height: 18),
                  _OutlinedIconButton(
                    color: const Color(0xFFABF215),
                    icon: Icons.check,
                    onPressed: () {
                      getIt<MatchLobbyBloc>().add(MatchLobbyEvent.acceptScore(
                          matchLobbyData: widget.matchLobbyData, matchScores: widget.results));
                    },
                    label: context.l10n.acceptScore,
                  ),
                  const SizedBox(height: 7),
                  ValueListenableBuilder<bool>(
                      valueListenable: startingDispute,
                      builder: (context, isStartingDispute, _) {
                        return _OutlinedIconButton(
                          onPressed: isStartingDispute
                              ? null
                              : () async {
                                  startingDispute.value = true;

                                  final response = await getIt<DisputeRepository>().disputeScore(
                                    matchId: widget.matchLobbyData.matchInfo.id,
                                  );

                                  response.fold(
                                    (error) {
                                      snack_bars.showNetworkErrorMessage(error: error, context: context);
                                    },
                                    (done) {
                                      getIt<MatchLobbyBloc>().add(MatchLobbyEvent.disputeScore(
                                        matchLobbyData: widget.matchLobbyData,
                                      ));
                                    },
                                  );

                                  startingDispute.value = false;
                                },
                          color: isStartingDispute ? context.theme.disabledColor : const Color(0XFF911D1F),
                          icon: isStartingDispute ? null : Icons.clear,
                          label: isStartingDispute ? context.l10n.startingDispute : context.l10n.disputeScore,
                        );
                      }),
                ],
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TournamentTile(
                tournament: widget.matchLobbyData.matchInfo.tournament,
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _OutlinedIconButton extends StatelessWidget {
  final Color color;
  final IconData? icon;
  final String label;
  final VoidCallback? onPressed;

  const _OutlinedIconButton({
    Key? key,
    required this.color,
    this.icon,
    required this.label,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
          primary: color, side: BorderSide(color: color), backgroundColor: R.colors.menuBarBackground),
      onPressed: onPressed,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (icon == null)
              const SizedBox(
                height: 24,
              ),
            if (icon != null)
              Icon(
                icon,
              ),
            if (icon != null)
              const SizedBox(
                width: 7,
              ),
            Text(
              label,
              style: const TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
