import 'dart:ui' as ui show ImageFilter;

import 'package:fifa/r.dart';
import 'package:fifa/resources/resources.dart';
import 'package:fifa/src/common/widgets/app_image.dart';
import 'package:fifa/src/common/widgets/custom_shimmer.dart';
import 'package:fifa/src/common/widgets/stack_inkwell.dart';
import 'package:flutter/material.dart';

/// A Widget that displays a blurred background of the provided [imageSrc]
/// And that image in the foreground at the top of the widget.
/// At the bottom it has a Tile displaying misc data.
class FrostedImageCard extends StatelessWidget {
  final String? imageSrc;
  final Widget? title;
  final Widget? subTitle;
  final Widget details;
  final VoidCallback? onTap;
  final double? height;
  final int detailsFlex;
  final int imageFlex;
  final Size? imageSize;

  const FrostedImageCard({
    Key? key,
    this.title,
    required this.details,
    this.imageSrc,
    this.onTap,
    this.height,
    this.subTitle,
    this.detailsFlex = 3,
    this.imageFlex = 5,
    this.imageSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final hasImage = imageSrc != null;

    return SizedBox(
      height: height,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(4),
        child: StackInkWell(
            onTap: onTap,
            borderRadius: const BorderRadius.all(Radius.circular(4)),
            background: BlurredAppImage(imageUrl: imageSrc),
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Flexible(
                    flex: imageFlex,
                    child: !hasImage
                        ? const SizedBox.expand()
                        : Padding(
                            padding: const EdgeInsets.symmetric(vertical: 14),
                            child: AppImage(
                              image: imageSrc,
                              fit: BoxFit.cover,
                              imageSize: imageSize,
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
                  if (title != null || subTitle != null)
                    Flexible(
                      flex: 2,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Flexible(
                            child: Padding(
                              padding: const EdgeInsets.only(left: 15),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  if (subTitle != null)
                                    DefaultTextStyle.merge(
                                      child: subTitle!,
                                      maxLines: 1,
                                      overflow: TextOverflow.fade,
                                      style: TextStyles.subTitle.copyWith(color: Colors.white),
                                    ),
                                  if (title != null) ...[
                                    const SizedBox(height: 6),
                                    DefaultTextStyle.merge(
                                        child: title!,
                                        style: TextStyles.title,
                                        maxLines: 1,
                                        overflow: TextOverflow.fade),
                                  ]
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  Flexible(
                    flex: detailsFlex,
                    child: ColoredBox(
                      color: R.colors.menuBarBackground,
                      child: details,
                    ),
                  ),
                ],
              )
            ]),
      ),
    );
  }
}

class BlurredAppImage extends StatelessWidget {
  final String? imageUrl;

  const BlurredAppImage({Key? key, required this.imageUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return ImageFiltered(
        imageFilter: ui.ImageFilter.blur(sigmaX: 30, sigmaY: 30,tileMode: TileMode.decal),
        child: AppImage(
          colorBlendMode: BlendMode.darken,
          color: Colors.black.withOpacity(0.5),
          image: imageUrl,
          fit: BoxFit.none,
          placeholder: (context) {
            return CustomShimmer(
              child: ColoredBox(color: colorScheme.surface),
            );
          },
          error: (_) {
            return Image.asset(
              Images.tournamentPlaceholder,
              colorBlendMode: BlendMode.darken,
              color: Colors.black.withOpacity(0.5),
            );
          },
        ));
  }
}
