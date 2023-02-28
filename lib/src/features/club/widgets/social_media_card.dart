import 'dart:math' as math;

import 'package:cached_network_image/cached_network_image.dart';
import 'package:fifa/r.dart';
import 'package:fifa/src/common/extensions.dart';
import 'package:fifa/src/features/club/model/social_media.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:linkfy_text/linkfy_text.dart';
import 'package:url_launcher/url_launcher.dart';

class SocialMediaList extends StatelessWidget {
  final Iterable<SocialMedia> posts;

  const SocialMediaList({Key? key, required this.posts}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints.loose(const Size(double.infinity, 443)),
      child: AlignedGridView.count(
        crossAxisCount: 1,
        scrollDirection: Axis.horizontal,
        itemCount: posts.length,
        itemBuilder: (BuildContext context, int i) =>
            Align(alignment: Alignment.topCenter, child: SocialMediaCard(post: posts.elementAt(i))),
      ),
    );
  }
}

extension SocialMediaPlatformX on SocialMediaPlatform {
  IconData get iconData {
    switch (this) {
      case SocialMediaPlatform.instagram:
        return FontAwesomeIcons.instagram;
      case SocialMediaPlatform.twitter:
        return FontAwesomeIcons.twitter;
    }
  }
}

class SocialMediaCard extends StatelessWidget {
  final SocialMedia post;

  const SocialMediaCard({Key? key, required this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final secondaryColor = Theme.of(context).colorScheme.secondary;
    return ConstrainedBox(
      constraints: BoxConstraints.tightForFinite(width: math.min(MediaQuery.of(context).size.width * .8, 230)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 6),
        child: GestureDetector(
          onTap: () {
            launch(post.url);
          },
          child: Card(
            shape: RoundedRectangleBorder(borderRadius: R.shapes.radius_4),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (post.image != null)
                  ConstrainedBox(
                    constraints: BoxConstraints.loose(Size(MediaQuery.of(context).size.width * .8, 247)),
                    child: CachedNetworkImage(
                      imageUrl: post.image!,
                      // memCacheHeight: 247,
                      // memCacheWidth: (MediaQuery.of(context).size.width * .8).toInt(),
                      fit: BoxFit.cover,
                      placeholder: (_, __) => const SizedBox.shrink(),
                    ),
                  ),
                Flexible(
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Flexible(
                          child: LinkifyText(
                            (post.content ?? '') * 2,
                            linkStyle: TextStyle(color: secondaryColor),
                            linkTypes: const [LinkType.userTag, LinkType.hashTag],
                            textStyle: TextStyles.subTitle.copyWith(color: Colors.white, fontSize: 14, wordSpacing: 2),
                            maxLines: 8,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        const SizedBox(height: 12),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              R.dateSpecifications.localizeMD(post.inserted, context),
                              style: TextStyles.poppins.copyWith(fontSize: 11, color: secondaryColor),
                            ),
                            FaIcon(post.platform.iconData, color: secondaryColor),
                          ],
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class SocialMediaSection extends StatefulWidget {
  final Iterable<SocialMedia> posts;

  const SocialMediaSection({Key? key, required this.posts}) : super(key: key);

  @override
  _SocialMediaSectionState createState() => _SocialMediaSectionState();
}

class _SocialMediaSectionState extends State<SocialMediaSection> {
  SocialMediaPlatform? selectedSocialMedia;
  late Iterable<SocialMedia> filteredPosts = widget.posts;

  @override
  Widget build(BuildContext context) {
    if (selectedSocialMedia == null) {
      filteredPosts = [...widget.posts];
    } else {
      filteredPosts = widget.posts.where((element) => element.platform == selectedSocialMedia);
    }

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 15, right: 13),
          child: SocialMediaHeaderFilter(
            selected: selectedSocialMedia,
            onSocialMediaSelected: (sm) {
              setState(() {
                selectedSocialMedia = sm;
              });
            },
          ),
        ),
        const SizedBox(height: 13),
        AnimatedSwitcher(
          duration: const Duration(milliseconds: 200),
          child: filteredPosts.isNotEmpty
              ? SocialMediaList(posts: filteredPosts)
              : Padding(
                  padding: const EdgeInsets.all(8),
                  child: Text(context.l10n.noPosts),
                ),
        )
      ],
    );
  }
}

typedef SelectSocialMediaFilterFunction = Function(SocialMediaPlatform? sm);

class SocialMediaHeaderFilter extends StatelessWidget {
  /// The selected social media platform, if null, all is selected
  final SocialMediaPlatform? selected;
  final SelectSocialMediaFilterFunction onSocialMediaSelected;

  const SocialMediaHeaderFilter({Key? key, this.selected, required this.onSocialMediaSelected}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final selectedColor = Theme.of(context).colorScheme.onPrimary;
    final unselectedColor = Theme.of(context).colorScheme.secondary;

    return Row(
      children: [
        const SizedBox(width: 6),
        Text(context.l10n.social, style: TextStyles.h2Bold),
        const SizedBox(width: 12),
        _SocialMediaFilterButton(
          color: selected == null ? selectedColor : unselectedColor,
          selected: selected == null,
          onTap: () {
            onSocialMediaSelected(null);
          },
          icon: const FaIcon(FontAwesomeIcons.thLarge),
        ),
        const SizedBox(width: 0),
        _SocialMediaFilterButton(
          color: selected == SocialMediaPlatform.twitter ? selectedColor : unselectedColor,
          icon: const FaIcon(FontAwesomeIcons.twitter),
          onTap: () {
            onSocialMediaSelected(SocialMediaPlatform.twitter);
          },
          selected: selected == SocialMediaPlatform.twitter,
        ),
        const SizedBox(width: 0),
        _SocialMediaFilterButton(
          onTap: () {
            onSocialMediaSelected(SocialMediaPlatform.instagram);
          },
          color: selected == SocialMediaPlatform.instagram ? selectedColor : unselectedColor,
          selected: selected == SocialMediaPlatform.instagram,
          icon: const FaIcon(FontAwesomeIcons.instagram),
        ),
      ],
    );
  }
}

class _SocialMediaFilterButton extends StatelessWidget {
  final Color color;
  final Widget icon;
  final VoidCallback? onTap;
  final bool selected;

  const _SocialMediaFilterButton({Key? key, required this.color, required this.icon, this.onTap, this.selected = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox.square(
      dimension: 59,
      child: Card(
        shape: const CircleBorder(),
        child: Center(
          child: IconButton(
            splashRadius: 25,
            color: color,
            iconSize: selected ? 20 : 28,
            onPressed: onTap,
            icon: icon,
          ),
        ),
      ),
    );
  }
}
