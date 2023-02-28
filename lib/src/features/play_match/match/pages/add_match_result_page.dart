import 'package:fifa/r.dart';
import 'package:fifa/src/app/dependency_injection.dart';
import 'package:fifa/src/app/keys.dart';
import 'package:fifa/src/common/extensions.dart';
import 'package:fifa/src/common/widgets/custom_form_button.dart';
import 'package:fifa/src/features/play_match/lobby/match_lobby_cubit.dart';
import 'package:fifa/src/features/play_match/match/pages/game_over_page.dart';
import 'package:fifa/src/features/play_match/match/pages/match_lobby_page.dart';
import 'package:fifa/src/features/play_match/match_bloc/match_lobby_bloc.dart';
import 'package:fifa/src/notifications/notification_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AddResultsView extends StatefulWidget {
  final MatchLobbyData matchLobbyData;

  const AddResultsView({Key? key, required this.matchLobbyData}) : super(key: key);

  @override
  State<AddResultsView> createState() => _AddResultsViewState();
}

class _AddResultsViewState extends State<AddResultsView> {
  late final user1ScoreController = TextEditingController();
  late final user2ScoreController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    user1ScoreController.dispose();
    user2ScoreController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: Keys.matchAddResult,
      appBar: NotificationAppBar(
        onBackPressed: () {
          closeMatch(context);
        },
        title: Text(context.l10n.addResult),
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
                const SizedBox(
                  width: 35,
                ),
                OpponentStatusAvatar.fromTournamentParticipant(widget.matchLobbyData.user2)
              ],
            ),
            const SizedBox(height: 25),
            SizedBox(
              width: 210,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ScoreField(
                        label: widget.matchLobbyData.user1.username,
                        controller: user1ScoreController,
                      ),
                      const Expanded(
                        child: Center(
                          child: Text(
                            ':',
                            style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 24),
                          ),
                        ),
                      ),
                      ScoreField(
                        label: widget.matchLobbyData.user2.username,
                        controller: user2ScoreController,
                      ),
                    ],
                  ),
                  const SizedBox(height: 18),
                  CustomFormButton(
                    onTap: () {
                      getIt<MatchLobbyBloc>().add(MatchLobbyEvent.submitScore(
                          matchLobbyData: widget.matchLobbyData,
                          score1: int.parse(user1ScoreController.text),
                          score2: int.parse(user2ScoreController.text)));
                    },
                    buttonText: context.l10n.submitScore,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TournamentTile(tournament: widget.matchLobbyData.matchInfo.tournament),
            )
          ],
        ),
      ),
    );
  }
}

class ScoreField extends StatelessWidget {
  final int? value;
  final TextEditingController controller;
  final bool readOnly;
  final String label;

  const ScoreField({
    Key? key,
    required this.controller,
    required this.label,
  })  : value = null,
        readOnly = false,
        super(key: key);

  ScoreField.readOnly({
    Key? key,
    required this.value,
    required this.label,
  })  : controller = TextEditingController(text: value.toString()),
        readOnly = true,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    final borderColor = readOnly ? R.colors.cardBackground : context.theme.colorScheme.secondary;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          label,
          style: TextStyles.title.copyWith(color: Theme.of(context).colorScheme.primary),
        ),
        const SizedBox(
          height: 10,
        ),
        SizedBox(
          width: 62,
          child: TextField(
            readOnly: readOnly,
            controller: controller,
            keyboardType: TextInputType.number,
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            maxLength: 3,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w600,
              fontSize: 24,
            ),
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.symmetric(vertical: 12),
              counter: const SizedBox(),
              fillColor: R.colors.cardBackground,
              border: OutlineInputBorder(
                borderRadius: R.shapes.radius_4,
                borderSide: BorderSide(
                  color: borderColor,
                ),
              ),
              disabledBorder: OutlineInputBorder(
                borderRadius: R.shapes.radius_4,
                borderSide: BorderSide(
                  color: borderColor,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: R.shapes.radius_4,
                borderSide: BorderSide(
                  color: borderColor,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: R.shapes.radius_4,
                borderSide: BorderSide(
                  color: borderColor,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
