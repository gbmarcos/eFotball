#! /usr/bin/env dart

import 'dart:convert';

import 'dart:io';

void main() async {
  try {
    final missingTranslations = jsonDecode(File('missing_translations.txt').readAsStringSync()) as Map<String, dynamic>;
    final englishTranslation =
        jsonDecode(File('lib/resources/l10n/arb/app_en.arb').readAsStringSync()) as Map<String, dynamic>;
    final keys = (missingTranslations['sv'] as List<dynamic>).cast<String>();
    final missingTranslationsWithMessages = <String, String>{};
    for (final missingTranslation in keys) {
      missingTranslationsWithMessages[missingTranslation] = '${englishTranslation[missingTranslation]}';
    }

    final missingTranslationsWithMessagesFile = await File('missing_translations_with_messages.json').create();
    await missingTranslationsWithMessagesFile.writeAsString(jsonEncode(missingTranslationsWithMessages));
  } catch (e) {
    print(e);
    exit(1);
  }
  exit(0);
}
