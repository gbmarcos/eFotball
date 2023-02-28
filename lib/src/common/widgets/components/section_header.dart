import 'package:fifa/r.dart';
import 'package:fifa/src/app/keys.dart';
import 'package:flutter/material.dart';

/// Header that indicates the content  of a section.
/// Its [title] is styled white and its [subtitle] as the secondary color, with a smaller font.
class SectionHeader extends StatelessWidget {
  final String? title;
  final String? subtitle;
  final VoidCallback? onSubtitleTap;
  final EdgeInsetsGeometry? padding;
  final VoidCallback? onTap;

  const SectionHeader(
      {Key? key, Key? subtitleKey, this.title, this.subtitle, this.padding, this.onTap, this.onSubtitleTap})
      : assert(title != null || subtitle != null, 'At least one text to be displayed must be provided'),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: padding ?? const EdgeInsets.only(right: 22),
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          if (title != null) Text(title!, style: TextStyles.h2Bold.copyWith(color: Colors.white)),
          if (subtitle != null)
            TextButton(
                key: Keys.newsHeaderAllNews,
                onPressed: onSubtitleTap,
                child: Text(
                  subtitle!,
                  style: TextStyle(
                      fontSize: 14, fontWeight: FontWeight.w600, color: Theme.of(context).colorScheme.secondary),
                )),
        ]),
      ),
    );
  }
}
