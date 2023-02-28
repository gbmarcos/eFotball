import 'package:fifa/r.dart';
import 'package:fifa/src/common/extensions.dart';
import 'package:fifa/src/common/widgets/app_image.dart';
import 'package:fifa/src/common/widgets/custom_shimmer.dart';
import 'package:fifa/src/features/club/model/club.dart';
import 'package:flutter/material.dart';
import 'package:routemaster/routemaster.dart';

class ClubCardSmall extends StatelessWidget {
  final Club club;

  const ClubCardSmall({Key? key, required this.club}) : super(key: key);

  static Widget loading({Key? key}) => const _LoadingClubCardSmall();

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Routemaster.of(context).pushWithScope(R.routeNames.clubDetailsWithId('${club.id}'),
            value: club,);
      },
      child: SizedBox(
        width: 128,
        child: Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Hero(
              tag: club.slug,
              child: AppImage(
                imageSize: const Size.square(80),
                image: club.logo,
                placeholder: (_) => const SizedBox(height: 60, width: 60),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _LoadingClubCardSmall extends StatelessWidget {
  const _LoadingClubCardSmall({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomShimmer(
      key: const ValueKey('loadingCLubCard'),
      child: SizedBox(
        width: 128,
        child: Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
          child: const Padding(
            padding: EdgeInsets.all(20),
          ),
        ),
      ),
    );
  }
}

class ClubListTile extends StatelessWidget {
  final Club club;

  const ClubListTile({Key? key, required this.club}) : super(key: key);
  static Widget loading({Key? key}) => const _LoadingCluListTile();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 97,
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 17),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 21, bottom: 16),
                child: Hero(
                  tag: club.slug,
                  child: AppImage(
                      image: club.logo,
                      imageSize: const Size.square(60),
                      placeholder: (_) => const SizedBox(height: 60, width: 60)),
                ),
              ),
              const SizedBox(width: 10),
              Text(club.name, style: TextStyles.h2Medium.copyWith(color: Colors.white))
            ],
          ),
        ),
      ),
    );
  }
}

class _LoadingCluListTile extends StatelessWidget {
  const _LoadingCluListTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomShimmer(
      key: const ValueKey('loadingCLubListTile'),
      child: SizedBox(
        height: 97,
        child: Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
          child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 17),
          ),
        ),
      ),
    );
  }
}
