import 'dart:developer';
import 'dart:io';

import 'package:fifa/r.dart';
import 'package:fifa/resources/resources.dart';
import 'package:fifa/src/app/dependency_injection.dart';
import 'package:fifa/src/app/keys.dart';
import 'package:fifa/src/common/extensions.dart';
import 'package:fifa/src/common/widgets/custom_form_button.dart';
import 'package:fifa/src/common/widgets/custom_form_field.dart';
import 'package:fifa/src/common/widgets/unveil.dart';
import 'package:fifa/src/features/match/model/match.dart';
import 'package:fifa/src/features/play_match/lobby/match_lobby_cubit.dart';
import 'package:fifa/src/features/play_match/match/dispute/dispute_repository.dart';
import 'package:fifa/src/features/play_match/match/pages/game_over_page.dart';
import 'package:fifa/src/features/play_match/match/pages/match_lobby_page.dart';
import 'package:fifa/src/features/tournaments/tournament_details/models/participant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:fpdart/fpdart.dart' hide State;
import 'package:image_picker/image_picker.dart';

class DisputeScoreDialog extends StatefulWidget {
  const DisputeScoreDialog({Key? key}) : super(key: key);

  @override
  State<DisputeScoreDialog> createState() => _DisputeScoreDialogState();
}

class _DisputeScoreDialogState extends State<DisputeScoreDialog> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            context.l10n.disputeScore,
            style: TextStyles.title.copyWith(
              color: Theme.of(context).colorScheme.primary,
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 15),
          Text(
            context.l10n.disputeInstructions,
            style: TextStyles.title.copyWith(
              fontSize: 14,
            ),
          ),
          const SizedBox(height: 15),
          CustomFormButton(onTap: () {}, buttonText: context.l10n.addEvidence),
          const SizedBox(height: 15),
          const _CancelButton(),
        ],
      ),
    );
  }
}

class DisputeEvidencesDialog extends StatefulWidget {
  const DisputeEvidencesDialog({
    Key? key,
    required this.matchLobbyData,
  }) : super(key: key);

  final MatchLobbyData matchLobbyData;

  @override
  _DisputeEvidencesDialogState createState() => _DisputeEvidencesDialogState();
}

class _DisputeEvidencesDialogState extends State<DisputeEvidencesDialog> {
  late final controller = TextEditingController()..addListener(updateValueNotifier);

  late ValueNotifier<bool> isValidYoutubeUrl = ValueNotifier(
    controller.text.isValidYoutubeUrl,
  );

  void updateValueNotifier() {
    isValidYoutubeUrl.value = controller.text.isValidYoutubeUrl;
  }

  @override
  void dispose() {
    controller.dispose();
    isValidYoutubeUrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      key: Keys.matchDisputeEvidenceDialog,
      content: KeyboardDismissOnTap(
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Unveil(
                show: !context.isKeyboardVisible,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      children: [
                        const Icon(
                          FontAwesomeIcons.solidImage,
                          color: Color(0xFF9E9E9E),
                          size: 25,
                        ),
                        const SizedBox(width: 10),
                        Flexible(
                          child: Text(
                            context.l10n.uploadAPhotoOrVideo,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              fontSize: 14,
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: 20),
                    CustomFormButton(
                      onTap: () {
                        context.navigator.pop(ImageSource.gallery);
                      },
                      buttonText: context.l10n.chooseFromGallery,
                    ),
                    const SizedBox(height: 8),
                    CustomFormButton(
                      onTap: () {
                        context.navigator.pop(ImageSource.camera);
                      },
                      buttonText: context.l10n.chooseFromCamera,
                    ),
                    const SizedBox(height: 30),
                  ],
                ),
              ),
              Row(
                children: [
                  const Icon(
                    FontAwesomeIcons.youtube,
                    color: Color(0xFF9E9E9E),
                    size: 25,
                  ),
                  const SizedBox(width: 10),
                  Flexible(
                    child: Text(
                      context.l10n.pasteAYouTubeLink,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(height: 20),
              CustomFormField(
                key: Keys.matchDisputeEvidenceDialogYoutubeForm,
                hintText: 'https://www.youtube.com/watch?v=??????',
                controller: controller,
              ),
              ValueListenableBuilder<bool>(
                valueListenable: isValidYoutubeUrl,
                builder: (context, isValidYoutubeUrl, _) {
                  return CustomFormButton.loading(
                    onTap: isValidYoutubeUrl ? sendYoutubeEvidence : null,
                    buttonText: context.l10n.send,
                  );
                },
              ),
              const SizedBox(height: 30),
              const _CancelButton(),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> sendYoutubeEvidence() async {
    final response = await getIt<DisputeRepository>().uploadEvidence(
      matchId: widget.matchLobbyData.matchInfo.id,
      youtubeId: getIdFromUrl(controller.text),
    );

    response.fold(
      (error) {
        log(error.toString());

        context.navigator.pop(SendEvidenceResult.error);
      },
      (done) => context.navigator.pop(SendEvidenceResult.done),
    );
  }

  /// to get youtube videos ids form urls
  String? getIdFromUrl(String url) {
    bool _isValidId(String id) => RegExp(r'^[_\-a-zA-Z0-9]{11}$').hasMatch(id);
    if (url.contains(' ')) {
      return null;
    }

    late final Uri uri;
    try {
      uri = Uri.parse(url);
    } catch (e) {
      return null;
    }

    if (!['https', 'http'].contains(uri.scheme)) {
      return null;
    }

    // youtube.com/watch?v=xxxxxxxxxxx
    if (['youtube.com', 'www.youtube.com', 'm.youtube.com'].contains(uri.host) &&
        uri.pathSegments.isNotEmpty &&
        uri.pathSegments.first == 'watch' &&
        uri.queryParameters.containsKey('v')) {
      final videoId = uri.queryParameters['v']!;
      return _isValidId(videoId) ? videoId : null;
    }

    // youtu.be/xxxxxxxxxxx
    if (uri.host == 'youtu.be' && uri.pathSegments.isNotEmpty) {
      final videoId = uri.pathSegments.first;
      return _isValidId(videoId) ? videoId : null;
    }

    return null;
  }
}

enum SendEvidenceResult {
  error,
  done,
}

class DisputeEvidenceWithPhotoDialog extends StatefulWidget {
  const DisputeEvidenceWithPhotoDialog({
    Key? key,
    this.imageFile,
    required this.matchLobbyData,
  }) : super(key: key);

  final File? imageFile;
  final MatchLobbyData matchLobbyData;

  @override
  _DisputeEvidenceWithPhotoDialogState createState() => _DisputeEvidenceWithPhotoDialogState();
}

class _DisputeEvidenceWithPhotoDialogState extends State<DisputeEvidenceWithPhotoDialog> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ColoredBox(
            color: R.colors.bottomMainBarColor,
            child: SizedBox(
              height: 150,
              width: double.infinity,
              child: Image(
                image: FileImage(widget.imageFile ?? File('')),
                fit: BoxFit.cover,
                loadingBuilder: (context, child, loadingProgress) {
                  if ((loadingProgress?.expectedTotalBytes ?? 0) > (loadingProgress?.cumulativeBytesLoaded ?? 0)) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
                      child: Image.asset(Images.appLogo),
                    );
                  }
                  return child;
                },
                frameBuilder: (BuildContext context, Widget child, int? frame, bool wasSynchronouslyLoaded) {
                  if (wasSynchronouslyLoaded) {
                    return child;
                  }
                  return AnimatedOpacity(
                    opacity: frame == null ? 0 : 1,
                    duration: const Duration(seconds: 1),
                    curve: Curves.easeOut,
                    child: child,
                  );
                },
                errorBuilder: (context, error, stackTrace) {
                  return const Center(
                    child: Icon(
                      Icons.image_not_supported_sharp,
                      color: Color(0xFF9E9E9E),
                      size: 40,
                    ),
                  );
                },
              ),
            ),
          ),
          const SizedBox(height: 10),
          CustomFormButton.loading(onTap: uploadImage, buttonText: context.l10n.send),
          const SizedBox(height: 8),
          const _CancelButton(),
        ],
      ),
    );
  }

  Future<void> uploadImage() async {
    final response = await getIt<DisputeRepository>().uploadEvidence(
      matchId: widget.matchLobbyData.matchInfo.id,
      photoPath: widget.imageFile?.path,
    );

    response.fold(
      (error) => context.navigator.pop(SendEvidenceResult.error),
      (done) => context.navigator.pop(SendEvidenceResult.done),
    );
  }
}

class DisputeNotificationDialog extends StatelessWidget {
  final MatchLobbyData matchLobbyData;
  final MatchScores results;

  DisputeNotificationDialog({
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
    final thereWereConflicts = (matchLobbyData.matchInfo.conflicted ?? 0) != 0;

    return Container(
      decoration: BoxDecoration(
        color: R.colors.menuBarBackground,
      ),
      child: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              thereWereConflicts ? context.l10n.matchDisputeOutcome : context.l10n.matchResultTitle,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            OpponentStatusAvatar.fromTournamentParticipant(winner.first),
            const SizedBox(
              height: 13,
            ),
            Text(
              context.l10n.playerWins(winner.first.username),
              style: TextStyles.title.copyWith(
                color: Theme.of(context).colorScheme.primary,
                fontSize: 18,
              ),
            ),
            const SizedBox(
              height: 18,
            ),
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
                    context.l10n.yourOpponentDidNotCheckIn,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 11,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 18),
                ],
              ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: R.colors.cardBackground,
                  borderRadius: R.shapes.radius_4,
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 22),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SimplePlayerTile(
                        id: matchLobbyData.user1.id,
                        name: matchLobbyData.user1.username,
                        score: user1ActualScore!,
                        isWinner: matchLobbyData.user1.id == winner.first.id,
                        walkover: matchLobbyData.matchInfo.walkover,
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      SimplePlayerTile(
                        id: matchLobbyData.user2.id,
                        name: matchLobbyData.user2.username,
                        score: user2ActualScore!,
                        isWinner: matchLobbyData.user2.id == winner.first.id,
                        walkover: matchLobbyData.matchInfo.walkover,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 18,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18),
              child: TournamentTile(
                tournament: matchLobbyData.matchInfo.tournament,
              ),
            ),
            const SizedBox(height: 25),
          ],
        ),
      ),
    );
  }
}

class _CancelButton extends StatelessWidget {
  const _CancelButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        key: Keys.matchDisputeEvidenceDialogCancel,
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.zero,
          fixedSize: Size.fromHeight(R.dimen.fieldsAndButtonsHeight),
          shape: RoundedRectangleBorder(
            borderRadius: R.shapes.radius_4,
          ),
          primary: R.colors.menuBarBackground,
        ),
        onPressed: () {
          context.navigator.pop();
        },
        child: Center(
          child: Text(
            context.l10n.cancel,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 13,
              fontWeight: FontWeight.w600,
            ),
          ),
        ));
  }
}
