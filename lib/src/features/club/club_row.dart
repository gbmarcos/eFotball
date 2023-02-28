import 'package:async_data_bloc/async_data_bloc.dart';
import 'package:fifa/src/app/keys.dart';
import 'package:fifa/src/common/extensions.dart';
import 'package:fifa/src/common/widgets/components/section_header.dart';
import 'package:fifa/src/common/widgets/exception_widget.dart';
import 'package:fifa/src/features/club/model/club.dart';
import 'package:fifa/src/features/club/widgets/club_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:sliver_tools/sliver_tools.dart';

class AsyncClubSection extends StatelessWidget {
  final AsyncCubit<List<Club>> clubs;

  const AsyncClubSection({Key? key, required this.clubs}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AsyncCubitBuilder<List<Club>>(
      bloc: clubs,
      builder: (context, data) => data.maybeMap(
        data: (d) => ClubSection(d.value),
        error: (e) => const NetworkExceptionWidget(),
        orElse: ClubSection.loading,
      ),
    );
  }
}

class SliverAsyncClubSection extends StatelessWidget {
  final AsyncCubit<List<Club>> clubs;

  const SliverAsyncClubSection({Key? key, required this.clubs}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AsyncCubitBuilder<List<Club>>(
      bloc: clubs,
      builder: (context, data) => data.maybeMap(
        data: (d) => SliverClubSection(d.value),
        error: (e) => const SliverToBoxAdapter(child: NetworkExceptionWidget()),
        orElse: () => SliverToBoxAdapter(child: ClubSection.loading()),
      ),
    );
  }
}

class SliverClubSection extends AsyncWidget<List<Club>> {
  final List<Club> clubs;

  const SliverClubSection(this.clubs, {Key? key}) : super(key: key, data: clubs);

  static Widget loading({Key? key}) => const _LoadingClubSection();
  static const EdgeInsets leftPadding = EdgeInsets.only(left: 16);

  @override
  Widget build(BuildContext context) {
    return MultiSliver(
      key: Keys.clubHomeSection,
      children: [
        SliverPadding(
          padding: leftPadding + const EdgeInsets.only(top: 24),
          sliver: SliverToBoxAdapter(child: SectionHeader(title: context.l10n.clubs)),
        ),
        SliverToBoxAdapter(
          child: SizedBox(
            height: 116,
            child: ClubRow(clubs: clubs),
          ),
        ),
      ],
    );
  }
}

class ClubSection extends AsyncWidget<List<Club>> {
  final List<Club> clubs;

  const ClubSection(this.clubs, {Key? key}) : super(key: key, data: clubs);

  static Widget loading({Key? key}) => const _LoadingClubSection();
  static const EdgeInsets leftPadding = EdgeInsets.only(left: 16);

  @override
  Widget build(BuildContext context) {
    return Padding(
      key: Keys.clubHomeSection,
      padding: const EdgeInsets.only(top: 24),
      child: Column(
        children: [
          Padding(
            padding: leftPadding,
            child: SectionHeader(title: context.l10n.clubs),
          ),
          SizedBox(
            height: 116,
            child: ClubRow(clubs: clubs),
          ),
        ],
      ),
    );
  }
}

class _LoadingClubSection extends StatelessWidget {
  const _LoadingClubSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      key: Keys.clubHomeSection,
      padding: const EdgeInsets.only(left: 12, top: 24),
      child: Column(
        children: [
          SectionHeader(title: context.l10n.clubs),
          SizedBox(
            height: 116,
            child: ListView.separated(
              itemCount: 10,
              scrollDirection: Axis.horizontal,
              itemBuilder: (_, i) => Padding(
                padding: const EdgeInsets.only(left: 5),
                child: ClubCardSmall.loading(),
              ),
              separatorBuilder: (_, i) => const SizedBox(width: 6),
            ),
          ),
        ],
      ),
    );
  }
}

class ClubRow extends StatelessWidget {
  final List<Club> clubs;

  const ClubRow({Key? key, required this.clubs}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimationLimiter(
      child: ListView.separated(
        itemCount: clubs.length,
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.only(left: 16),
        itemBuilder: (_, i) => AnimationConfiguration.staggeredList(
          position: i,
          duration: const Duration(milliseconds: 275),
          child: SlideAnimation(
            horizontalOffset: 10,
            child: FadeInAnimation(
              child: RepaintBoundary(child: ClubCardSmall(club: clubs[i])),
            ),
          ),
        ),
        separatorBuilder: (_, i) => const SizedBox(width: 6),
      ),
    );
  }
}
