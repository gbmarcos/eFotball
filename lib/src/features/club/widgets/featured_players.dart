import 'package:async_data_bloc/async_data_bloc.dart';
import 'package:fifa/r.dart';
import 'package:fifa/resources/e_fotball_icons.dart';

import 'package:fifa/src/common/extensions.dart';
import 'package:fifa/src/common/widgets/app_image.dart';
import 'package:fifa/src/common/widgets/components/section_header.dart';
import 'package:fifa/src/common/widgets/stack_inkwell.dart';
import 'package:fifa/src/features/club/club_page_cubit.dart';
import 'package:fifa/src/features/club/model/org_featured_player.dart';
import 'package:fifa/src/features/login/signup/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:routemaster/routemaster.dart';

class FeaturedPlayersList extends StatelessWidget {
  final List<OrgFeaturedPlayer> featuredPlayers;

  const FeaturedPlayersList({Key? key, required this.featuredPlayers}) : super(key: key);
  //todo(Marcos)Test it
  void _navigateToPlayerDetails(BuildContext context, [OrgFeaturedPlayer? selectedPlayer]) {
    final title = '${context.read<ClubPageCubit>().selectedClub.state.valueOrNull?.name ?? ''} ${context.l10n.players}';
    late final List<OrgFeaturedPlayer> sortedFeaturedPlayers;
    if (selectedPlayer != null) {
      sortedFeaturedPlayers = {
        selectedPlayer,
        ...featuredPlayers.where((player) => player.id != selectedPlayer.id),
      }.toList();
    } else {
      sortedFeaturedPlayers = [...featuredPlayers];
    }

    Routemaster.of(context).pushWithScope(
      R.routeNames.playersDetails,
      queryParameters: {'title': title},
      value: sortedFeaturedPlayers,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 15, right: 17, top: 25, bottom: 5),
          child: SectionHeader(
            title: context.l10n.players,
            onTap: () => _navigateToPlayerDetails(context),
          ),
        ),
        SizedBox(
          height: 170,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: featuredPlayers.length + 1,
            itemBuilder: (_, i) {
              //Index increased in one in order to add spacing to the list.try
              // Padding does not does the trick because it will prevent the list Items
              // to scroll and be shown by the amount of padding it has
              if (i == 0) return const SizedBox(width: 20);
              final currentPlayer = featuredPlayers[i - 1];
              return Padding(
                padding: const EdgeInsets.only(right: 8),
                child: FeaturedPlayerSmallCard(
                  featuredPlayer: currentPlayer,
                  onTap: () => _navigateToPlayerDetails(context, currentPlayer),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

class FeaturedPlayerSmallCard extends StatelessWidget {
  final OrgFeaturedPlayer featuredPlayer;
  final VoidCallback? onTap;

  const FeaturedPlayerSmallCard({Key? key, required this.featuredPlayer, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const size = Size(140, 166);
    return SizedBox.fromSize(
      size: size,
      child: StackInkWell(
        borderRadius: R.shapes.radius_4,
        background: AppImage(
          image: featuredPlayer.image ?? '',
        ),
        onTap: onTap,
        children: [
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: ColoredBox(
              color: Theme.of(context).cardColor,
              child: Padding(
                padding: const EdgeInsets.all(5),
                child: Center(
                  child: Text(
                    featuredPlayer.username,
                    style: TextStyles.tab.copyWith(fontSize: 13, color: Theme.of(context).colorScheme.secondary),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class FeaturedPlayerMediumCard extends StatefulWidget {
  final OrgFeaturedPlayer featuredPlayer;

  const FeaturedPlayerMediumCard({Key? key, required this.featuredPlayer}) : super(key: key);

  @override
  State<FeaturedPlayerMediumCard> createState() => _FeaturedPlayerMediumCardState();
}

class _FeaturedPlayerMediumCardState extends State<FeaturedPlayerMediumCard> {
  late final birthDate = DateTime(
    widget.featuredPlayer.birthYear!,
    (widget.featuredPlayer.birthMonth ?? 0) + 1,
    widget.featuredPlayer.birthDay ?? 0,
  );
  late final int? age = widget.featuredPlayer.birthYear != null ? birthDate.calculateAge() : null;
  late final fullName = '${widget.featuredPlayer.firstName ?? ''} ${widget.featuredPlayer.lastName ?? ''}';

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 440,
      child: StackInkWell(
        background: Padding(
          padding: const EdgeInsets.only(bottom: 160.0, left: 40, right: 40),
          child: AppImage(
            alignment: Alignment.topCenter,
            image: widget.featuredPlayer.image ?? '',
            fit: BoxFit.fill,
          ),
        ),
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: SizedBox(
              height: 258,
              child: Card(
                clipBehavior: Clip.none,
                margin: const EdgeInsetsDirectional.only(top: 4, start: 4, end: 4),
                child: Padding(
                  padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.featuredPlayer.username,
                        style: TextStyles.h2Bold.copyWith(color: Theme.of(context).colorScheme.secondary),
                      ),
                      const SizedBox(height: 6),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(context.l10n.name),
                          Text(fullName.isEmpty ? context.l10n.notAvailableAcronym : fullName, maxLines: 2),
                        ].map((e) => Expanded(child: e)).toList(),
                      ),
                      const SizedBox(height: 6),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(context.l10n.age, maxLines: 1),
                          Text(age != null ? '$age' : context.l10n.notAvailableAcronym),
                        ].map((e) => Expanded(child: e)).toList(),
                      ),
                      const SizedBox(height: 6),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(context.l10n.dateOfBirth),
                          Text(
                            widget.featuredPlayer.birthYear != null
                                ? R.dateSpecifications.formatDMY(birthDate)
                                : context.l10n.notAvailableAcronym,
                            maxLines: 1,
                          ),
                        ].map((e) => Expanded(child: e)).toList(),
                      ),
                      const SizedBox(height: 6),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(context.l10n.nationality),
                          Text(countryNameFromId(widget.featuredPlayer.countryId) ?? context.l10n.notAvailableAcronym,
                              maxLines: 1),
                        ].map((e) => Expanded(child: e)).toList(),
                      ),
                      const SizedBox(height: 6),
                      Flexible(child: _StatisticsRow(stats: widget.featuredPlayer.stats))
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class _StatisticsRow extends StatefulWidget {
  final UserProfileStats stats;

  const _StatisticsRow({Key? key, required this.stats}) : super(key: key);

  @override
  State<_StatisticsRow> createState() => _StatisticsRowState();
}

class _StatisticsRowState extends State<_StatisticsRow> with SingleTickerProviderStateMixin {
  static const animationDuration = Duration(milliseconds: 900);

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Padding(
      padding: const EdgeInsets.only(top: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            child: Column(
              children: [
                Icon(EFotball.gamepad, size: 40, color: colorScheme.secondary),
                const SizedBox.square(dimension: 12),
                TweenAnimationBuilder(
                  duration: animationDuration,
                  tween: IntTween(begin: 0, end: widget.stats.matches),
                  builder: (BuildContext context, int value, Widget? child) {
                    return Text('$value', style: TextStyles.title);
                  },
                ),
                const SizedBox.square(dimension: 2),
                Text(context.l10n.played, style: TextStyles.subTitleSm.copyWith(color: Theme.of(context).hintColor)),
              ],
            ),
          ),
          Flexible(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (widget.stats.winRatio != null) ...[
                  RepaintBoundary(
                    child: TweenAnimationBuilder(
                      duration: animationDuration,
                      tween: Tween<double>(begin: 0, end: widget.stats.winRatio ?? 0),
                      builder: (BuildContext context, double value, Widget? child) {
                        return CircularProgressIndicator(value: value);
                      },
                    ),
                  ),
                  const SizedBox.square(dimension: 14)
                ],
                if (widget.stats.winRatio == null) ...[
                  const SizedBox.square(dimension: 4),
                  Text(context.l10n.notAvailableAcronym, style: TextStyles.title)
                ],
                if (widget.stats.winRatio != null)
                  TweenAnimationBuilder(
                    duration: animationDuration,
                    tween: Tween<double>(begin: 0, end: widget.stats.winPercentage),
                    builder: (BuildContext context, double value, Widget? child) {
                      return Text('${value.truncateToDecimals(1)}', style: TextStyles.title);
                    },
                  ),
                const SizedBox.square(dimension: 2),
                Text(context.l10n.winRate, style: TextStyles.subTitleSm.copyWith(color: Theme.of(context).hintColor)),
              ],
            ),
          ),
          Flexible(
            child: Column(
              children: [
                TweenAnimationBuilder(
                  duration: animationDuration,
                  tween: IntTween(begin: 0, end: widget.stats.wins),
                  builder: (BuildContext context, int value, Widget? child) {
                    return Text('$value', style: TextStyles.title);
                  },
                ),
                const SizedBox.square(dimension: 4),
                Text(context.l10n.wins, style: TextStyles.subTitleSm.copyWith(color: Theme.of(context).hintColor)),
              ],
            ),
          ),
          Flexible(
            child: Column(
              children: [
                TweenAnimationBuilder(
                  duration: animationDuration,
                  tween: IntTween(begin: 0, end: widget.stats.losses),
                  builder: (BuildContext context, int value, Widget? child) {
                    return Text('$value', style: TextStyles.title);
                  },
                ),
                const SizedBox.square(dimension: 4),
                Text(context.l10n.losses, style: TextStyles.subTitleSm.copyWith(color: Theme.of(context).hintColor)),
              ],
            ),
          )
        ],
      ),
    );
  }
}
