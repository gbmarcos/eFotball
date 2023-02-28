import 'package:fifa/r.dart';
import 'package:fifa/resources/e_fotball_icons.dart';
import 'package:fifa/src/common/extensions.dart';
import 'package:flutter/material.dart';

class StatListTile extends StatelessWidget {
  final String value;
  final String label;
  final double? spacing;

  const StatListTile({
    Key? key,
    required this.value,
    required this.label,
    this.spacing = 6,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          value,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
        SizedBox.square(dimension: spacing),
        Text(
          label,
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w500,
            color: R.colors.inputBoxTextInitiative,
          ),
        ),
      ],
    );
  }
}

class WinRateStat extends StatelessWidget {
  final double? winRate;
  final Duration animationDuration;
  final Axis direction;
  final double? gap;
  final double iconSize;

  const WinRateStat(
      {Key? key,
      required this.winRate,
      this.animationDuration = const Duration(milliseconds: 800),
      this.direction = Axis.horizontal,
      this.gap = 10,
      this.iconSize = 24})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final winPercentage = winRate == null ? null : winRate! * 100;

    return _StatContainer(
      direction: direction,
      gap: gap,
      leading: RepaintBoundary(
        child: SizedBox.square(
          dimension: iconSize,
          child: TweenAnimationBuilder(
            duration: animationDuration,
            tween: Tween<double>(begin: 0, end: winRate ?? 0),
            builder: (_, double value, __) => CircularProgressIndicator(value: value, strokeWidth: 11),
          ),
        ),
      ),
      trailing: TweenAnimationBuilder(
        duration: animationDuration,
        tween: Tween<double>(begin: 0, end: winPercentage ?? 0),
        builder: (context, double value, _) =>
            StatListTile(value: '${value.truncateToDecimals(1)}  %', label: context.l10n.winRate),
      ),
    );
  }
}

class SkillStat extends StatelessWidget {
  final Duration animationDuration;
  final Axis direction;
  final double? gap;
  final int skill;
  final double iconSize;

  const SkillStat({
    Key? key,
    this.animationDuration = const Duration(milliseconds: 800),
    this.direction = Axis.horizontal,
    this.gap = 10,
    required this.skill,
    this.iconSize = 24,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _StatContainer(
      direction: direction,
      gap: gap,
      leading: Icon(EFotball.ball, color: context.theme.colorScheme.secondary, size: iconSize),
      trailing: TweenAnimationBuilder(
          duration: animationDuration,
          tween: IntTween(begin: 0, end: skill),
          builder: (context, value, __) => StatListTile(value: '$value', label: context.l10n.skill)),
    );
  }
}

class PlayedStat extends StatelessWidget {
  final Duration animationDuration;
  final Axis direction;
  final double? gap;
  final int gamesPlayed;
  final double iconSize;

  const PlayedStat(
      {Key? key,
      this.animationDuration = const Duration(milliseconds: 800),
      this.direction = Axis.horizontal,
      this.gap = 10,
      required this.gamesPlayed,
      this.iconSize = 24})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _StatContainer(
      direction: direction,
      gap: gap,
      leading: Icon(EFotball.gamepad, color: context.theme.colorScheme.secondary, size: iconSize),
      trailing: TweenAnimationBuilder(
          duration: animationDuration,
          tween: IntTween(begin: 0, end: gamesPlayed),
          builder: (context, value, __) => StatListTile(value: '$value', label: context.l10n.played)),
    );
  }
}

class _StatContainer extends StatelessWidget {
  final Widget leading;
  final Widget trailing;
  final Axis direction;
  final double? gap;

  const _StatContainer({
    Key? key,
    this.direction = Axis.horizontal,
    this.gap = 10,
    required this.leading,
    required this.trailing,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flex(
      mainAxisSize: MainAxisSize.min,
      direction: direction,
      children: [
        leading,
        SizedBox.square(dimension: gap),
        trailing,
      ],
    );
  }
}
