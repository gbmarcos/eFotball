import 'dart:developer';

import 'package:async_data_bloc/async_data_bloc.dart';
import 'package:fifa/r.dart';
import 'package:fifa/src/app/dependency_injection.dart';
import 'package:fifa/src/common/dialogs.dart' as snack_bars;
import 'package:fifa/src/common/domain/tournament/tournament.dart';
import 'package:fifa/src/common/domain/user/user.dart';
import 'package:fifa/src/common/exceptions.dart';
import 'package:fifa/src/common/extensions.dart';
import 'package:fifa/src/common/widgets/app_image.dart';
import 'package:fifa/src/common/widgets/custom_form_button.dart';
import 'package:fifa/src/common/widgets/exception_widget.dart';
import 'package:fifa/src/features/login/signup/utils/extensions.dart';
import 'package:fifa/src/features/match/matches_list.dart';
import 'package:fifa/src/features/streams/stream_page.dart';
import 'package:fifa/src/features/tournaments/collection/model/tournament_collection.dart';
import 'package:fifa/src/features/tournaments/model/tournament.dart';
import 'package:fifa/src/features/tournaments/tournament_details/collection/tournament_collection_page_cubit.dart';
import 'package:fifa/src/features/tournaments/tournament_details/models/participant.dart';
import 'package:fifa/src/features/tournaments/tournament_details/tournament_page.dart';
import 'package:fifa/src/notifications/data/notification.dart';
import 'package:fifa/src/notifications/notification_app_bar.dart';
import 'package:fifa/src/notifications/notification_cubit/notification_cubit.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'package:fifa/src/features/streams/model/stream.dart';

class TournamentCollectionPage extends StatelessWidget {
  final int tournamentId;

  const TournamentCollectionPage({Key? key, required this.tournamentId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (context) => TournamentCollectionPageCubit(
        tournamentId: tournamentId,
        tournamentCollectionRepository: getIt(),
        streamRepository: getIt(),
        tournamentRepository: getIt(),
        //TournamentRepository is provided in HomeTabView
        matchRepository: getIt(),
        //MatchRepository is provided in HomeTabView
        checkInRepository: getIt(), //CheckInRepository is provided in HomeTabView
      ),
      child: Builder(
        builder: (context) {
          return AsyncCubitBuilder<TournamentCollection>(
            bloc: context.read<TournamentCollectionPageCubit>().tournamentCollection,
            builder: (_, participantsState) {
              return participantsState.maybeMap(
                orElse: () => const SizedBox.shrink(),
                loading: (_) => const Center(child: CircularProgressIndicator.adaptive()),
                error: (e) => const NetworkExceptionWidget(),
                data: (selectedTournament) {
                  return TournamentCollectionView(
                    selectedTournamentCollection: selectedTournament.value,
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}

class TournamentCollectionView extends StatefulWidget {
  const TournamentCollectionView({
    Key? key,
    required this.selectedTournamentCollection,
  }) : super(key: key);

  final TournamentCollection selectedTournamentCollection;

  @override
  State<TournamentCollectionView> createState() => _TournamentCollectionViewState();
}

class _TournamentCollectionViewState extends State<TournamentCollectionView> with TickerProviderStateMixin {
  late final controller = ScrollController();

  late final TabController tabController = TabController(length: 3, vsync: this)
    ..addListener(
      () {
        setState(() {});
      },
    );

  late final TabController subTabController = TabController(
    length: 3,
    vsync: this,
  )..addListener(
      () {
        setState(() {});
      },
    );

  late ValueNotifier<int?> selectedStageId = ValueNotifier(
    null,
  );

  late final pagePadding = const EdgeInsets.symmetric(horizontal: 17);
  late final _duration = const Duration(milliseconds: 200);

  @override
  void dispose() {
    controller.dispose();
    tabController.dispose();
    subTabController.dispose();
    selectedStageId.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final pageState = context.read<TournamentCollectionPageCubit>();

    return BlocListener<NotificationCubit, NotificationState>(
      listenWhen: (previous, current) {
        final diff=!const DeepCollectionEquality.unordered().equals(previous.notifications, current.notifications);
        print('Are they different$diff');

        return  diff;
      },
      listener: (context, state) {
        final data = (state.notifications.first.data is Map<String, dynamic>)
            ? state.notifications.first.data as Map<String, dynamic>
            : <String, dynamic>{};

        //if the notification is related to the selected tournament
        if (data['id'] == widget.selectedTournamentCollection.id) {
          switch (state.notifications.first.type) {
            case NotificationType.tournamentJoinRequestAccepted:
              {
                snack_bars.showCustomMessage(
                  context: context,
                  message: context.l10n.yourTournamentJoinRequestWasAccepted,
                );
                pageState.collectionSignUpStatus.refresh();
              }
              break;
            case NotificationType.tournamentJoinRequestDeclined:
              {
                snack_bars.showCustomMessage(
                  context: context,
                  message: context.l10n.yourTournamentJoinRequestWasDeclined,
                );
                pageState.collectionSignUpStatus.refresh();
              }
              break;
            default:
          }
        }
      },
      bloc: getIt<NotificationCubit>(),
      child: Scaffold(
        appBar: NotificationAppBar(title: Text(context.l10n.tournamentsLabel)),
        extendBodyBehindAppBar: true,
        body: AsyncCubitBuilder<TournamentCollection>(
          bloc: pageState.tournamentCollection,
          builder: (_, state) {
            return state.maybeMap(
              data: (tournament) {
                final statusBarHeight = MediaQuery.of(context).padding.top;

                return Padding(
                  padding: EdgeInsets.only(top: statusBarHeight),
                  child: ListView(
                    padding: EdgeInsets.zero,
                    children: [
                      TournamentPageHeader(
                        statusBarHeight: statusBarHeight,
                        tournament: tournament.value,
                        expanded: tabController.index == 0,
                        duration: _duration,
                      ),
                      Padding(
                        padding: pagePadding,
                        child: NavigationTab(
                          duration: _duration,
                          tabController: tabController,
                          subTabController: subTabController,
                        ),
                      ),
                      AnimatedSwitcher(
                        duration: _duration,
                        layoutBuilder: (currentChild, previousChildren) {
                          return Stack(
                            alignment: Alignment.topCenter,
                            children: <Widget>[
                              ...previousChildren,
                              if (currentChild != null) currentChild,
                            ],
                          );
                        },
                        child: _TournamentTabView(
                          //to change to be recognized by AnimatedSwitcher
                          key: ValueKey('${tabController.index}${subTabController.index}'),
                          tournament: tournament.value,
                          tabController: tabController,
                          subTabController: subTabController,
                          duration: _duration,
                          selectedStageId: selectedStageId,
                        ),
                      ),
                    ],
                  ),
                );
              },
              loading: (_) => const Center(child: CircularProgressIndicator.adaptive()),
              error: (e) {
                const padding = EdgeInsets.only(top: 20);
                final error = e.error;
                if (error is NetworkException) {
                  return SafeArea(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: error.map(
                        (value) => NetworkExceptionWidget(
                          padding: padding,
                          refresh: pageState.tournamentCollection.refresh,
                        ),
                        noDataException: (value) => NoElementsExceptionWidget(
                          text: context.l10n.noInformation,
                          padding: padding,
                          refresh: pageState.tournamentCollection.refresh,
                        ),
                      ),
                    ),
                  );
                } else {
                  if (kReleaseMode) {
                    Sentry.captureException(error, stackTrace: e.stackTrace);
                  } else {
                    log('${e.stackTrace}');
                    log('${e.error}');
                  }

                  return SafeArea(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: UnexpectedExceptionWidget(
                        refresh: pageState.tournamentCollection.refresh,
                      ),
                    ),
                  );
                }
              },
              orElse: () => const SizedBox.shrink(),
            );
          },
        ),
      ),
    );
  }
}

class _TournamentTabView extends StatelessWidget {
  const _TournamentTabView({
    Key? key,
    required this.tabController,
    required this.subTabController,
    required this.tournament,
    required this.duration,
    required this.selectedStageId,
  }) : super(key: key);

  final TabController tabController;
  final TabController subTabController;
  final TournamentCollection tournament;
  final Duration duration;
  final ValueNotifier<int?> selectedStageId;

  @override
  Widget build(BuildContext context) {
    final tabIndex = tabController.index;
    final subTabIndex = subTabController.index;

    if (tabIndex == 0) return DescriptionView(tournament: tournament);
    if (tabIndex == 1 && subTabIndex == 0) {
      return _TournamentLatestMatchesView(
        tournament: tournament,
        duration: duration,
        selectedStageId: selectedStageId,
      );
    }
    if (tabIndex == 1 && subTabIndex == 1) {
      return _TournamentResultsView(
        tournament: tournament,
        duration: duration,
        selectedStageId: selectedStageId,
      );
    }

    if (tabIndex == 1 && subTabIndex == 2) {
      return const _TournamentStatsView();
    }

    if (tabIndex == 2) return const _TournamentCollectionStreamsView();

    return const UnderConstruction();
  }
}

class _TournamentResultsView extends StatelessWidget {
  const _TournamentResultsView({
    Key? key,
    required this.tournament,
    required this.duration,
    required this.selectedStageId,
  }) : super(key: key);

  final TournamentCollection tournament;
  final Duration duration;
  final ValueNotifier<int?> selectedStageId;

  @override
  Widget build(BuildContext context) {
    final pageState = context.read<TournamentCollectionPageCubit>();
    const pagePadding = EdgeInsets.symmetric(horizontal: 17);

    return MediaQuery.removePadding(
      removeTop: true,
      context: context,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(
            height: 26,
          ),
          //here two nested elements are used to form a single information from their values
          AsyncCubitBuilder<TournamentCollectionBracketResponse>(
            bloc: pageState.bracketsForEachTournament,
            builder: (_, bracketsState) {
              return bracketsState.maybeMap(
                orElse: () => const SizedBox.shrink(),
                loading: (_) => const Center(child: CircularProgressIndicator.adaptive()),
                error: (e) {
                  final error = e.error;
                  if (error is NetworkException) {
                    return SafeArea(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: error.map(
                          (value) => NetworkExceptionWidget(
                            refresh: pageState.bracketsForEachTournament.refresh,
                          ),
                          noDataException: (value) => NoElementsExceptionWidget(
                            text: context.l10n.noInformation,
                            refresh: pageState.bracketsForEachTournament.refresh,
                          ),
                        ),
                      ),
                    );
                  } else {
                    if (kReleaseMode) {
                      Sentry.captureException(error, stackTrace: e.stackTrace);
                    } else {
                      log('${e.stackTrace}');
                      log('${e.error}');
                    }

                    return SafeArea(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: UnexpectedExceptionWidget(
                          refresh: pageState.bracketsForEachTournament.refresh,
                        ),
                      ),
                    );
                  }
                },
                data: (brackets) {
                  return AsyncCubitBuilder<List<TournamentCollectionParticipant>>(
                    bloc: pageState.tournamentParticipants,
                    builder: (_, participantsState) {
                      return participantsState.maybeMap(
                        orElse: () => const SizedBox.shrink(),
                        loading: (_) => const Center(child: CircularProgressIndicator.adaptive()),
                        error: (e) {
                          final error = e.error;
                          if (error is NetworkException) {
                            return SafeArea(
                              child: Padding(
                                padding: const EdgeInsets.only(top: 20),
                                child: error.map(
                                  (value) => NetworkExceptionWidget(
                                    refresh: pageState.tournamentParticipants.refresh,
                                  ),
                                  noDataException: (value) => NoElementsExceptionWidget(
                                    text: context.l10n.noInformation,
                                    refresh: pageState.tournamentParticipants.refresh,
                                  ),
                                ),
                              ),
                            );
                          } else {
                            if (kReleaseMode) {
                              Sentry.captureException(error, stackTrace: e.stackTrace);
                            } else {
                              log('${e.stackTrace}');
                              log('${e.error}');
                            }

                            return SafeArea(
                              child: Padding(
                                padding: const EdgeInsets.only(top: 20),
                                child: UnexpectedExceptionWidget(
                                  refresh: pageState.tournamentParticipants.refresh,
                                ),
                              ),
                            );
                          }
                        },
                        data: (participants) {
                          selectedStageId.value = selectedStageId.value ?? brackets.value.keys.first;

                          return Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 17),
                                child: DropdownButtonFormField<int>(
                                  isExpanded: true,
                                  value: selectedStageId.value ?? brackets.value.keys.first,
                                  decoration: const InputDecoration(
                                    contentPadding: EdgeInsets.symmetric(horizontal: 15),
                                  ),
                                  onChanged: (int? value) {
                                    if (value != null) {
                                      selectedStageId.value = value;
                                    }
                                  },
                                  items: brackets.value.keys.map<DropdownMenuItem<int>>(
                                    (int selectedId) {
                                      final dropdownText = tournament.stages
                                              ?.toList()
                                              .firstWhereOrNull(
                                                (stage) => stage.id == selectedId,
                                              )
                                              ?.name ??
                                          '-';

                                      return DropdownMenuItem<int>(
                                        value: selectedId,
                                        child: Text(
                                          dropdownText,
                                          overflow: TextOverflow.fade,
                                          softWrap: false,
                                        ),
                                      );
                                    },
                                  ).toList(),
                                ),
                              ),
                              _ResultContent(
                                selectedStageId: selectedStageId,
                                duration: duration,
                                pagePadding: pagePadding,
                                bracketsMap: brackets.value,
                                allParticipant: participants.value,
                              ),
                            ],
                          );
                        },
                      );
                    },
                  );
                },
              );
            },
          ),
        ],
      ),
    );
  }
}

class _ResultContent extends StatelessWidget {
  const _ResultContent({
    Key? key,
    required this.selectedStageId,
    required this.duration,
    required this.pagePadding,
    required this.bracketsMap,
    required this.allParticipant,
  }) : super(key: key);

  final ValueNotifier<int?> selectedStageId;
  final Duration duration;
  final EdgeInsets pagePadding;
  final TournamentCollectionBracketResponse bracketsMap;
  final List<TournamentCollectionParticipant> allParticipant;

  @override
  Widget build(BuildContext context) {
    final pageState = context.read<TournamentCollectionPageCubit>();

    return ValueListenableBuilder<int?>(
      valueListenable: selectedStageId,
      builder: (context, int? selectedTournamentId, _) {
        // to get the brackets of the selected stage
        final selectedBracket = bracketsMap[selectedTournamentId];

        final listEmpty = selectedBracket.isNullOrEmptyList;

        // to get the round's number
        final rounds = selectedBracket?.map((bracket) => bracket.round).toSet();

        //sort and filter the participants of the selected stage
        final sortedParticipants = allParticipant.sorted((a, b) => b.wins.compareTo(a.wins));

        final selectedParticipants = sortedParticipants
            .where((participant) => participant.tournamentStats[selectedTournamentId] != null)
            .toList();
        final isSingleElimination = pageState.tournamentCollection.state.valueOrNull?.stages
                ?.firstWhere((element) => element.id == selectedStageId.value)
                .format ==
            TournamentFormat.singleElimination.index;

        return AnimatedSwitcher(
          duration: duration,
          layoutBuilder: (currentChild, previousChildren) {
            return Stack(
              alignment: Alignment.topCenter,
              children: <Widget>[
                ...previousChildren,
                if (currentChild != null) currentChild,
              ],
            );
          },
          child: Padding(
            //to animate change with the AnimatedSwitcher.
            key: ValueKey<dynamic>(selectedTournamentId),
            padding: const EdgeInsets.symmetric(vertical: 30),
            child: listEmpty
                ? NoElementsExceptionWidget(
                    text: context.l10n.noInformation,
                    refresh: pageState.bracketsForEachTournament.refresh,
                  )
                : isSingleElimination
                    ? SingleEliminationResults(
                        brackets: selectedBracket!,
                        rounds: selectedBracket.map((bracket) => bracket.round).toSet(),
                        participants: selectedParticipants,
                      )
                    : Column(
                        children: [
                          Padding(
                            padding: pagePadding,
                            child: ListView.separated(
                              shrinkWrap: true,
                              itemBuilder: (context, index) {
                                final round = rounds!.elementAt(index);

                                return RoundsResults(
                                  brackets: selectedBracket!.where((bracket) => bracket.round == round).toList(),
                                  participants: allParticipant,
                                  round: round,
                                );
                              },
                              separatorBuilder: (context, index) => const SizedBox(
                                height: 30,
                              ),
                              itemCount: rounds!.length,
                            ),
                          ),
                          if (selectedParticipants.isNotEmpty)
                            const SizedBox(
                              height: 30,
                            ),
                          if (selectedParticipants.isNotEmpty)
                            _RankingTable(
                              participants: selectedParticipants,
                              selectedTournamentId: selectedTournamentId,
                            ),
                        ],
                      ),
          ),
        );
      },
    );
  }
}

class _TournamentStatsView extends StatelessWidget {
  const _TournamentStatsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final pageState = context.read<TournamentCollectionPageCubit>();

    return MediaQuery.removePadding(
      removeTop: true,
      context: context,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(
            height: 26,
          ),
          //here two nested elements are used to form a single information from their values
          AsyncCubitBuilder<List<TournamentCollectionParticipant>>(
            bloc: pageState.tournamentParticipants,
            builder: (_, participantsState) {
              return participantsState.maybeMap(
                orElse: () => const SizedBox.shrink(),
                loading: (_) => const Center(child: CircularProgressIndicator.adaptive()),
                error: (e) {
                  final error = e.error;
                  if (error is NetworkException) {
                    return SafeArea(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: error.map(
                          (value) => NetworkExceptionWidget(
                            refresh: pageState.tournamentParticipants.refresh,
                          ),
                          noDataException: (value) => NoElementsExceptionWidget(
                            text: context.l10n.noInformation,
                            refresh: pageState.tournamentParticipants.refresh,
                          ),
                        ),
                      ),
                    );
                  } else {
                    if (kReleaseMode) {
                      Sentry.captureException(error, stackTrace: e.stackTrace);
                    } else {
                      log('${e.stackTrace}');
                      log('${e.error}');
                    }

                    return SafeArea(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: UnexpectedExceptionWidget(
                          refresh: pageState.tournamentParticipants.refresh,
                        ),
                      ),
                    );
                  }
                },
                data: (participants) {
                  return StatsTable(participants: participants.value);
                },
              );
            },
          ),
        ],
      ),
    );
  }
}

class _RankingTable extends StatefulWidget {
  const _RankingTable({
    Key? key,
    required this.participants,
    required this.selectedTournamentId,
  }) : super(key: key);

  final List<TournamentCollectionParticipant> participants;
  final int? selectedTournamentId;

  @override
  State<_RankingTable> createState() => _RankingTableState();
}

class _RankingTableState extends State<_RankingTable> {
  @override
  Widget build(BuildContext context) {
    const pagePadding = EdgeInsets.symmetric(horizontal: 17);

    return Align(
      alignment: Alignment.topLeft,
      child: SingleChildScrollView(
        padding: pagePadding,
        scrollDirection: Axis.horizontal,
        child: DataTable(
          columnSpacing: 0,
          horizontalMargin: 0,
          headingRowHeight: 35,
          dataRowHeight: 45,
          dataTextStyle: const TextStyle(
            fontSize: 11,
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
          headingTextStyle: TextStyle(
            color: context.theme.colorScheme.secondary,
            fontSize: 10,
            fontWeight: FontWeight.w600,
          ),
          columns: [
            const DataColumn(
              label: TableHeader.empty(),
            ),
            const DataColumn(
              label: TableHeader.empty(),
            ),
            DataColumn(
              label: TableHeader(
                text: context.l10n.winsAbbreviation,
                isTheFirst: true,
              ),
            ),
            DataColumn(
              label: TableHeader(
                text: context.l10n.tiesAbbreviation,
              ),
            ),
            DataColumn(
              label: TableHeader(
                text: context.l10n.lossesAbbreviation,
              ),
            ),
            DataColumn(
              label: TableHeader(
                text: context.l10n.goalDiff,
              ),
            ),
            DataColumn(
              label: TableHeader(
                text: context.l10n.points,
                isTheLast: true,
              ),
            ),
          ],
          rows: _buildDataRows(
            participants: widget.participants,
            context: context,
            selectedTournamentId: widget.selectedTournamentId,
          ),
        ),
      ),
    );
  }

  List<DataRow> _buildDataRows({
    required List<TournamentCollectionParticipant> participants,
    required int? selectedTournamentId,
    required BuildContext context,
  }) {
    final rankEntries = <DataRow>[];
    for (var i = 0; i < participants.length; i++) {
      final participant = participants[i];
      if (participant.tournamentStats[selectedTournamentId] != null) {
        rankEntries.add(resultsRowForParticipant(
          participant,
          participant.tournamentStats[selectedTournamentId]!,
          i + 1,
        ));
      }
    }
    return rankEntries;
  }

  DataRow resultsRowForParticipant(Participant participant, ParticipantScoreFields scoreFields, int index) {
    const size = 30.0;

    final placeholder = Container(
      height: size,
      width: size,
      color: R.colors.circleAvatarColor,
    );
    return DataRow(
      cells: [
        DataCell(
          SizedBox(
            width: 30,
            child: Center(child: Text('$index.')),
          ),
        ),
        DataCell(
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.45,
            child: Row(
              children: [
                ClipOval(
                  child: AppImage(
                    imageSize: const Size(size, size),
                    image: participant.avatar ?? '',
                    error: (context) => placeholder,
                    placeholder: (_) => placeholder,
                  ),
                ),
                const SizedBox(
                  width: 8,
                ),
                Expanded(
                  child: Text(
                    participant.username,
                    style: TextStyle(color: context.theme.colorScheme.secondary, fontWeight: FontWeight.w500),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ),
        ),
        DataCell(
          Center(
            child: Text('${scoreFields.wins}'),
          ),
        ),
        DataCell(
          Center(
            child: Text('${scoreFields.ties}'),
          ),
        ),
        DataCell(
          Center(
            child: Text('${scoreFields.losses}'),
          ),
        ),
        DataCell(
          Center(
            child: Text(
              '${scoreFields.goalsScored - scoreFields.goalsConceded}',
            ),
          ),
        ),
        DataCell(
          Center(
            child: Text(
              '${scoreFields.score ?? 0}(${scoreFields.subscore ?? 0})',
            ),
          ),
        ),
      ],
      color: MaterialStateProperty.resolveWith((states) {
        if ((index - 1) % 2 == 0) {
          return R.colors.tableRowOdd;
        }
      }),
    );
  }

  @override
  void initState() {
    super.initState();
    widget.participants.sortRanking();
  }

  @override
  void didUpdateWidget(oldWidget) {
    super.didUpdateWidget(oldWidget);
    widget.participants.sortRanking();
  }
}

class _TournamentCollectionStreamsView extends StatelessWidget {
  const _TournamentCollectionStreamsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final pageState = context.read<TournamentCollectionPageCubit>();
    const pagePadding = EdgeInsets.symmetric(horizontal: 17);
    return MediaQuery.removePadding(
      context: context,
      removeTop: true,
      child: Padding(
        padding: pagePadding,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(
              height: 26,
            ),
            AsyncCubitBuilder<List<Stream>>(
              bloc: pageState.streams,
              builder: (_, state) {
                return state.maybeMap(
                  orElse: () => const SizedBox.shrink(),
                  data: (streams) => StreamList(
                    streamList: streams.value,
                    live: true,
                  ),
                  loading: (_) => const Center(child: CircularProgressIndicator.adaptive()),
                  error: (e) {
                    final error = e.error;
                    if (error is NetworkException) {
                      return SafeArea(
                        child: Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: error.map(
                            (value) => NetworkExceptionWidget(
                              refresh: pageState.streams.refresh,
                            ),
                            noDataException: (value) => NoElementsExceptionWidget(
                              refresh: pageState.streams.refresh,
                              text: context.l10n.noStreams,
                            ),
                          ),
                        ),
                      );
                    } else {
                      if (kReleaseMode) {
                        Sentry.captureException(error, stackTrace: e.stackTrace);
                      } else {
                        log('${e.stackTrace}');
                        log('${e.error}');
                      }

                      return SafeArea(
                        child: Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: UnexpectedExceptionWidget(
                            refresh: pageState.streams.refresh,
                          ),
                        ),
                      );
                    }
                  },
                );
              },
            )
          ],
        ),
      ),
    );
  }
}

class _TournamentLatestMatchesView extends StatelessWidget {
  const _TournamentLatestMatchesView({
    Key? key,
    required this.tournament,
    required this.selectedStageId,
    required this.duration,
  }) : super(key: key);

  final TournamentCollection tournament;
  final ValueNotifier<int?> selectedStageId;
  final Duration duration;

  @override
  Widget build(BuildContext context) {
    final pageState = context.read<TournamentCollectionPageCubit>();
    const pagePadding = EdgeInsets.symmetric(horizontal: 17);
    return MediaQuery.removePadding(
      context: context,
      removeTop: true,
      child: Padding(
        padding: pagePadding,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(
              height: 26,
            ),
            AsyncCubitBuilder<TournamentCollectionMatchesResponse>(
              bloc: pageState.matchesForEachTournament,
              builder: (_, state) {
                return state.maybeMap(
                  orElse: () => const SizedBox.shrink(),
                  data: (matches) {
                    selectedStageId.value = selectedStageId.value ?? matches.value.keys.first;

                    return Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        DropdownButtonFormField<int>(
                          value: selectedStageId.value ?? matches.value.keys.first,
                          isExpanded: true,
                          decoration: const InputDecoration(
                            contentPadding: EdgeInsets.symmetric(horizontal: 15),
                          ),
                          onChanged: (int? value) {
                            if (value != null) {
                              selectedStageId.value = value;
                            }
                          },
                          items: matches.value.keys.map<DropdownMenuItem<int>>(
                            (int selectedId) {
                              final dropdownText = tournament.stages
                                      ?.toList()
                                      .firstWhereOrNull(
                                        (tournament) => tournament.id == selectedId,
                                      )
                                      ?.name ??
                                  '-';

                              return DropdownMenuItem<int>(
                                value: selectedId,
                                child: Text(
                                  dropdownText,
                                  overflow: TextOverflow.fade,
                                  softWrap: false,
                                ),
                              );
                            },
                          ).toList(),
                        ),
                        ValueListenableBuilder<int?>(
                          valueListenable: selectedStageId,
                          builder: (context, int? selectedTournamentId, _) {
                            final listEmpty = matches.value[selectedTournamentId].isNullOrEmptyList;

                            return AnimatedSwitcher(
                              duration: duration,
                              layoutBuilder: (currentChild, previousChildren) {
                                return Stack(
                                  alignment: Alignment.topCenter,
                                  children: <Widget>[
                                    ...previousChildren,
                                    if (currentChild != null) currentChild,
                                  ],
                                );
                              },
                              child: Padding(
                                //to animate change with the AnimatedSwitcher.
                                key: ValueKey<dynamic>(selectedTournamentId),
                                padding: const EdgeInsets.symmetric(vertical: 30),
                                child: listEmpty
                                    ? NoElementsExceptionWidget(
                                        refresh: pageState.matchesForEachTournament.refresh,
                                        text: context.l10n.noMatches,
                                      )
                                    : MatchesList(
                                        physics: const NeverScrollableScrollPhysics(),
                                        shrinkWrap: true,
                                        matches: matches.value[selectedTournamentId]!,
                                        tournament: tournament.stages
                                                ?.toList()
                                                .singleWhereOrNull((stage) => stage.id == selectedTournamentId)
                                            as TournamentRef?,
                                      ),
                              ),
                            );
                          },
                        ),
                      ],
                    );
                  },
                  loading: (_) => const Center(child: CircularProgressIndicator.adaptive()),
                  error: (e) {
                    final error = e.error;
                    if (error is NetworkException) {
                      return SafeArea(
                        child: Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: error.map(
                            (value) => NetworkExceptionWidget(
                              refresh: pageState.matchesForEachTournament.refresh,
                            ),
                            noDataException: (value) => NoElementsExceptionWidget(
                              refresh: pageState.matchesForEachTournament.refresh,
                              text: context.l10n.noMatches,
                            ),
                          ),
                        ),
                      );
                    } else {
                      if (kReleaseMode) {
                        Sentry.captureException(error, stackTrace: e.stackTrace);
                      } else {
                        log('${e.stackTrace}');
                        log('${e.error}');
                      }

                      return SafeArea(
                        child: Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: UnexpectedExceptionWidget(
                            refresh: pageState.matchesForEachTournament.refresh,
                          ),
                        ),
                      );
                    }
                  },
                );
              },
            )
          ],
        ),
      ),
    );
  }
}

//todo remove once cubits are merged
class TournamentPageHeader extends StatelessWidget {
  const TournamentPageHeader({
    Key? key,
    required this.tournament,
    required this.duration,
    this.expanded = false,
    required this.statusBarHeight,
  }) : super(key: key);

  final TournamentCollection tournament;
  final Duration duration;
  final bool expanded;
  final double statusBarHeight;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        HeaderTop(
          statusBarHeight: statusBarHeight,
          duration: duration,
          expanded: expanded,
          tournament: tournament,
        ),
        _HeaderBottom(
          duration: duration,
          expanded: expanded,
          tournament: tournament,
        )
      ],
    );
  }
}

class _HeaderBottom extends StatelessWidget {
  const _HeaderBottom({
    Key? key,
    required Duration duration,
    required this.expanded,
    required this.tournament,
  })  : _duration = duration,
        super(key: key);

  final Duration _duration;
  final bool expanded;
  final TournamentCollection tournament;

  @override
  Widget build(BuildContext context) {
    const tournamentDataContainerHeight = 60.0;
    const buttonContainerHeight = 80.0;
    final pageState = context.read<TournamentCollectionPageCubit>();

    return ClipRRect(
      child: AnimatedOpacity(
        duration: _duration,
        opacity: expanded ? 1 : 0,
        child: AnimatedContainer(
          duration: _duration,
          height: expanded ? tournamentDataContainerHeight + buttonContainerHeight : 0,
          child: SingleChildScrollView(
            physics: const NeverScrollableScrollPhysics(),
            child: Column(
              children: [
                Container(
                  height: tournamentDataContainerHeight,
                  color: R.colors.menuBarBackground,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Flexible(
                        child: TournamentDataListTile(
                          title: context.l10n.slots,
                          value: Text('${tournament.participants}/${tournament.slots ?? '0'}'),
                        ),
                      ),
                      const VerticalDivider(
                        width: 3,
                        thickness: 1,
                        color: Colors.black,
                      ),
                      Flexible(
                        child: TournamentDataListTile(
                          title: context.l10n.format,
                          value: Text(context.l10n.collection),
                        ),
                      ),
                      const VerticalDivider(
                        width: 3,
                        thickness: 1,
                        color: Colors.black,
                      ),
                      Flexible(
                        child: TournamentDataListTile(
                          title: context.l10n.region,
                          value: Text(countryNameFromId(tournament.league?.countryId) ?? 'Sweden'),
                        ),
                      ),
                      const VerticalDivider(
                        width: 3,
                        thickness: 1,
                        color: Colors.black,
                      ),
                      Flexible(
                        child: TournamentDataListTile(
                          title: context.l10n.game,
                          value: Row(
                            children: [
                              if (tournament.hasFlag(TournamentFlags.xbox))
                                Icon(Console.xbox.icon, size: 12)
                              else if (tournament.hasFlag(TournamentFlags.playstation))
                                Icon(Console.playstation.icon, size: 12),
                              const SizedBox.square(dimension: 6),
                              Text(tournament.gameId.gameType())
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(17),
                  height: buttonContainerHeight,
                  color: Colors.transparent,
                  child: AsyncCubitBuilder<SignupStatus>(
                    bloc: pageState.collectionSignUpStatus,
                    builder: (context, state) {
                      return state.maybeMap(
                        data: (signupStatus) {
                          final canSignUp = (tournament.slots != null || tournament.participants < tournament.slots!) &&
                              (tournament.hasInternalFlag(InternalTournamentFlags.tournamentStarted));
                          var disableMode = false;
                          var text = '';
                          VoidCallback? action;

                          if (signupStatus.value == SignupStatus.joined) {
                            text = context.l10n.joined;
                          } else if (signupStatus.value == SignupStatus.pending) {
                            text = context.l10n.registrationInProcess;
                            action = () {
                              onCancelJoinRequest(context);
                            };
                            disableMode = true;
                          } else if (signupStatus.value == SignupStatus.notJoined) {
                            text = canSignUp ? context.l10n.signUp : context.l10n.thisTournamentHasAlreadyStarted;
                            action = canSignUp
                                ? () {
                                    doTournamentSignup(context);
                                  }
                                : () {};
                            disableMode = !canSignUp;
                          }

                          return Theme(
                            data: context.theme.copyWith(
                              colorScheme: disableMode
                                  ? context.theme.colorScheme.copyWith(
                                      primary: context.theme.disabledColor,
                                      secondary: context.theme.disabledColor,
                                    )
                                  : null,
                            ),
                            child: CustomFormButton.loading(
                              onTap: action,
                              buttonText: text,
                              outlined: disableMode,
                            ),
                          );
                        },
                        error: (error) => CustomFormButton(
                          onTap: pageState.collectionSignUpStatus.refresh,
                          buttonText: context.l10n.unknownStatus,
                        ),
                        orElse: () => CustomFormButton(
                          onTap: () {},
                          buttonText: context.l10n.loading,
                        ),
                      );
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> onCancelJoinRequest(BuildContext context) async {
    final pageState = context.read<TournamentCollectionPageCubit>();

    //try to cancel Sign Up
    final signUpResponse = await pageState.tournamentSignUpCancel();

    signUpResponse.fold(
      (error) => snack_bars.showNetworkErrorMessage(
        error: error,
        context: context,
      ),
      (done) => snack_bars.showCustomMessage(
        context: context,
        message: 'Your request has been sent successfully',
      ),
    );

    pageState.collectionSignUpStatus.refresh();
  }

  Future<void> doTournamentSignup(BuildContext context) async {
    int? teamId;
    final pageState = context.read<TournamentCollectionPageCubit>();

    if (tournament.league != null) {
      teamId = await showDialog<int>(
        context: context,
        builder: (context) => TeamSelectorDialog(
          teamsBloc: pageState.getTeams(tournament.league!.id),
        ),
      );
    }

    //if league property is not null it is required a teamId to join the tournament

    if (tournament.league == null || teamId != null) {
      //try to Sign Up
      final signUpResponse = await pageState.tournamentSignUp(
        teamId: teamId,
      );

      signUpResponse.fold(
        (error) => snack_bars.showNetworkErrorMessage(
          error: error,
          context: context,
        ),
        (done) => snack_bars.showCustomMessage(
          context: context,
          message: 'Your request has been sent successfully',
        ),
      );

      pageState.collectionSignUpStatus.refresh();
    }
  }
}
