import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';

const String LANGUAGE_CODE = 'languageCode';

// Languages code
const String ENGLISH = 'en';
const String FRENCH = 'fr';
const String ARABIC = 'ar';

Future<Locale> setLocale(String languageCode) async{
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setString(LANGUAGE_CODE, languageCode);
  return _locale(languageCode);
}
Future<Locale> getLocale() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String languageCode = prefs.getString(LANGUAGE_CODE) ?? FRENCH;
  return _locale(languageCode);
}

Locale _locale(String languageCode){
  switch (languageCode){
    case ENGLISH:
      return const Locale(ENGLISH, '');
    case FRENCH:
      return const Locale(FRENCH, '');
    case ARABIC:
      return const Locale(ARABIC, '');
    default:
      return const Locale(FRENCH, '');
  }
}
AppLocalizations translation(BuildContext context){
  return AppLocalizations.of(context)!;
}