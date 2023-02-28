import 'package:fifa/r.dart';
import 'package:fifa/src/common/domain/user/user.dart';
import 'package:fifa/src/common/extensions.dart';
import 'package:fifa/src/common/widgets/app_image.dart';
import 'package:fifa/src/common/widgets/components/custom_circle_avatar.dart';
import 'package:fifa/src/common/widgets/components/custom_tab_bar.dart';
import 'package:fifa/src/common/widgets/components/section_header.dart';
import 'package:fifa/src/features/club/model/ranking.dart';
import 'package:fifa/src/features/club/model/user_ranked.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:routemaster/routemaster.dart';

class RankingSection extends StatelessWidget {
  final GameRanking gameRanking;

  const RankingSection({Key? key, required this.gameRanking}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (gameRanking.hasAnyNonNullRanking()) {
      return Column(
        children: [
          for (final game in Game.values)
            if (gameRanking.getRankingForGame(game) != null) ...[
              Padding(
                padding: const EdgeInsets.only(left: 4, top: 34, bottom: 11),
                child: SectionHeader(title: '${gameName(game)} ${context.l10n.ranking}'),
              ),
              DefaultTabController(
                  length: gameRanking.getRankingForGame(game)!.amountOfConsoles,
                  child: RankingTable(gameRanking.getRankingForGame(game)!)),
            ]
        ],
      );
    } else {
      return const SizedBox.shrink();
    }
  }
}

class RankingTable extends StatelessWidget {
  final Ranking ranking;

  const RankingTable(
    this.ranking, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            SizedBox(
              width: ranking.amountOfConsoles * 57,
              height: 37,
              child: CustomTabBar(tabs: [
                if (ranking.hasRankingForConsole(Console.playstation))
                  const Tab(child: FaIcon(FontAwesomeIcons.playstation)),
                if (ranking.hasRankingForConsole(Console.xbox)) const Tab(child: FaIcon(FontAwesomeIcons.xbox)),
              ]),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: ColoredBox(
                color: R.colors.tableScoreColor,
                child: SizedBox(
                  width: 92,
                  height: 34,
                  child: Center(child: Text(context.l10n.score)),
                ),
              ),
            ),
          ],
        ),
        _RankingTabView(
          tabController: DefaultTabController.of(context)!,
          ranking: ranking,
        )
      ],
    );
  }
}

class _RankingTabView extends StatefulWidget {
  const _RankingTabView({
    Key? key,
    required this.tabController,
    required this.ranking,
  }) : super(key: key);

  final TabController tabController;
  final Ranking ranking;

  @override
  _RankingTabViewState createState() => _RankingTabViewState();
}

class _RankingTabViewState extends State<_RankingTabView> {
  late final TabController tabController = widget.tabController;

  void _updateState() {
    if (tabController.indexIsChanging) {
      setState(() {});
    }
  }

  @override
  void initState() {
    super.initState();
    tabController.addListener(_updateState);
  }

  @override
  void dispose() {
    tabController.removeListener(_updateState);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    late int selectedRankingIndex;
    final tabController = DefaultTabController.of(context)!;
    if (widget.ranking.amountOfConsoles > 1) {
      if (tabController.index == Console.playstation.index) {
        selectedRankingIndex = Console.playstation.index - 1;
      } else if (tabController.index == Console.xbox.index) {
        selectedRankingIndex = Console.xbox.index + 1;
      }
    } else {
      if (widget.ranking.hasRankingForConsole(Console.playstation)) {
        selectedRankingIndex = Console.playstation.index; //  subtract one as the ordering of the tabs is inverted
        // in comparison to the enum in value
      } else if (widget.ranking.hasRankingForConsole(Console.xbox)) {
        selectedRankingIndex = Console.xbox.index; // same as above
      }
    }

    final selectedRanking = widget.ranking.ranking[selectedRankingIndex]!;

    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 200),
      child: Column(
        key: ValueKey('$selectedRankingIndex'),
        children: [
          //Here we transform the list as a Map iterable in order to get the index, needed for coloring
          for (var ranking in selectedRanking.asMap().entries)
            CustomTableRow(
              color: _rowColor(ranking.key + 1),
              userRanked: ranking.value,
              rankIndex: ranking.key + 1,
            )
        ],
      ),
    );
  }

  Color _rowColor(int i) {
    if (i % 2 == 0) return R.colors.tableRowEven;
    if (i % 2 == 1) return R.colors.tableRowOdd;
    return Colors.transparent;
  }
}

class CustomTableRow extends StatelessWidget {
  final UserRanked userRanked;
  final Color? color;
  final int rankIndex;
  const CustomTableRow({Key? key, required this.userRanked, this.color, required this.rankIndex}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final avatar = userRanked.avatar != null ? AppImage.provider(url: userRanked.avatar!) : null;
    final secondary = Theme.of(context).colorScheme.secondary;
    return Row(
      children: [
        SizedBox(
          width: 37,
          height: 45,
          child: ColoredBox(color: Colors.black, child: Center(child: Text('$rankIndex'))),
        ),
        Expanded(
          child: ListTile(
            onTap: () {
              if (userRanked.id == context.currentUser.id) {
                Routemaster.of(context).push(R.routeNames.profileSection);
              } else if (userRanked.id != null) {
                Routemaster.of(context).pushWithScope(
                  R.routeNames.profileDetailsWithId(userRanked.id!),
                  value: userRanked,
                );
              }
            },
            tileColor: color,
            leading: CustomCircleAvatar(backgroundImage: avatar),
            title: DefaultTextStyle.merge(child: Text(userRanked.username), style: TextStyle(color: secondary)),
            trailing: Text('${userRanked.elo}', style: TextStyles.subTitleSm),
          ),
        ),
      ],
    );
  }
}
