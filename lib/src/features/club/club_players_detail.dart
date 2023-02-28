import 'package:async_data_bloc/async_data_bloc.dart';

import 'package:fifa/src/common/extensions.dart';
import 'package:fifa/src/common/widgets/exception_widget.dart';
import 'package:fifa/src/features/club/club_page_cubit.dart';
import 'package:fifa/src/features/club/model/org_featured_player.dart';
import 'package:fifa/src/features/club/widgets/featured_players.dart';
import 'package:fifa/src/notifications/notification_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PlayersDetailPage extends StatelessWidget {
  final List<OrgFeaturedPlayer>? featuredPlayers;

  const PlayersDetailPage({Key? key, this.featuredPlayers}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final pageState = context.read<ClubPageCubit>();
    final title = '${pageState.selectedClub.state.valueOrNull?.name ?? ''} ${context.l10n.players}';
    if (featuredPlayers != null) {
      return PlayersDetailView(featuredPlayers: featuredPlayers!, title: title);
    }
    return AsyncCubitBuilder<List<OrgFeaturedPlayer>>(
        bloc: pageState.featuredPlayers,
        builder: (_, data) {
          Widget appWrapper(Widget child) => Scaffold(appBar: NotificationAppBar(title: Text(title)), body: child);

          return data.maybeMap(
              error: (error) => appWrapper(NetworkExceptionWidget(refresh: pageState.featuredPlayers.refresh)),
              data: (data) => PlayersDetailView(featuredPlayers: data.value, title: title),
              orElse: () => appWrapper(const CircularProgressIndicator.adaptive()));
        });
  }
}

class PlayersDetailView extends StatelessWidget {
  final String title;
  final List<OrgFeaturedPlayer>? featuredPlayers;

  const PlayersDetailView({
    Key? key,
    required this.title,
    this.featuredPlayers,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final players = featuredPlayers ?? context.fromSacco<List<OrgFeaturedPlayer>>()!;

    return Scaffold(
      appBar: NotificationAppBar(title: Text(title)),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18),
        child: ListView.separated(
          itemCount: players.length + 1,
          itemBuilder: (_, i) {
            //Index increased in one in order to add spacing to the list.try
            // Padding does not does the trick because it will prevent the list Items
            // to scroll and be shown by the amount of padding it has
            if (i == 0) return const SizedBox(width: 20);

            return FeaturedPlayerMediumCard(featuredPlayer: players[i - 1]);
          },
          separatorBuilder: (_, i) => const SizedBox(height: 26),
        ),
      ),
    );
  }
}
