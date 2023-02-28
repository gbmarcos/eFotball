import 'dart:developer';

import 'package:async_data_bloc/async_data_bloc.dart';

import 'package:fifa/src/app/dependency_injection.dart';
import 'package:fifa/src/app/keys.dart';
import 'package:fifa/src/common/domain/tournament/tournament.dart';
import 'package:fifa/src/common/exceptions.dart';
import 'package:fifa/src/common/extensions.dart';
import 'package:fifa/src/common/widgets/custom_search_field.dart';
import 'package:fifa/src/common/widgets/exception_widget.dart';
import 'package:fifa/src/features/tournaments/tournament_list_page_cubit.dart';
import 'package:fifa/src/features/tournaments/tournament_section.dart';
import 'package:fifa/src/notifications/notification_app_bar.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

class TournamentListPage extends StatelessWidget {
  const TournamentListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (context) =>
          TournamentListPageCubit(tournamentRepository: getIt(), tournamentCollectionRepository: getIt()),
      child: const _TournamentView(),
    );
  }
}

class _TournamentView extends StatefulWidget {
  const _TournamentView({Key? key}) : super(key: key);
  static const pagePadding = EdgeInsets.only(left: 15, right: 13);

  @override
  State<_TournamentView> createState() => _TournamentViewState();
}

class _TournamentViewState extends State<_TournamentView> {
  late final controller = TextEditingController();

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final pageState = context.read<TournamentListPageCubit>();
    return Scaffold(
        key: Keys.tournamentPage,
        appBar: NotificationAppBar(title: Text(context.l10n.tournamentsLabel)),
        body: RefreshIndicator(
          onRefresh: () async {
            pageState.featuredTournamentsAndCollections.refresh();
          },
          child: Padding(
            padding: _TournamentView.pagePadding,
            child: Column(
              children: [
                const SizedBox(height: 32),
                CustomSearchTextField(
                  controller: controller,
                  onChanged: (query) {
                    pageState.searchTournament(query.isNullOrEmpty ? null : query);
                  },
                  hintText: context.l10n.search,
                ),
                const SizedBox(height: 20),
                Expanded(
                  child: AsyncCubitBuilder<List<TournamentInterface>>(
                    bloc: pageState.featuredTournamentsAndCollections,
                    builder: (_, state) {
                      return state.maybeMap(
                        orElse: () => const SizedBox.shrink(),
                        data: (tournaments) {
                          final liveNowTournament =
                              pageState.liveNowTournament != null && pageState.tournamentQuery == null
                                  ? Padding(
                                      padding: const EdgeInsets.only(bottom: 19),
                                      child: LiveNowTournamentCard(tournament: pageState.liveNowTournament!),
                                    )
                                  : null;

                          return TournamentsList(
                            prepend: liveNowTournament,
                            tournaments: tournaments.value
                                .where((tournament) => tournament.id != pageState.liveNowTournament?.id)
                                .toList(),
                          );
                        },
                        loading: (_) => TournamentsList.loading(),
                        error: (e) {
                          final error = e.error;
                          if (error is NetworkException) {
                            return error.map(
                              (value) => const NetworkExceptionWidget(),
                              noDataException: (value) => NoElementsExceptionWidget(
                                text: context.l10n.noTournaments,
                              ),
                            );
                          } else {
                            if (kReleaseMode) {
                              Sentry.captureException(error, stackTrace: e.stackTrace);
                            } else {
                              log('${e.stackTrace}');
                              log('${e.error}');
                            }
                            return const UnexpectedExceptionWidget();
                          }
                        },
                      );
                    },
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
