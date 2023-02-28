import 'dart:ui' as ui show ImageFilter;

import 'package:async_data_bloc/async_data_bloc.dart';
import 'package:collection/collection.dart';
import 'package:fifa/r.dart';
import 'package:fifa/resources/resources.dart';
import 'package:fifa/src/app/keys.dart';
import 'package:fifa/src/common/domain/tournament/tournament.dart';
import 'package:fifa/src/common/extensions.dart';
import 'package:fifa/src/common/widgets/app_image.dart';
import 'package:fifa/src/common/widgets/appendable_list.dart';
import 'package:fifa/src/common/widgets/custom_form_button.dart';
import 'package:fifa/src/common/widgets/custom_shimmer.dart';
import 'package:fifa/src/common/widgets/exception_widget.dart';
import 'package:fifa/src/common/widgets/frosted_image_card.dart';
import 'package:fifa/src/features/home/home_page.dart';
import 'package:fifa/src/features/tournaments/collection/model/tournament_collection.dart';
import 'package:fifa/src/features/tournaments/model/tournament.dart';
import 'package:flutter/material.dart';
import 'package:routemaster/routemaster.dart';

const double _kTournamentCardHeight = 209;
const double _kLiveNowTournamentCardHeight = 300;
const double _kTournamentCardSeparatorHeight = 19;

class AsyncTournamentSection extends StatefulWidget {
  final AsyncCubit<List<TournamentInterface>> tournamentsAndCollections;

  const AsyncTournamentSection({Key? key, required this.tournamentsAndCollections}) : super(key: key);

  @override
  State<AsyncTournamentSection> createState() => _AsyncTournamentSectionState();
}

class _AsyncTournamentSectionState extends State<AsyncTournamentSection>
    with AutomaticKeepAliveClientMixin<AsyncTournamentSection> {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return AsyncCubitBuilder<List<TournamentInterface>>(
        key: Keys.tournamentsHomeSection,
        bloc: widget.tournamentsAndCollections,
        builder: (context, data) => Padding(
              padding: const EdgeInsets.symmetric(horizontal: 19.0),
              child: data.maybeMap(
                  data: (d) {
                    //obtain live now tournament

                    final tournaments = d.value;

                    final sortedList = tournaments.sorted(
                      (a, b) => b.startsAt.compareTo(a.startsAt),
                    );

                    return TournamentsList(
                      prepend: const SizedBox.square(dimension: 23),
                      append: const SvenskaHomePartner(),
                      key: const ValueKey('TournamentList'),
                      tournaments: sortedList,
                    );
                  },
                  error: (e) => NetworkExceptionWidget(
                        refresh: widget.tournamentsAndCollections.refresh,
                        text: e.toString(),
                      ),
                  orElse: TournamentsList.loading),
            ));
  }
}

class TournamentsList extends StatelessWidget {
  final List<TournamentInterface> tournaments;
  final Widget? prepend;
  final Widget? append;


  const TournamentsList({Key? key, required this.tournaments, this.prepend, this.append}) : super(key: key);

  static Widget loading({Key? key}) => const _LoadingTournamentSection();

  @override
  Widget build(BuildContext context) {
    return AppendableList(
      key: Keys.tournamentList,
        prepend: prepend,
        append: append,
        animated: true,
        itemBuilder: (_, i) {
          final tournament = tournaments[i];
          return Padding(
            padding: const EdgeInsets.only(bottom: _kTournamentCardSeparatorHeight),
            child: TournamentCard(key: ValueKey(tournament.id), tournament: tournament),
          );
        },
        itemCount: tournaments.length);
  }
}

class _LoadingTournamentSection extends StatelessWidget {
  const _LoadingTournamentSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // return SizedBox.shrink();
    return ListView.separated(
      shrinkWrap: true,
      itemCount: 10,
      itemBuilder: (_, i) => CustomShimmer(
        child: ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(4)),
          child: Container(
            color: Colors.black12.withOpacity(1),
            height: _kTournamentCardHeight,
            width: double.infinity,
          ),
        ),
      ),
      separatorBuilder: (BuildContext context, int index) => const SizedBox(height: _kTournamentCardSeparatorHeight),
    );
  }
}

class TournamentCard extends StatelessWidget {
  final TournamentInterface tournament;

  const TournamentCard({
    Key? key,
    required this.tournament,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return FrostedImageCard(
      imageSize: const Size.square(87),
      height: _kTournamentCardHeight,
      imageSrc: tournament.logo ?? tournament.banner,
      subTitle: Text(
        R.dateSpecifications.formatDM(tournament.startsAt),
      ),
      title: Text(
        tournament.name,
        style: TextStyles.title,
      ),
      onTap: () {
        if (tournament is Tournament) {
          Routemaster.of(context).pushWithScope(
            R.routeNames.tournamentDetailsWithId('${tournament.id}'),
            value: tournament,
          );
        } else if (tournament is TournamentCollection) {
          Routemaster.of(context).pushWithScope(
            R.routeNames.tournamentCollectionDetailsWithId('${tournament.id}'),
            value: tournament,
          );
        }
      },
      details: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (tournament.slots != null)
            Padding(
              padding: const EdgeInsets.only(left: 15, top: 6),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(context.l10n.slots, style: TextStyles.title.copyWith(color: colorScheme.primary, fontSize: 13)),
                  const SizedBox(height: 4),
                  Text('${tournament.participants}/${tournament.slots}',
                      style: TextStyles.subTitle.copyWith(color: Colors.white))
                ],
              ),
            ),
          Padding(
            padding: const EdgeInsets.only(left: 18, top: 6),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(context.l10n.format, style: TextStyles.title.copyWith(color: colorScheme.primary, fontSize: 13)),
                const SizedBox(height: 4),
                Text(
                    tournament.isCollection ? context.l10n.collection : tournament.tournamentFormat!.localized(context),
                    style: TextStyles.subTitle.copyWith(color: Colors.white))
              ],
            ),
          ),
          const Spacer(),
          SizedBox(
            width: 105,
            child: Padding(
              padding: const EdgeInsets.only(right: 13, bottom: 12, top: 16),
              child: CustomFormButton(
                onTap: () {},
                buttonText: context.l10n.view,
                textColor: Colors.white,
                outlined: true,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class LiveNowTournamentCard extends StatelessWidget {
  const LiveNowTournamentCard({
    Key? key,
    required this.tournament,
  }) : super(key: key);

  final TournamentInterface tournament;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final image = tournament.logo ?? tournament.banner;

    return InkWell(
      key: Keys.liveNowTournamentCard,
      onTap: () {
        if (tournament is Tournament) {
          Routemaster.of(context).pushWithScope(
            R.routeNames.tournamentDetailsWithId('${tournament.id}'),
            value: tournament,
          );
        } else if (tournament is TournamentCollection) {
          Routemaster.of(context).pushWithScope(
            R.routeNames.tournamentCollectionDetailsWithId('${tournament.id}'),
            value: tournament,
          );
        }
      },
      child: SizedBox(
        height: _kLiveNowTournamentCardHeight,
        child: ClipRRect(
          borderRadius: R.shapes.radius_4,
          child: Stack(
            fit: StackFit.passthrough,
            children: [
              Positioned.fill(
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
              Positioned.fill(
                  top: -2, //Strange artifact not applying the filter to the top 2 pixels
                  child: BackdropFilter(
                    filter: ui.ImageFilter.blur(
                      sigmaX: 32,
                      sigmaY: 32,
                      // sigmaX: (tournament.startsAt / 10) % 100,
                      // sigmaY: (tournament.startsAt / 100) % 100,
                    ),
                    child: ColoredBox(
                      color: Colors.black.withOpacity(0.5),
                    ),
                  )),
              Positioned.fill(
                child: Column(
                  children: [
                    Expanded(
                      child: image == null
                          ? const SizedBox.expand()
                          : Align(
                              alignment: Alignment.topCenter,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(vertical: 30),
                                child: AppImage(
                                  image: image,
                                  imageSize: const Size.square(140),
                                  fit: BoxFit.scaleDown,
                                  placeholder: (context) => const SizedBox.expand(),
                                  error: (_) {
                                    return SizedBox.expand(
                                      child: Container(
                                        color: R.colors.inputBoxTextInitiative,
                                        child: const Icon(
                                          Icons.help_center_outlined,
                                          color: Colors.grey,
                                          size: 32,
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ),
                    ),
                    Text(
                      context.l10n.liveNow,
                      style: TextStyle(
                        color: context.theme.colorScheme.secondary,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      tournament.name,
                      style: const TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 15),
                    SizedBox(
                      width: 170,
                      height: 44,
                      child: IgnorePointer(
                        child: CustomFormButton(
                          onTap: () {},
                          buttonText: context.l10n.joinEvent,
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

extension TournamentPresentationX on TournamentFormat {
  String localized(BuildContext context) {
    switch (this) {
      case TournamentFormat.matchmaking:
        return context.l10n.tournamentFormatMatchmaking;
      case TournamentFormat.singleElimination:
        return context.l10n.tournamentFormatSingleElimination;
      case TournamentFormat.swissSystem:
        return context.l10n.tournamentFormatSwissSystem;
      case TournamentFormat.roundRobin:
        return context.l10n.tournamentFormatRoundRobin;
      case TournamentFormat.stages:
        return context.l10n.tournamentFormatStages;
    }
  }
}
