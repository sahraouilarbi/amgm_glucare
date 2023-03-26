import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';

import '../../config/language_constants.dart';
import '/core/my_app.dart';
import '/models/languages_model.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  static const String routeName = "/settingsScreen";

  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (_) => const SettingsScreen(),
    );
  }

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
              '${AppLocalizations.of(context)!.applicationName} - ${AppLocalizations.of(context)!.settings}')),
      body: Center(
        child: DropdownButton<Language>(
          hint: Text(AppLocalizations.of(context)!.changeLanguage),
          items: Language.languageList()
              .map<DropdownMenuItem<Language>>(
                (e) => DropdownMenuItem<Language>(
                  value: e,
                  child: Text(e.name),
                ),
              )
              .toList(),
          onChanged: (Language? language) {
            if (language != null) {
              setLocale(language.languageCode).then(
                (locale) => MyApp.setLocale(context, locale),
              );
            }
          },
        ),
      ),
    );
  }
}
