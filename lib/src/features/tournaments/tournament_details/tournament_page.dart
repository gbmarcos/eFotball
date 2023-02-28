
import 'dart:developer';
import 'dart:ui' as ui show ImageFilter;

import 'package:async_data_bloc/async_data_bloc.dart';
import 'package:fifa/r.dart';
import 'package:fifa/resources/resources.dart';
import 'package:fifa/src/app/dependency_injection.dart';
import 'package:fifa/src/app/keys.dart';
import 'package:fifa/src/common/dialogs.dart' as snack_bars;
import 'package:fifa/src/common/domain/tournament/tournament.dart';
import 'package:fifa/src/common/domain/user/user.dart';
import 'package:fifa/src/common/exceptions.dart';
import 'package:fifa/src/common/extensions.dart';
import 'package:fifa/src/common/widgets/app_html.dart';
import 'package:fifa/src/common/widgets/app_image.dart';
import 'package:fifa/src/common/widgets/custom_form_button.dart';
import 'package:fifa/src/common/widgets/custom_shimmer.dart';
import 'package:fifa/src/common/widgets/exception_widget.dart';
import 'package:fifa/src/features/login/signup/utils/extensions.dart';
import 'package:fifa/src/features/match/matches_list.dart';
import 'package:fifa/src/features/streams/stream_page.dart';
import 'package:fifa/src/features/tournaments/collection/model/tournament_collection.dart';
import 'package:fifa/src/features/tournaments/model/tournament.dart';
import 'package:fifa/src/features/tournaments/tournament_details/models/bracket.dart';
import 'package:fifa/src/features/tournaments/tournament_details/models/participant.dart';
import 'package:fifa/src/features/tournaments/tournament_details/models/tournament.dart';
import 'package:fifa/src/features/tournaments/tournament_details/tournament_page_cubit.dart';
import 'package:fifa/src/features/tournaments/tournament_section.dart';

import 'package:fifa/src/notifications/data/notification.dart';
import 'package:fifa/src/notifications/notification_app_bar.dart';
import 'package:fifa/src/notifications/notification_cubit/notification_cubit.dart';
import 'package:flutter/foundation.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graphview/GraphView.dart';
import 'package:provider/provider.dart';
import 'package:routemaster/routemaster.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'package:fifa/src/features/match/model/match.dart';
import 'package:fifa/src/features/streams/model/stream.dart' ;


class TournamentPage extends StatelessWidget {
  final int tournamentId;

  const TournamentPage({
    required this.tournamentId,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (_) => TournamentPageCubit(
        checkInRepository: getIt(),
        streamRepository: getIt(),
        tournamentId: tournamentId,
        currentUser: context.currentUser,
        matchLobbyBloc: getIt(),
        tournamentRepository: getIt(),
        //TournamentRepository is provided in HomeTabView
        matchRepository: getIt(),
        //MatchRepository is provided in HomeTabView
      ),
      child: Builder(
        builder: (context) {
          return AsyncCubitBuilder<TournamentEntry>(
            bloc: context.read<TournamentPageCubit>().tournamentEntry,
            builder: (_, participantsState) {
              return participantsState.maybeMap(
                orElse: () => const SizedBox.shrink(),
                loading: (_) => const Center(child: CircularProgressIndicator.adaptive()),
                error: (e) => const NetworkExceptionWidget(),
                data: (selectedTournament) {
                  return TournamentView(
                    selectedTournament: selectedTournament.value,
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

class TournamentView extends StatefulWidget {
  const TournamentView({Key? key, required this.selectedTournament}) : super(key: key);
  final TournamentEntry selectedTournament;

  @override
  State<TournamentView> createState() => _TournamentViewState();
}

class _TournamentViewState extends State<TournamentView> with TickerProviderStateMixin {
  late final controller = ScrollController();

  late final TabController tabController = TabController(length: 3, vsync: this)
    ..addListener(
      () {
        setState(() {});
      },
    );
  late final TabController subTabController = TabController(
    length: widget.selectedTournament.format == TournamentFormat.matchmaking ? 2 : 3,
    vsync: this,
  )..addListener(
      () {
        setState(() {});
      },
    );

  late final pagePadding = const EdgeInsets.symmetric(horizontal: 17);
  late final _duration = const Duration(milliseconds: 200);

  @override
  void dispose() {
    controller.dispose();
    tabController.dispose();
    subTabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final pageState = context.read<TournamentPageCubit>();

    return BlocListener<NotificationCubit, NotificationState>(
      listenWhen: (previous, current) {
        final diff=!const DeepCollectionEquality.unordered().equals(previous.notifications, current.notifications);
        print('Are they different$diff');

        return  diff;
      },
      listener: (context, state) {
        final pageState = context.read<TournamentPageCubit>();

        final data = (state.notifications.first.data is Map<String, dynamic>)
            ? state.notifications.first.data as Map<String, dynamic>
            : <String, dynamic>{};

        //if the notification is related to the selected tournament
        if (data['id'] == widget.selectedTournament.id) {
          switch (state.notifications.first.type) {
            case NotificationType.tournamentJoinRequestAccepted:
              {
                snack_bars.showCustomMessage(
                  context: context,
                  message: context.l10n.yourTournamentJoinRequestWasAccepted,
                );
                pageState.tournamentSignUpStatus.refresh();
              }
              break;
            case NotificationType.tournamentJoinRequestDeclined:
              {
                snack_bars.showCustomMessage(
                  context: context,
                  message: context.l10n.yourTournamentJoinRequestWasDeclined,
                );
                pageState.tournamentSignUpStatus.refresh();
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
        body: AsyncCubitBuilder<TournamentEntry>(
          bloc: pageState.tournamentEntry,
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
                          tournamentFormat: tournament.value.format,
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
                        ),
                      ),
                    ],
                  ),
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
                          refresh: pageState.tournamentEntry.refresh,
                        ),
                        noDataException: (value) => NoElementsExceptionWidget(
                          text: context.l10n.noInformation,
                          refresh: pageState.tournamentEntry.refresh,
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
                        refresh: pageState.tournamentEntry.refresh,
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
  }) : super(key: key);

  final TabController tabController;
  final TabController subTabController;
  final TournamentEntry tournament;
  final Duration duration;

  @override
  Widget build(BuildContext context) {
    final tabIndex = tabController.index;
    final subTabIndex = subTabController.index;

    if (tabIndex == 0) return DescriptionView(tournament: tournament);
    if (tabIndex == 1 && subTabIndex == 0) {
      return _TournamentLatestMatchesView(
        tournament: tournament,
      );
    }
    if (tabIndex == 1 && subTabIndex == 1) {
      switch (tournament.format) {
        case TournamentFormat.roundRobin:
        case TournamentFormat.swissSystem:
        case TournamentFormat.singleElimination:
          return TournamentResultsView(tournament: tournament, duration: duration);
        case TournamentFormat.matchmaking:
          return const _TournamentStatsView();
        default:
          return const UnderConstruction();
      }
    }
    if (tabIndex == 1 && subTabIndex == 2) {
      return const _TournamentStatsView();
    }

    if (tabIndex == 2) return const _TournamentStreamsView();

    return const UnderConstruction();
  }
}

class TournamentResultsView extends StatelessWidget {
  const TournamentResultsView({
    Key? key,
    required this.tournament,
    required this.duration,
  }) : super(key: key);

  final TournamentEntry tournament;
  final Duration duration;

  @override
  Widget build(BuildContext context) {
    final pageState = context.read<TournamentPageCubit>();

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
          AsyncCubitBuilder<List<TournamentBracket>>(
            bloc: pageState.tournamentBrackets,
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
                            refresh: pageState.tournamentBrackets.refresh,
                          ),
                          noDataException: (value) => NoElementsExceptionWidget(
                            text: context.l10n.noInformation,
                            refresh: pageState.tournamentBrackets.refresh,
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
                          refresh: pageState.tournamentBrackets.refresh,
                        ),
                      ),
                    );
                  }
                },
                data: (brackets) {
                  return AsyncCubitBuilder<List<Participant>>(
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
                          //to get the distinct rounds

                          final rounds = brackets.value.map((bracket) => bracket.round).toSet();

                          switch (tournament.format) {
                            case TournamentFormat.swissSystem:
                            case TournamentFormat.roundRobin:
                              return _RoundRobinsAndSwissResults(
                                rounds: rounds,
                                participants: participants,
                                brackets: brackets,
                                duration: duration,
                              );
                            case TournamentFormat.singleElimination:
                              return SingleEliminationResults(
                                rounds: rounds,
                                participants: participants.value,
                                brackets: brackets.value,
                              );
                            default:
                              return const SizedBox.shrink();
                          }
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

class _TournamentStatsView extends StatelessWidget {
  const _TournamentStatsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final pageState = context.read<TournamentPageCubit>();

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
          AsyncCubitBuilder<List<Participant>>(
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
                  return StatsTable(
                    participants: participants.value,
                    tournamentFormData: context
                        .read<TournamentPageCubit>()
                        .tournamentEntry
                        .state
                        .valueOrNull!
                        .format
                        .tournamentFormData,
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

class _RoundRobinsAndSwissResults extends StatefulWidget {
  const _RoundRobinsAndSwissResults({
    Key? key,
    required this.rounds,
    required this.participants,
    required this.brackets,
    required this.duration,
  }) : super(key: key);

  final Set<int> rounds;
  final AsyncData<List<Participant>> participants;
  final AsyncData<List<TournamentBracket>> brackets;
  final Duration duration;

  @override
  _RoundRobinsAndSwissResultsState createState() => _RoundRobinsAndSwissResultsState();
}

class _RoundRobinsAndSwissResultsState extends State<_RoundRobinsAndSwissResults> {
  late final pagePadding = const EdgeInsets.symmetric(horizontal: 17);

  late ValueNotifier<dynamic> dropdownValueListenable = ValueNotifier<dynamic>(context.l10n.viewAll);

  @override
  void dispose() {
    dropdownValueListenable.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //dropdown values [View All, 1, 2, 3, 4, ...n, Ranking Table]
    final dropdownValues = <dynamic>[
      context.l10n.viewAll,
      ...widget.rounds,
      context.l10n.rankingTable,
    ];

    return Column(
      children: [
        Padding(
          padding: pagePadding,
          child: DropdownButtonFormField<dynamic>(
            isExpanded: true,
            value: dropdownValues.first,
            decoration: const InputDecoration(
              contentPadding: EdgeInsets.symmetric(horizontal: 15),
            ),
            onChanged: (dynamic value) {
              if (value != null) {
                dropdownValueListenable.value = value;
              }
            },
            items: dropdownValues.map<DropdownMenuItem<dynamic>>(
              (dynamic value) {
                late String dropdownText;

                if (value is int) {
                  dropdownText = '${context.l10n.round} ${value + 1}';
                } else {
                  dropdownText = value.toString();
                }

                return DropdownMenuItem<dynamic>(
                  value: value,
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
        ValueListenableBuilder<dynamic>(
          valueListenable: dropdownValueListenable,
          builder: (context, dynamic dropdownValue, _) {
            late List<int> visibleRounds;

            if (dropdownValue == context.l10n.viewAll) {
              visibleRounds = widget.rounds.toList();
            } else if (dropdownValue is int) {
              visibleRounds = [dropdownValue];
            } else {
              visibleRounds = [];
            }

            return AnimatedSwitcher(
              duration: widget.duration,
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
                key: ValueKey<dynamic>(dropdownValue),
                padding: const EdgeInsets.symmetric(vertical: 30),
                child: Column(
                  children: [
                    if (dropdownValue != context.l10n.rankingTable)
                      Padding(
                        padding: pagePadding,
                        child: ListView.separated(
                          shrinkWrap: true,

                          itemBuilder: (context, index) {
                            return RoundsResults(
                              brackets: widget.brackets.value
                                  .where((bracket) => bracket.round == visibleRounds[index])
                                  .toList(),
                              participants: widget.participants.value,
                              round: visibleRounds[index],
                            );
                          },
                          separatorBuilder: (context, index) => const SizedBox(
                            height: 30,
                          ),
                          itemCount: visibleRounds.length,
                        ),
                      ),
                    if (dropdownValue == context.l10n.viewAll)
                      const SizedBox(
                        height: 30,
                      ),
                    if (dropdownValue == context.l10n.viewAll || dropdownValue == context.l10n.rankingTable)
                      _RankingTable(
                        //todo(marcos) check the order of the list
                        participants: widget.participants.value,
                      ),
                  ],
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}

class SingleEliminationResults extends StatelessWidget {
  const SingleEliminationResults({
    Key? key,
    required this.rounds,
    required this.participants,
    required this.brackets,
  }) : super(key: key);

  final Set<int> rounds;
  final List<Participant> participants;
  final List<TournamentBracket> brackets;

  @override
  Widget build(BuildContext context) {
    final graph = Graph()..isTree = true;
    final builder = BuchheimWalkerConfiguration();
    final nodes = brackets.map<Node>((bracket) => Node.Id(bracket.id)).toList();

    //dimensions of the tree
    const siblingSeparation = 17;
    const levelSeparation = 30;
    const subtreeSeparation = 25;
    final bracketsWidth = context.mediaQuery.size.width / 2;

    buildTree(
      graph: graph,
      nodes: nodes,
      brackets: brackets,
    );

    //configuration of de tree
    builder
      ..siblingSeparation = siblingSeparation
      ..levelSeparation = levelSeparation
      ..subtreeSeparation = subtreeSeparation
      ..orientation = (BuchheimWalkerConfiguration.ORIENTATION_RIGHT_LEFT);

    return Align(
      alignment: Alignment.bottomLeft,
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 17, vertical: 5),

        scrollDirection: Axis.horizontal,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _GraphHeader(
              rounds: rounds,
              bracketsWidth: bracketsWidth,
              levelSeparation: levelSeparation,
              brackets: brackets,
            ),
            const SizedBox(height: 26),
            Transform.translate(
              //to correct a rare padding
              offset: const Offset(-10, -10),
              child: GraphView(
                graph: graph,
                algorithm: BuchheimWalkerAlgorithm(builder, TreeEdgeRenderer(builder)),
                paint: Paint()
                  ..color = R.colors.searchFieldUnderlineColor
                  ..strokeWidth = 1
                  ..style = PaintingStyle.fill,
                builder: (Node node) {
                  final bracketId = node.key!.value as int;
                  return SizedBox(
                    width: bracketsWidth,
                    child: _BracketCard(
                      bracket: brackets.singleWhereOrNull((bracket) => bracket.id == bracketId)!,
                      participants: participants,
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  void buildTree({
    required Graph graph,
    required List<Node> nodes,
    required List<TournamentBracket> brackets,
  }) {
    //build the brackets tree from de end to the beginning of the nodes list

    if (nodes.length == 1) {
      graph.addNode(nodes.single);
    } else {
      for (final node in nodes.reversed) {
        //to get children
        final children = nodes
            .where(
              (childNode) =>
                  brackets.singleWhereOrNull((bracket) => bracket.id == childNode.key?.value)?.winnerBracketId ==
                  node.key?.value,
            )
            .toList();

        //to put nodes in the tree
        for (final child in children) {
          graph.addEdge(node, child);
        }
      }
    }
  }
}

class _GraphHeader extends StatelessWidget {
  const _GraphHeader({
    Key? key,
    required this.rounds,
    required this.bracketsWidth,
    required this.levelSeparation,
    required this.brackets,
  }) : super(key: key);

  final Set<int> rounds;
  final double bracketsWidth;
  final int levelSeparation;
  final List<TournamentBracket> brackets;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: (rounds.length * bracketsWidth) + ((rounds.length - 1) * levelSeparation),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: rounds.map<Widget>((r) {
          return Container(
            width: bracketsWidth,
            alignment: Alignment.center,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  '${context.l10n.round} ${r + 1}',
                  style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 12),
                ),
                Text(
                  '${brackets.where((bracket) {
                        return bracket.round == r;
                      }).length * 2} '
                  '${context.l10n.players.toLowerCase()}',
                  style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w400, fontSize: 10),
                ),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }
}

class _RankingTable extends StatelessWidget {
  const _RankingTable({Key? key, required this.participants}) : super(key: key);

  final List<Participant> participants;

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
            const DataColumn(label: TableHeader.empty()),
            const DataColumn(label: TableHeader.empty()),
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
          rows: _buildDataRows(participants, context),
        ),
      ),
    );
  }

  List<DataRow> _buildDataRows(
    List<Participant> participants,
    BuildContext context,
  ) {
    const size = 30.0;

    final placeholder = Container(
      height: size,
      width: size,
      color: R.colors.circleAvatarColor,
    );

    return participants
        .map<DataRow>(
          (participant) => DataRow(
            cells: [
              DataCell(
                SizedBox(
                  width: 30,
                  child: Center(child: Text('${participants.indexOf(participant) + 1}.')),
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
                  child: Text('${participant.wins}'),
                ),
              ),
              DataCell(
                Center(
                  child: Text('${participant.ties}'),
                ),
              ),
              DataCell(
                Center(
                  child: Text('${participant.losses}'),
                ),
              ),
              DataCell(
                Center(
                  child: Text('${participant.goalsScored - participant.goalsConceded}'),
                ),
              ),
              DataCell(
                Center(
                  child: Text('${participant.score ?? 0}(${participant.subscore ?? 0})'),
                ),
              ),
            ],
            color: MaterialStateProperty.resolveWith((states) {
              if (participants.indexOf(participant) % 2 == 0) {
                return R.colors.tableRowOdd;
              }
            }),
          ),
        )
        .toList();
  }
}

class StatsTable extends StatefulWidget {
  const StatsTable({Key? key, required this.participants, this.tournamentFormData}) : super(key: key);
  final TournamentFormData? tournamentFormData;
  final List<Participant> participants;

  @override
  State<StatsTable> createState() => StatsTableState();
}

class StatsTableState extends State<StatsTable> {
  @override
  Widget build(BuildContext context) {
    const pagePadding = EdgeInsets.symmetric(horizontal: 17);
    return Align(
      alignment: Alignment.topLeft,
      child: SingleChildScrollView(
        key: Keys.tournamentStatsTable,
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
                text: context.l10n.goalsGames,
              ),
            ),
            if (widget.tournamentFormData?.hasPoints ?? false)
              DataColumn(
                label: TableHeader(
                  text: context.l10n.points,
                  isTheLast: true,
                ),
              ),
          ],
          rows: _buildDataRows(widget.participants, context, widget.tournamentFormData),
        ),
      ),
    );
  }

  List<DataRow> _buildDataRows(
    List<Participant> participants,
    BuildContext context,
    TournamentFormData? tournamentFormData,
  ) {
    const size = 30.0;

    final placeholder = Container(
      height: size,
      width: size,
      color: R.colors.circleAvatarColor,
    );

    return participants
        .map<DataRow>(
          (participant) => DataRow(
            cells: [
              DataCell(
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.45,
                  child: GestureDetector(
                    onTap: () {
                      if (participant.id == context.currentUser.id) {
                        Routemaster.of(context).push(R.routeNames.profileSection);
                      } else {
                        Routemaster.of(context).pushWithScope(
                          R.routeNames.profileDetailsWithId(participant.id),
                          value: participant,
                        );
                      }
                    },
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
              ),
              DataCell(
                Center(
                  child: Text('${participant.wins}'),
                ),
              ),
              DataCell(
                Center(
                  child: Text('${participant.ties}'),
                ),
              ),
              DataCell(
                Center(
                  child: Text('${participant.losses}'),
                ),
              ),
              DataCell(
                Center(
                  child: Text('${participant.goalsScored - participant.goalsConceded}'),
                ),
              ),
              DataCell(
                Center(
                  child: Text(
                    participant.matches != 0
                        ? '${(participant.goalsScored / participant.matches).truncateToDecimals()}'
                        : context.l10n.na,
                  ),
                ),
              ),
              if (tournamentFormData?.hasPoints ?? false)
                DataCell(
                  Center(
                    child: Text('${participant.score ?? 0}(${participant.subscore ?? 0})'),
                  ),
                ),
            ],
            color: MaterialStateProperty.resolveWith((states) {
              if (participants.indexOf(participant) % 2 == 0) {
                return R.colors.tableRowOdd;
              }
            }),
          ),
        )
        .toList();
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

class TableHeader extends StatelessWidget {
  const TableHeader({
    Key? key,
    required this.text,
    this.isTheFirst = false,
    this.isTheLast = false,
  })  : isEmpty = false,
        super(key: key);

  const TableHeader.empty()
      : isEmpty = true,
        text = '',
        isTheFirst = false,
        isTheLast = false,
        super(key: null);

  final String text;
  final bool isTheFirst;
  final bool isTheLast;
  final bool isEmpty;

  @override
  Widget build(BuildContext context) {
    const dataColumnPadding = EdgeInsets.symmetric(horizontal: 15);
    return Flexible(
      child: isEmpty
          ? const SizedBox.shrink()
          : Container(
              padding: dataColumnPadding,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: R.colors.tableScoreColor,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(isTheFirst ? 4 : 0),
                    topRight: Radius.circular(isTheLast ? 4 : 0),
                  )),
              child: Text(text),
            ),
    );
  }
}

class RoundsResults extends StatelessWidget {
  const RoundsResults({
    Key? key,
    required this.brackets,
    required this.participants,
    required this.round,
  }) : super(key: key);

  final List<TournamentBracket> brackets;
  final List<Participant> participants;
  final int round;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '${context.l10n.round} ${round + 1}',
          style: const TextStyle(
            color: Colors.white,
            fontSize: 12,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 12),
        if (brackets.isNotEmpty)
          ListView.separated(
            shrinkWrap: true,
            itemBuilder: (context, index) {
              final bracket = brackets.elementAt(index);
              final bracketNumber = brackets.indexOf(bracket) + 1;

              return Row(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                    decoration: BoxDecoration(
                      color: R.colors.textBoxBG,
                      borderRadius: R.shapes.radius_4,
                    ),
                    child: Text(
                      '$bracketNumber',
                      style: TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.w500,
                        color: context.theme.colorScheme.secondary,
                      ),
                    ),
                  ),
                  const SizedBox(width: 5),
                  Expanded(
                    child: _BracketCard(
                      bracket: bracket,
                      participants: participants,
                    ),
                  ),
                ],
              );
            },
            separatorBuilder: (context, index) => const SizedBox(
              height: 17,
            ),
            itemCount: brackets.length,
          )
        else
          NoElementsExceptionWidget(
            text: context.l10n.noBrackets,
          ),
      ],
    );
  }
}

class _BracketCard extends StatelessWidget {
  const _BracketCard({
    Key? key,
    required this.bracket,
    required this.participants,
  }) : super(key: key);

  final TournamentBracket bracket;
  final List<Participant> participants;

  @override
  Widget build(BuildContext context) {
    final participant1 = participants.singleWhereOrNull(
      (participant) => participant.id == bracket.user1Id,
    );
    final participant2 = participants.singleWhereOrNull(
      (participant) => participant.id == bracket.user2Id,
    );

    final participant1Score = bracket.user1Score ?? 0;
    final participant2Score = bracket.user2Score ?? 0;

    final isParticipant1Winner = participant1Score != 0 && participant1Score >= participant2Score;
    final isParticipant2Winner = participant2Score != 0 && participant2Score >= participant1Score;

    return Stack(
      children: [
        Positioned.fill(
          child: ColoredBox(
            color: R.colors.background,
          ),
        ),
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _ParticipantListTile(
              participant: participant1,
              isTheWinner: isParticipant1Winner,
              score: participant1Score,
              walkover: bracket.walkover,
            ),
            const SizedBox(height: 5),
            _ParticipantListTile(
              participant: participant2,
              isTheWinner: isParticipant2Winner,
              score: participant2Score,
              walkover: bracket.walkover,
            ),
          ],
        ),
      ],
    );
  }
}

class _ParticipantListTile extends StatelessWidget {
  const _ParticipantListTile({
    Key? key,
    required this.participant,
    this.isTheWinner = false,
    required this.score,
    this.walkover = false,
  }) : super(key: key);

  final Participant? participant;
  final bool isTheWinner;
  final int score;
  final bool walkover;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 37,
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        color: R.colors.textBoxBG,
        borderRadius: R.shapes.radius_4,
      ),
      child: Row(
        children: [
          if (participant != null)
            SizedBox(
              width: 50,
              child: AppImage(
                circularShape: true,
                imageSize: const Size.fromHeight(24),
                image: participant!.team?.logo ?? participant!.avatar ?? '',
                error: (context) => const Icon(
                  Icons.shield_outlined,
                  color: Colors.white,
                ),
                placeholder: (_) => const Icon(
                  Icons.shield_outlined,
                  color: Colors.white,
                ),
              ),
            ),
          if (participant != null)
            Expanded(
              child: GestureDetector(
                onTap: () {
                  if (participant!.id == context.currentUser.id) {
                    Routemaster.of(context).push(R.routeNames.profileSection);
                  } else {
                    Routemaster.of(context).pushWithScope(
                      R.routeNames.profileDetailsWithId(participant!.id),
                      value: participant!,
                    );
                  }
                },
                child: Text(
                  participant!.username,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 11,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          if (participant != null)
            Container(
              width: 43,
              color: isTheWinner ? context.theme.colorScheme.secondary : R.colors.inputBoxStroke,
              child: Center(
                child: Text(
                  walkover
                      ? isTheWinner
                          ? context.l10n.wo
                          : '-'
                      : '$score',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: isTheWinner ? R.colors.textBoxBG : context.theme.colorScheme.secondary,
                  ),
                ),
              ),
            )
        ],
      ),
    );
  }
}

class _TournamentLatestMatchesView extends StatelessWidget {
  const _TournamentLatestMatchesView({
    Key? key,
    required this.tournament,
  }) : super(key: key);

  final TournamentEntry tournament;

  @override
  Widget build(BuildContext context) {
    final pageState = context.read<TournamentPageCubit>();
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
            AsyncCubitBuilder<List<Match>>(
              bloc: pageState.tournamentMatches,
              builder: (_, state) {
                return state.maybeMap(
                  orElse: () => const SizedBox.shrink(),
                  data: (matches) => MatchesList(
                    matches: matches.value,
                    tournament: tournament ,
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
                              refresh: pageState.tournamentMatches.refresh,
                            ),
                            noDataException: (value) => NoElementsExceptionWidget(
                              refresh: pageState.tournamentMatches.refresh,
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
                            refresh: pageState.tournamentMatches.refresh,
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

class _TournamentStreamsView extends StatelessWidget {
  const _TournamentStreamsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final pageState = context.read<TournamentPageCubit>();
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

class DescriptionView extends StatelessWidget {
  const DescriptionView({
    Key? key,
    required this.tournament,
  }) : super(key: key);
  final TournamentDetails tournament;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 17),
      child: AppHtml(tournament.description ?? '<p>${context.l10n.noInformation}</p>'),
    );
  }
}

class NavigationTab extends StatefulWidget {
  const NavigationTab({
    Key? key,
    required Duration duration,
    required this.tabController,
    required this.subTabController,
    this.tournamentFormat,
  })  : _duration = duration,
        super(key: key);

  final Duration _duration;
  final TournamentFormat? tournamentFormat;
  final TabController tabController;
  final TabController subTabController;

  @override
  State<NavigationTab> createState() => _NavigationTabState();
}

class _NavigationTabState extends State<NavigationTab> {
  @override
  Widget build(BuildContext context) {
    final tabBarHeight = R.dimen.fieldsAndButtonsHeight;
    final subTabBarHeight = tabBarHeight * 0.90;

    return AnimatedContainer(
      duration: widget._duration,
      clipBehavior: Clip.hardEdge,
      height: tabBarHeight + (widget.tabController.index != 1 ? 0 : subTabBarHeight),
      decoration: BoxDecoration(
        borderRadius: R.shapes.radius_4,
        color: R.colors.menuBarBackground,
      ),
      child: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TabBar(
              controller: widget.tabController,
              indicator: BoxDecoration(color: R.colors.tabBarUnselected),
              tabs: [
                Tab(
                  key: Keys.tournamentPageInfoTab,
                  child: Text(
                    context.l10n.info,
                    style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
                  ),
                ),
                Tab(
                  key: Keys.tournamentPageResultsTab,
                  child: Text(
                    context.l10n.results,
                    style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
                  ),
                ),
                Tab(
                  key: Keys.tournamentPageStreamsTab,
                  child: Text(
                    context.l10n.streamsLabel,
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                    ),
                  ),
                ),
              ],
            ),
            AnimatedOpacity(
              duration: widget._duration,
              opacity: widget.tabController.index != 1 ? 0 : 1,
              curve: widget.tabController.index != 1 ? Curves.easeOut : Curves.linear,
              child: Container(
                color: R.colors.tabBarUnselected,
                height: subTabBarHeight,
                child: TabBar(
                  controller: widget.subTabController,
                  indicator: const BoxDecoration(color: Colors.transparent),
                  tabs: [
                    Tab(
                      key: Keys.tournamentPageResultsScoreTab,
                      child: Text(
                        context.l10n.scores,
                        style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 12),
                      ),
                    ),
                    if (widget.tournamentFormat != TournamentFormat.matchmaking)
                      Tab(
                        key: Keys.tournamentPageResultsBracketTab,
                        child: Text(
                          tournamentDetailsTabLabel(context),
                          style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 12),
                        ),
                      ),
                    Tab(
                      key: Keys.tournamentPageResultStatsTab,
                      child: Text(
                        context.l10n.stats,
                        style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 12),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  String tournamentDetailsTabLabel(BuildContext context) {
    if (widget.tournamentFormat != null && widget.tournamentFormat != TournamentFormat.singleElimination) {
      return context.l10n.overview;
    }
    return context.l10n.bracket;
  }
}

class TournamentPageHeader extends StatelessWidget {
  const TournamentPageHeader({
    Key? key,
    required this.tournament,
    required this.duration,
    this.expanded = false,
    required this.statusBarHeight,
  }) : super(key: key);

  final TournamentEntry tournament;
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

///todo make common abstractions for cubits
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
  final TournamentEntry tournament;

  @override
  Widget build(BuildContext context) {
    const tournamentDataContainerHeight = 60.0;
    const buttonContainerHeight = 80.0;
    final pageState = context.read<TournamentPageCubit>();

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
                          value: Text(tournament.format.localized(context)),
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
                          value: Row(children: [
                            if (tournament.hasFlag(TournamentFlags.xbox))
                              Icon(Console.xbox.icon, size: 12)
                            else if (tournament.hasFlag(TournamentFlags.playstation))
                              Icon(Console.playstation.icon, size: 12),
                            const SizedBox.square(dimension: 6),
                            Text(tournament.gameId.gameType())

                          ]),
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
                      bloc: pageState.tournamentSignUpStatus,
                      builder: (context, state) {
                        return state.maybeMap(
                          data: (signupStatus) {
                            final canSignUp =
                                (tournament.slots != null || tournament.participants < tournament.slots!) &&
                                    (tournament.hasInternalFlag(InternalTournamentFlags.tournamentStarted) );
                            var disableMode = false;
                            var text = '';
                            VoidCallback? action;

                            if (signupStatus.value == SignupStatus.joined) {
                              if (tournament.format == TournamentFormat.matchmaking) {
                                text = context.l10n.matchmaking;
                                action = () async {
                                  await pageState.goToMatchmaking(
                                    askBeforeToRestoreMatchState: () => askBeforeToRestore(context),
                                  );
                                };
                              } else {
                                text = context.l10n.joined;
                              }
                            } else if (signupStatus.value == SignupStatus.pending) {
                              text = context.l10n.registrationInProcess;
                              action = () async {
                                await onCancelJoinRequest(context);
                              };
                              disableMode = true;
                            } else if (signupStatus.value == SignupStatus.notJoined) {
                              text = canSignUp ? context.l10n.signUp : context.l10n.thisTournamentHasAlreadyStarted;
                              action = canSignUp
                                  ? () async {
                                      await doTournamentSignup(context);
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
                                key: Keys.tournamentPageJoinButton,
                                onTap: action,
                                buttonText: text,
                                outlined: disableMode,
                              ),
                            );
                          },
                          error: (error) => CustomFormButton(
                            onTap: pageState.tournamentSignUpStatus.refresh,
                            buttonText: context.l10n.unknownStatus,
                          ),
                          orElse: () => CustomFormButton(
                            onTap: () {},
                            buttonText: context.l10n.loading,
                          ),
                        );
                      }),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> onCancelJoinRequest(BuildContext context) async {
    final pageState = context.read<TournamentPageCubit>();

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

    pageState.tournamentSignUpStatus.refresh();
  }

  Future<void> doTournamentSignup(BuildContext context) async {
    int? teamId;
    final pageState = context.read<TournamentPageCubit>();

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

      pageState.tournamentSignUpStatus.refresh();
    }
  }

  Future<bool> askBeforeToRestore(BuildContext context) async {
    return (await showDialog<bool>(
          context: context,
          builder: (context) {
            return AlertDialog(
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    context.l10n.notice,
                    style: TextStyles.title.copyWith(
                      color: Theme.of(context).colorScheme.primary,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 15),
                  Text(
                    context.l10n.youStillHaveAMatch,
                    style: TextStyles.title.copyWith(
                      fontSize: 14,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 15),
                  CustomFormButton(onTap: () => context.navigator.pop(true), buttonText: context.l10n.gotoMatch),
                  const SizedBox(height: 15),
                  CustomFormButton(
                    onTap: () => context.navigator.pop(false),
                    buttonText: context.l10n.close,
                    outlined: true,
                  ),
                ],
              ),
            );
          },
        )) ??
        false;
  }
}

class TeamSelectorDialog extends StatefulWidget {
  const TeamSelectorDialog({
    Key? key,
    required this.teamsBloc,
  }) : super(key: key);

  final AsyncCubit<List<Team>> teamsBloc;

  @override
  State<TeamSelectorDialog> createState() => _TeamSelectorDialogState();
}

class _TeamSelectorDialogState extends State<TeamSelectorDialog> {
  int? selectedTeamId;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(context.l10n.selectATeam),
      content: AsyncCubitBuilder<List<Team>>(
        bloc: widget.teamsBloc,
        builder: (context, state) {
          return state.maybeMap(
            data: (teams) {
              return RawScrollbar(
                child: ListView.separated(
                  itemCount: teams.value.length,
                  separatorBuilder: (context, index) => const SizedBox.shrink(),
                  itemBuilder: (context, index) {
                    final team = teams.value[index];

                    return ColoredBox(
                      color: selectedTeamId == team.id
                          ? context.theme.colorScheme.secondary.withOpacity(0.2)
                          : Colors.transparent,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Row(
                          children: [
                            SizedBox(
                              height: 35,
                              width: 35,
                              child: AppImage(
                                image: team.logo ?? '',
                                placeholder: (context) => const Icon(
                                  Icons.shield_outlined,
                                  size: 35,
                                  color: Colors.white,
                                ),
                                error: (context) => const Icon(
                                  Icons.shield_outlined,
                                  size: 35,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            Expanded(
                              child: ListTile(
                                onTap: () => setState(() => selectedTeamId = team.id),
                                title: Text(team.name),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              );
            },
            orElse: () => const Center(
              child: CircularProgressIndicator.adaptive(),
            ),
          );
        },
      ),
      actionsPadding: const EdgeInsets.only(
        left: 15,
        bottom: 15,
        right: 15,
      ),
      actions: [
        IgnorePointer(
          ignoring: selectedTeamId == null,
          child: Opacity(
            opacity: selectedTeamId != null ? 1 : 0.4,
            child: CustomFormButton(
              onTap: () {
                context.navigator.pop(selectedTeamId);
              },
              buttonText: context.l10n.signUp,
            ),
          ),
        ),
        const SizedBox(height: 10),
        CustomFormButton(
          onTap: () {
            context.navigator.pop();
          },
          buttonText: context.l10n.cancel,
          outlined: true,
        ),
      ],
    );
  }
}

class TournamentDataListTile extends StatelessWidget {
  const TournamentDataListTile({
    Key? key,
    required this.title,
    required this.value,
  }) : super(key: key);

  final Widget value;
  final String title;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Padding(
      padding: const EdgeInsets.all(5),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyles.title.copyWith(color: colorScheme.primary, fontSize: 13),
            overflow: TextOverflow.fade,
            softWrap: false,
          ),
          const SizedBox(height: 4),
          DefaultTextStyle(
            style: TextStyles.subTitle.copyWith(color: Colors.white),
            overflow: TextOverflow.fade,
            softWrap: false,
            child: value,
          )
        ],
      ),
    );
  }
}

class HeaderTop extends StatelessWidget {
  const HeaderTop({
    Key? key,
    required Duration duration,
    required this.expanded,
    required this.tournament,
    required this.statusBarHeight,
  })  : _duration = duration,
        super(key: key);

  final Duration _duration;
  final bool expanded;
  final double statusBarHeight;

  final TournamentDetails tournament;

  @override
  Widget build(BuildContext context) {
    const maxHeight = 175.0;
    const minHeight = 80.0;
    return ClipRRect(
      child: AnimatedContainer(
        duration: _duration,
        height: MediaQuery.of(context).padding.top - statusBarHeight + (expanded ? maxHeight : minHeight),
        child: Stack(
          alignment: Alignment.center,
          children: [
            HeaderBackground(
              height: MediaQuery.of(context).padding.top - statusBarHeight + maxHeight,
              duration: _duration,
              expanded: expanded,
              image: tournament.logo ?? tournament.banner ?? '',
            ),
            HeaderForeground(
              statusBarHeight: statusBarHeight,
              expanded: expanded,
              duration: _duration,
              tournament: tournament,
            )
          ],
        ),
      ),
    );
  }
}

class HeaderBackground extends StatelessWidget {
  const HeaderBackground({
    Key? key,
    required Duration duration,
    required this.expanded,
    required this.image,
    required this.height,
  })  : _duration = duration,
        super(key: key);

  final Duration _duration;
  final bool expanded;
  final String image;
  final double height;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return SizedBox(
      height: height,
      child: Stack(
        children: [
          Positioned.fill(
            child: AnimatedOpacity(
              duration: _duration,
              opacity: expanded ? 1 : 0,
              child: AppImage(
                image: image,
                fit: BoxFit.none,
                placeholder: (context) {
                  return CustomShimmer(
                    child: Container(color: colorScheme.surface),
                  );
                },
                error: (_) {
                  return Image.asset(Images.tournamentPlaceholder);
                },
              ),
            ),
          ),
          Positioned.fill(
              child: BackdropFilter(
            filter: ui.ImageFilter.blur(
              sigmaX: 32,
              sigmaY: 32,
              // sigmaX: (tournament.startsAt / 10) % 100,
              // sigmaY: (tournament.startsAt / 100) % 100,
            ),
            child: AnimatedOpacity(
              duration: _duration,
              opacity: expanded ? 0.5 : 0,
              child: const ColoredBox(
                color: Colors.black,
              ),
            ),
          )),
        ],
      ),
    );
  }
}

class HeaderForeground extends StatelessWidget {
  const HeaderForeground({
    Key? key,
    required this.expanded,
    required Duration duration,
    required this.tournament,
    required this.statusBarHeight,
  })  : _duration = duration,
        super(key: key);

  final bool expanded;
  final Duration _duration;
  final TournamentDetails tournament;
  final double statusBarHeight;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 18,
        right: 18,
        top: MediaQuery.of(context).padding.top - statusBarHeight,
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          HeaderForegroundImage(
            expanded: expanded,
            duration: _duration,
            tournament: tournament,
          ),
          HeaderForegroundText(
            duration: _duration,
            expanded: expanded,
            tournament: tournament,
          ),
        ],
      ),
    );
  }
}

class HeaderForegroundText extends StatelessWidget {
  const HeaderForegroundText({
    Key? key,
    required Duration duration,
    required this.expanded,
    required this.tournament,
  })  : _duration = duration,
        super(key: key);

  final Duration _duration;
  final bool expanded;
  final TournamentDetails tournament;

  @override
  Widget build(BuildContext context) {
    final hasImage = tournament.logo != null || tournament.banner != null;

    return AnimatedContainer(
      duration: _duration,
      alignment: FractionalOffset(0, expanded ? 1 : 0.5),
      padding: EdgeInsets.only(
        left: expanded || !hasImage ? 5 : 65,
        bottom: 7,
        top: 7,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            tournament.name,
            style: TextStyles.title,
          ),
          const SizedBox(height: 6),
          Row(
            children: [
              Text(
                R.dateSpecifications.formatDM(tournament.startsAt),
                style: TextStyles.subTitle.copyWith(color: Colors.white),
              ),
              if (tournament.tournamentFormat != null) ...[
                const SizedBox(width: 10),
                Expanded(
                  child: Text(
                    tournament.tournamentFormat.stringValue(context),
                    style: TextStyles.subTitle.copyWith(color: Colors.white),
                  ),
                ),
              ]
            ],
          ),
        ],
      ),
    );
  }
}

class HeaderForegroundImage extends StatelessWidget {
  const HeaderForegroundImage({
    Key? key,
    required this.expanded,
    required Duration duration,
    required this.tournament,
  })  : _duration = duration,
        super(key: key);

  final bool expanded;
  final Duration _duration;
  final TournamentDetails tournament;

  @override
  Widget build(BuildContext context) {
    final hasImage = tournament.logo != null || tournament.banner != null;

    return AnimatedAlign(
      alignment: FractionalOffset(expanded ? 0.5 : 0, 0.45),
      duration: _duration,
      child: AnimatedContainer(
          alignment: Alignment.center,
          duration: _duration,
          height: expanded ? 87 : 50,
          width: expanded ? 87 : 50,
          child: !hasImage
              ? const SizedBox.shrink()
              : Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4),
                  child: AppImage(
                    image: tournament.logo ?? tournament.banner ?? '',
                    fit: BoxFit.scaleDown,
                    error: (_) {
                      return SizedBox.expand(
                        child: Container(
                          color: R.colors.inputBoxTextInitiative,
                          child: Icon(
                            Icons.help_center_outlined,
                            color: Colors.grey,
                            size: expanded ? 32 : 18,
                          ),
                        ),
                      );
                    },
                  ),
                )),
    );
  }
}
