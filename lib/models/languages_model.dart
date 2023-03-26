import 'package:flutter/foundation.dart' show immutable;

@immutable
class Language {
  final int id;
  final String name;
  final String languageCode;

  const Language({
    required this.id,
    required this.name,
    required this.languageCode,
  });

  static List<Language> languageList() {
    return const <Language>[
      Language(id: 1, name: "English", languageCode: "en"),
      Language(id: 2, name: "Français", languageCode: "fr"),
      Language(id: 3, name: "العربية", languageCode: "ar"),
    ];
  }
}
