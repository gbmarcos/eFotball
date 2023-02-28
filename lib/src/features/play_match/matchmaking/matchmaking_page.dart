import 'dart:async';
import 'dart:developer';

import 'package:async_data_bloc/async_data_bloc.dart';
import 'package:fifa/resources/resources.dart';
import 'package:fifa/src/app/dependency_injection.dart';
import 'package:fifa/src/common/domain/match/match.dart';

import 'package:fifa/src/common/domain/tournament/tournament.dart';
import 'package:fifa/src/common/exceptions.dart';
import 'package:fifa/src/common/extensions.dart';
import 'package:fifa/src/common/utils.dart';
import 'package:fifa/src/common/widgets/custom_shimmer.dart';
import 'package:fifa/src/features/match/active_match_bloc/active_match_bloc.dart';
import 'package:fifa/src/features/match/match_repository.dart';
import 'package:fifa/src/features/match/model/match.dart';
import 'package:fifa/src/features/play_match/lobby/match_lobby_cubit.dart';
import 'package:fifa/src/features/play_match/match/check_in_repository.dart';
import 'package:fifa/src/features/play_match/match/pages/game_over_page.dart';
import 'package:fifa/src/features/play_match/match/pages/match_lobby_page.dart';
import 'package:fifa/src/features/play_match/match_bloc/match_lobby_bloc.dart';
import 'package:fifa/src/features/play_match/matchmaking/matchmaking_cubit.dart';
import 'package:fifa/src/features/tournaments/tournament_details/models/participant.dart';
import 'package:fifa/src/features/tournaments/tournament_repository.dart';
import 'package:fifa/src/common/domain/user/user.dart';
import 'package:fifa/src/notifications/notification_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fpdart/fpdart.dart' hide State;

class MatchmakingPage extends StatefulWidget {
  final int tournamentId;

  const MatchmakingPage({
    Key? key,
    required this.tournamentId,
  }) : super(key: key);

  @override
  State<MatchmakingPage> createState() => _MatchmakingPageState();
}

class _MatchmakingPageState extends State<MatchmakingPage> {
  late final checkInRepository = getIt<CheckInRepository>();

  late Timer keepAliveTimer;
  late Timer queueCountTimer;

  late ValueNotifier<int> queueCountValueNotifier = ValueNotifier(1);
  int pollCounter = 0;

  @override
  void initState() {
    super.initState();
    initTimers();
  }

  void initTimers() {
    keepAliveTimer = Timer.periodic(const Duration(seconds: 2), (timer) async {
      log('matchmakingKeepAlive function called');

      final response = await getIt<CheckInRepository>().matchmakingKeepAlive(
        tournamentId: widget.tournamentId,
      );

      await response.fold(
        (error) async {
          log(error.toString());

          log('matchmakingEnter function called');

          final response = await checkInRepository.matchmakingEnter(
            tournamentId: widget.tournamentId,
          );

          response.fold(
            (error) => log(error.toString()),
            (r) {},
          );
        },
        (r) => null,
      );
    });

    queueCountTimer = Timer.periodic(const Duration(seconds: 6), (timer) async {
      log('matchmakingQueueCount function called');

      final response = await getIt<CheckInRepository>().matchmakingQueueCount(
        tournamentId: widget.tournamentId,
        poolCount: pollCounter,
      );

      response.fold(
        (error) => log(error.toString()),
        (queueCount) {
          log('queueCount got');

          queueCountValueNotifier.value = queueCount;
          pollCounter++;
        },
      );
    });
  }

  @override
  void dispose() {
    keepAliveTimer.cancel();
    queueCountTimer.cancel();
    tryLeaveMatchmaking();
    super.dispose();
  }

  Future tryLeaveMatchmaking() async {
    log('matchmakingLeave function called');

    (await checkInRepository.matchmakingLeave(
      tournamentId: widget.tournamentId,
    ))
        .fold(
      (error) => log(error.toString()),
      (r) => null,
    );
  }

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (_) => MatchmakingCubit(
        userId: context.currentUser.id,
        tournamentRepository: getIt(),
        tournamentId: widget.tournamentId,
      ),
      child: BlocListener<ActiveMatchBloc, ActiveMatchState>(
        bloc: getIt(),
        listener: (context, state) async {
          final activeMatch = state.activeMatches.lastOrNull;
          final user = context.currentUser;
          if (activeMatch != null && activeMatch.tournamentId == widget.tournamentId) {
            try {
              final matchLobbyData = await getMatchLobbyData(activeMatch, user);

              getIt<MatchLobbyBloc>().add(
                MatchLobbyEvent.goToScoreSubmissionPage(
                  matchLobbyData: matchLobbyData,
                ),
              );
              await tryLeaveMatchmaking();
            } catch (e, st) {
              log('error getting matchLobbyData', error: e, stackTrace: st);
            }
          }
        },
        child: MatchmakingView(queueCountValueNotifier),
      ),
    );
  }

  Future<MatchLobbyData> getMatchLobbyData(ActiveMatch activeMatch, User user) async {
    final _matchRepository = getIt<MatchRepository>();
    final _tournamentRepository = getIt<TournamentRepository>();

    final restoreData = await Future.wait([
      _matchRepository.get(matchId: activeMatch.matchId),
      _tournamentRepository.getTournamentParticipant(
        tournamentId: activeMatch.tournamentId,
        userId: user.id,
      ),
    ]);
    final match = getOrThrow(restoreData[0] as Either<NetworkException, MatchCheckInInfo>);
    late final TournamentParticipant participant;
    late final TournamentParticipant opponent;

    if (user.id != match.user1.id && user.id != match.user2.id) {
      participant = getOrThrow(
        await _tournamentRepository.getTournamentParticipant(
          tournamentId: activeMatch.tournamentId,
          userId: match.user1.id!,
        ),
      );
      opponent = getOrThrow(
        await _tournamentRepository.getTournamentParticipant(
          userId: match.user2.id!,
          tournamentId: activeMatch.tournamentId,
        ),
      );
    } else {
      participant = getOrThrow(restoreData[1] as Either<NetworkException, TournamentParticipant>);
      final opponentId = match.user1.id == user.id ? match.user2.id! : match.user1.id!;
      opponent = getOrThrow(
        await _tournamentRepository.getTournamentParticipant(
          userId: opponentId,
          tournamentId: activeMatch.tournamentId,
        ),
      );
    }

    final matchLobbyData = MatchLobbyData(matchInfo: match, user1: participant, user2: opponent);
    return matchLobbyData;
  }
}

class MatchmakingView extends StatelessWidget {
  const MatchmakingView(this.queueCountValueNotifier, {Key? key}) : super(key: key);

  final ValueNotifier<int> queueCountValueNotifier;

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<MatchmakingCubit>();

    return Scaffold(
      appBar: NotificationAppBar(
        onBackPressed: () {
          closeMatch(context);
        },
        title: Text(context.l10n.matchmaking),
        showBanner: false,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 21),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox.square(dimension: 28),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Flexible(
                    child: AsyncCubitBuilder<TournamentParticipant>(
                      bloc: cubit.user,
                      builder: (_, state) {
                        return state.maybeMap(
                          data: (d) => OpponentCard(
                            participant: d.value,
                            isCheckedIn: true,
                          ),
                          loading: (_) => OpponentCard.loading(context),
                          orElse: () => const SizedBox.shrink(),
                        );
                      },
                    ),
                  ),
                  const SizedBox.square(dimension: 12),
                  Flexible(
                    child: MatchmakingCard(queueCountValueNotifier),
                  ),
                ],
              ),
              const SizedBox.square(dimension: 10),
              AsyncCubitBuilder<TournamentRef>(
                bloc: cubit.tournament,
                builder: (context, state) {
                  return state.maybeMap(
                    data: (d) => TournamentTile(tournament: d.value),
                    loading: (_) => const SizedBox(height: 50, child: CustomShimmer()),
                    orElse: () => const SizedBox.shrink(),
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

class MatchmakingCard extends StatelessWidget {
  const MatchmakingCard(
    this.queueCountValueNotifier, {
    Key? key,
  }) : super(key: key);

  final ValueNotifier<int> queueCountValueNotifier;

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
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
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(4),
                        topRight: Radius.circular(4),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 12,
                  child: SizedBox(
                    width: 106,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Stack(
                          alignment: Alignment.center,
                          children: [
                            ClipOval(
                              child: ColoredBox(
                                color: Theme.of(context).canvasColor,
                                child: SizedBox.fromSize(
                                  size: const Size.fromRadius(48),
                                  child: const CircularProgressIndicator(
                                    strokeWidth: 8,
                                  ),
                                ),
                              ),
                            ),
                            ImageIcon(
                              const AssetImage(Images.matchmaking),
                              color: context.theme.colorScheme.secondary,
                              size: 50,
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Text(
                          context.l10n.searchingForOpponent,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 15,
            ),
            child: ValueListenableBuilder<int>(
              valueListenable: queueCountValueNotifier,
              builder: (context, value, child) {
                return RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: value.toString(),
                        style: TextStyle(color: context.theme.colorScheme.secondary),
                      ),
                      TextSpan(text: ' ${context.l10n.playersOnline}'),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
