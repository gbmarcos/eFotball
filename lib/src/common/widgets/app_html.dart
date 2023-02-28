import 'package:fifa/r.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:url_launcher/url_launcher.dart';

class AppHtml extends StatelessWidget {
  final String content;
  final Map<String, Style>? extraStyles;

  const AppHtml(
    this.content, {
    Key? key,
    this.extraStyles,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Html(
      data: content,
      onLinkTap: (url, context, attributes, element) {
        if (url != null) {
          launch(url);
        }
      },
      style: {
        'body': Style(
          padding: EdgeInsets.zero,
          margin: EdgeInsets.zero,
          fontSize:  FontSize.medium,
          lineHeight: LineHeight.em(1.5),
          fontWeight: FontWeight.w400,
          color: R.colors.htmlPTagColor,
        ),
        'p': Style(
          fontSize:  FontSize.medium,
          lineHeight: LineHeight.em(1.5),
          fontWeight: FontWeight.w400,
          color: R.colors.htmlPTagColor,
        ),
        ...?extraStyles
      },
    );
  }
}
