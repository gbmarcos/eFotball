import 'package:async_data_bloc/async_data_bloc.dart';
import 'package:fifa/r.dart';
import 'package:fifa/resources/e_fotball_icons.dart';
import 'package:fifa/src/app/dependency_injection.dart';
import 'package:fifa/src/app/keys.dart';
import 'package:fifa/src/common/domain/tournament/tournament.dart';
import 'package:fifa/src/common/domain/user/user.dart';
import 'package:fifa/src/common/extensions.dart';
import 'package:fifa/src/common/widgets/app_image.dart';
import 'package:fifa/src/common/widgets/components/custom_circle_avatar.dart';
import 'package:fifa/src/common/widgets/custom_form_button.dart';
import 'package:fifa/src/common/widgets/custom_shimmer.dart';
import 'package:fifa/src/common/widgets/stats.dart';
import 'package:fifa/src/common/widgets/text_countdown.dart';
import 'package:fifa/src/features/match/model/match.dart';
import 'package:fifa/src/features/play_match/lobby/match_lobby_cubit.dart';
import 'package:fifa/src/features/play_match/match/pages/game_over_page.dart';
import 'package:fifa/src/features/play_match/match_bloc/match_lobby_bloc.dart';
import 'package:fifa/src/features/tournaments/tournament_details/models/participant.dart';
import 'package:fifa/src/notifications/notification_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

class MatchLobbyPage extends StatefulWidget {
  final LobbyParameters lobbyParameters;
  final MatchLobbyData? matchLobbyData;
  final bool inProgress;

  const MatchLobbyPage({
    Key? key,
    required this.lobbyParameters,
    required this.inProgress,
    this.matchLobbyData,
  }) : super(key: key);

  factory MatchLobbyPage.waitingForOpponent({Key? key, required LobbyParameters lobbyParameters}) =>
      MatchLobbyPage(key: key, lobbyParameters: lobbyParameters, inProgress: false);

  factory MatchLobbyPage.gameInProgress(
          {Key? key, required LobbyParameters lobbyParameters, required MatchLobbyData matchLobbyData}) =>
      MatchLobbyPage(key: key, lobbyParameters: lobbyParameters, matchLobbyData: matchLobbyData, inProgress: true);

  @override
  State<MatchLobbyPage> createState() => _MatchLobbyPageState();
}

class _MatchLobbyPageState extends State<MatchLobbyPage> {
  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (_) => MatchLobbyCubit(
        lobbyParameters: widget.lobbyParameters,
        checkInRepository: getIt(),
        matchRepository: getIt(),
        tournamentRepository: getIt(),
      ),
      child: MatchLobbyView(
        inProgress: widget.inProgress,
        matchLobbyData: widget.matchLobbyData,
      ),
    );
  }
}

class MatchLobbyView extends StatelessWidget {
  final bool inProgress;
  final MatchLobbyData? matchLobbyData;

  const MatchLobbyView({
    Key? key,
    required this.inProgress,
    this.matchLobbyData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<MatchLobbyCubit>();
    final header = !inProgress
        ? cubit.lobbyParameters.walkoverTimeLeft.match(
            (t) => [
              Text(
                context.l10n.waitingForOpponent,
                style: TextStyles.tab.copyWith(color: Colors.white),
              ),
              const SizedBox.square(dimension: 8),
              DefaultTextStyle.merge(style: TextStyles.countdownTimer, child: TextCountDown(duration: t)),
              Text(
                context.l10n.untilWalkover,
                style: TextStyles.listTileTrailing.copyWith(fontSize: 13, color: Colors.white),
              )
            ],
            () => <Widget>[],
          )
        : [
            Text(
              context.l10n.gameInProgress,
              style: TextStyles.tab.copyWith(color: Colors.white),
            ),
            const SizedBox.square(dimension: 8),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50),
              child: CustomFormButton(
                key: Keys.matchInProgressSubmitScoreButton,
                onTap: () {
                  getIt<MatchLobbyBloc>().add(
                    MatchLobbyEvent.goToScoreSubmissionPage(matchLobbyData: matchLobbyData!),
                  );
                },
                buttonText: context.l10n.submitScore,
              ),
            )
          ];
    return Scaffold(
      key: Keys.matchInProgress,
      appBar: NotificationAppBar(
        onBackPressed: () {
          closeMatch(context);
        },
        title: Text(context.l10n.lobby),
        showBanner: false,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 21),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox.square(dimension: 28),
              ...header,
              const SizedBox.square(dimension: 8),
              Row(children: [
                Flexible(
                  child: AsyncCubitBuilder<TournamentParticipant>(
                      bloc: cubit.user1,
                      builder: (_, state) {
                        return state.maybeMap(
                            data: (d) => OpponentCard(participant: d.value),
                            loading: (_) => OpponentCard.loading(context),
                            orElse: () => const SizedBox.shrink());
                      }),
                ),
                const SizedBox.square(dimension: 12),
                Flexible(
                  child: AsyncCubitBuilder<TournamentParticipant>(
                      bloc: cubit.user2,
                      builder: (_, state) {
                        return state.maybeMap(
                            data: (d) => OpponentCard(participant: d.value),
                            loading: (_) => OpponentCard.loading(context),
                            orElse: () => const SizedBox.shrink());
                      }),
                )
              ]),
              const SizedBox.square(dimension: 10),
              // todo refactor , either make the whole cubit be just one async matchlobbydata, or
              AsyncCubitBuilder<TournamentParticipant>(
                bloc: cubit.user1,
                builder: (_, state) {
                  return state.maybeMap(
                    orElse: SizedBox.shrink,
                    loading: (_) => const SizedBox(height: 50, child: CustomShimmer()),
                    data: (_) => AsyncCubitBuilder<TournamentParticipant>(
                      bloc: cubit.user2,
                      builder: (_, state) {
                        return state.maybeMap(
                          orElse: SizedBox.shrink,
                          loading: (_) => const SizedBox(height: 50, child: CustomShimmer()),
                          data: (_) => AsyncCubitBuilder<MatchCheckInInfo>(
                            bloc: cubit.matchInfo,
                            builder: (context, state) {
                              return state.maybeMap(
                                data: (d) {
                                  // //Subscribe to private match as soon as match id is available
                                  // print('eagerly subscribing to private match ');
                                  // bindPrivateMatch(
                                  //     matchLobbyData: cubit.matchLobbyData,
                                  //     context: context);
                                  return TournamentTile(tournament: d.value.tournament);
                                },
                                loading: (_) => const SizedBox(height: 50, child: CustomShimmer()),
                                orElse: () => const SizedBox.shrink(),
                              );
                            },
                          ),
                        );
                      },
                    ),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}

class TournamentTile extends StatelessWidget {
  final TournamentRef tournament;

  const TournamentTile({Key? key, required this.tournament}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: Row(
        children: [
          AppImage(image: tournament.logo ?? tournament.banner),
          const SizedBox.square(dimension: 11),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Flexible(
                  child: Text(
                    R.dateSpecifications.formatDM(DateTime.now()),
                    style: TextStyles.subTitle.copyWith(color: Colors.white),
                  ),
                ),
                const SizedBox.square(dimension: 6),
                Expanded(
                  child: Text(
                    tournament.name,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyles.listTileTitle,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class OpponentCard extends StatelessWidget {
  final TournamentParticipant participant;
  final bool? isCheckedIn;

  const OpponentCard({
    Key? key,
    required this.participant,
    this.isCheckedIn,
  }) : super(key: key);

  static Widget loading(BuildContext context) => AspectRatio(
      aspectRatio: 0.475,
      child: ConstrainedBox(
        constraints: BoxConstraints.tightFor(
          width: (MediaQuery.of(context).size.width * .5).clamp(85, 240),
          height: (MediaQuery.of(context).size.width).clamp(170, 480),
        ),
        child: const CustomShimmer(),
      ));

  @override
  Widget build(BuildContext context) {
    return Provider.value(
      value: participant,
      child: AspectRatio(
        aspectRatio: 0.475,
        child: ConstrainedBox(
          constraints: BoxConstraints.tightFor(
            width: (MediaQuery.of(context).size.width * .5).clamp(85, 240),
            height: (MediaQuery.of(context).size.width).clamp(170, 480),
          ),
          child: Column(
            children: [
              TopStack(
                isCheckedIn: isCheckedIn,
              ),
              AspectRatio(
                aspectRatio: 1,
                child: Container(
                  decoration: BoxDecoration(
                      color: AppBarTheme.of(context).backgroundColor ?? Theme.of(context).cardColor,
                      borderRadius:
                          const BorderRadius.only(bottomLeft: Radius.circular(4), bottomRight: Radius.circular(4))),
                  child: FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          WinRateStat(winRate: participant.winRatio, gap: 22),
                          const SizedBox.square(dimension: 15),
                          PlayedStat(gamesPlayed: participant.matches, gap: 22),
                          const SizedBox.square(dimension: 15),
                          SkillStat(skill: participant.elo, gap: 22),
                        ],
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class TopStack extends StatelessWidget {
  final bool? isCheckedIn;

  const TopStack({Key? key, this.isCheckedIn}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final participant = context.read<TournamentParticipant>();
    return SizedBox(
      height: 160,
      child: Stack(
        alignment: AlignmentDirectional.center,
        children: [
          const SizedBox.expand(),
          Positioned.fill(
            child: Container(
                margin: const EdgeInsets.only(top: 22),
                height: 117,
                width: 106,
                decoration: BoxDecoration(
                    color: Theme.of(context).canvasColor,
                    borderRadius: const BorderRadius.only(topLeft: Radius.circular(4), topRight: Radius.circular(4)))),
          ),
          OpponentStatusAvatar.fromTournamentParticipant(participant),
          Positioned(
              bottom: 12,
              child: Text(
                participant.username,
                style: TextStyles.title.copyWith(color: Theme.of(context).colorScheme.primary),
              ))
        ],
      ),
    );
  }
}

///Custom Avatar Widget that displays a user's avatar, check in status and club
class OpponentStatusAvatar extends StatelessWidget {
  final String? userAvatar;
  final String? teamImage;
  final Console? console;
  final bool? isCheckedIn;

  const OpponentStatusAvatar({
    Key? key,
    required this.userAvatar,
    this.teamImage,
    this.isCheckedIn,
    this.console,
  }) : super(key: key);

  factory OpponentStatusAvatar.fromTournamentParticipant(TournamentParticipant participant, [Console? console]) =>
      OpponentStatusAvatar(
        userAvatar: participant.avatar,
        console: console ?? participant.console,
        teamImage: participant.team?.logo,
      );

  double get avatarRadius => 48;

  double get statusRadius => 14;

  double get teamRadius => 20;

  Widget? checkInWidget(bool? _isCheckedIn) {
    if (_isCheckedIn != null) {
      if (_isCheckedIn) {
        return const Icon(
          EFotball.check,
          color: Color(0xFFB4FF14),
          size: 16,
        );
      }
      return const Icon(
        EFotball.clock,
        color: Color(0xFFD41A1A),
        size: 16,
      );
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    final userImageProvider = userAvatar != null ? AppImage.provider(url: userAvatar!) : null;
    final cardColor = Theme.of(context).cardColor;
    final teamImageProvider = teamImage != null ? AppImage.provider(url: teamImage!) : null;
    return Align(
      alignment: Alignment.topCenter,
      child: SizedBox(
          height: 117,
          width: 106,
          child: Stack(children: [
            Positioned(
                top: 15,
                child: CustomCircleAvatar(
                  radius: avatarRadius,
                  backgroundImage: userImageProvider,
                )),
            if (isCheckedIn != null)
              Positioned(
                  top: 0,
                  left: avatarRadius - statusRadius,
                  child: CircleAvatar(
                    radius: statusRadius,
                    backgroundColor: cardColor,
                    child: checkInWidget(isCheckedIn),
                  )),
            Positioned(
                bottom: 0,
                right: 0,
                child: CircleAvatar(
                  radius: teamRadius,
                  backgroundColor: cardColor,
                  backgroundImage: teamImageProvider,
                  child: (console != null && teamImage == null) ? Icon(console.icon) : null,
                )),
          ])),
    );
  }
}
