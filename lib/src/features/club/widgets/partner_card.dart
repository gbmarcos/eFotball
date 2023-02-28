import 'package:fifa/resources/resources.dart';
import 'package:fifa/src/common/extensions.dart';
import 'package:fifa/src/common/widgets/components/section_header.dart';
import 'package:flutter/material.dart';

class PartnersSection extends StatelessWidget {
  final String? clubSlug;

  const PartnersSection({Key? key, this.clubSlug}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (clubSlug == null || (clubSlug != 'svff' && clubSlug != 'ois')) return const SizedBox.shrink();
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 17),
      child: Column(children: [
        Padding(padding: const EdgeInsets.only(left: 6, bottom: 9), child: SectionHeader(title: context.l10n.partners)),
        if (clubSlug == 'svff') ...[
          const MockPartnerCard(Images.partnerSvenskefotboll),
          const MockPartnerCard(Images.partnerCola),
          const MockPartnerCard(Images.partnerOwnit),
        ] else if (clubSlug == 'ois') ...[
          const MockPartnerCard(Images.partnerErnst),
          const MockPartnerCard(Images.partnerInet),
          const MockPartnerCard(Images.partnerYuncture),
          const MockPartnerCard(Images.partnerUmbro),
        ]
      ]),
    );
  }
}

class MockPartnerCard extends StatelessWidget {
  final String imageUrl;

  const MockPartnerCard(this.imageUrl, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: Card(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 40),
            child: Image.asset(
              imageUrl,
              height: 100,
              cacheHeight: 100,
            ),
          ),
        ),
      ),
    );
  }
}
