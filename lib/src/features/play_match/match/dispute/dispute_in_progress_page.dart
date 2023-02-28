import 'dart:io';

import 'package:fifa/r.dart';
import 'package:fifa/src/app/dependency_injection.dart';
import 'package:fifa/src/app/keys.dart';
import 'package:fifa/src/common/dialogs.dart' as snack_bars;
import 'package:fifa/src/common/extensions.dart';
import 'package:fifa/src/common/widgets/app_image.dart';
import 'package:fifa/src/common/widgets/custom_form_button.dart';
import 'package:fifa/src/features/play_match/lobby/match_lobby_cubit.dart';
import 'package:fifa/src/features/play_match/match/dispute/dispute_dialogs.dart';
import 'package:fifa/src/features/play_match/match/dispute/dispute_repository.dart';
import 'package:fifa/src/features/play_match/match/pages/game_over_page.dart';
import 'package:fifa/src/features/play_match/match/pages/match_lobby_page.dart';
import 'package:fifa/src/features/play_match/match/pages/waiting_for_confirmation_page.dart';
import 'package:fifa/src/notifications/notification_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class DisputeInProgressView extends StatelessWidget {
  const DisputeInProgressView({
    Key? key,
    required this.matchLobbyData,
  }) : super(key: key);

  final MatchLobbyData matchLobbyData;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: Keys.matchDisputePage,
      appBar: NotificationAppBar(
        onBackPressed: () {
          closeMatch(context);
        },
        title: Text(context.l10n.disputeInProgress),
        showBanner: false,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 25),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 25),
              InformationBox(message: context.l10n.waitingForDisputeResolution),
              const SizedBox(height: 24),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 35),
                child: Text(
                  context.l10n.youWillBeNotifiedWhen,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              BackToTournamentButton(
                onPressed: () {
                  closeMatch(context);
                },
              ),
              const SizedBox(height: 60),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 35),
                child: Text(
                  context.l10n.disputeInstructions,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(height: 15),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 62),
                child: CustomFormButton(
                    key: Keys.matchDisputePageAddEvidence,
                    onTap: () {
                      uploadEvidence(context);
                    },
                    buttonText: context.l10n.addEvidence),
              ),
              const SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: TournamentTile(tournament: matchLobbyData.matchInfo.tournament),
              ),
              const SizedBox(height: 15),
              if (matchLobbyData.matchInfo.evidence != null) ...[
                Align(
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 14),
                    child: Text(
                      context.l10n.uploadedEvidence,
                      style: TextStyle(
                        color: context.theme.colorScheme.secondary,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
                for (final evidence in matchLobbyData.matchInfo.evidence!.where((element) => element.isValid()))
                  ListTile(
                    onTap: evidence.url == null ? null : () => launch(evidence.url!),
                    leading: evidence.image != null
                        ? SizedBox.square(dimension: 64, child: AppImage(image: evidence.image))
                        : null,
                    title: Text(evidence.title ?? ''),
                    subtitle: Text(context.l10n.uploadedBy(evidence.username)),
                    trailing: Column(
                      children: [
                        Text(R.dateSpecifications.localizeMD(evidence.inserted, context)),
                        Text(R.dateSpecifications.formatHmm(evidence.inserted))
                      ],
                    ),
                  )
              ]
            ],
          ),
        ),
      ),
    );
  }

  Future<void> uploadEvidence(BuildContext context) async {
    final response = await showDialog<Object>(
      context: context,
      builder: (_) => MultiProvider(
        providers: [
          Provider.value(value: getIt<DisputeRepository>()),
        ],
        child: DisputeEvidencesDialog(matchLobbyData: matchLobbyData),
      ),
    );

    if (response is ImageSource) {
      final image = await ImagePicker().pickImage(
        source: response,
      );

      if (image != null) {
        final result = await showDialog<SendEvidenceResult>(
          context: context,
          builder: (_) => MultiProvider(
            providers: [
              Provider.value(value: getIt<DisputeRepository>()),
            ],
            child: DisputeEvidenceWithPhotoDialog(
              imageFile: File.fromUri(Uri.file(image.path)),
              matchLobbyData: matchLobbyData,
            ),
          ),
        );

        if (result is SendEvidenceResult) {
          snack_bars.showCustomMessage(
            message: result == SendEvidenceResult.done
                ? context.l10n.theEvidenceWasUploadedCorrectly
                : context.l10n.errorUploadingEvidence,
            context: context,
          );
        }
      } else {
        snack_bars.showCustomMessage(
          message: context.l10n.errorLoadingImage,
          context: context,
        );
      }
    } else if (response is SendEvidenceResult) {
      snack_bars.showCustomMessage(
        message: response == SendEvidenceResult.done
            ? context.l10n.theEvidenceWasUploadedCorrectly
            : context.l10n.errorUploadingEvidence,
        context: context,
      );
    }
  }
}
