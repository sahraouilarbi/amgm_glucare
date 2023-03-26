import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';

import '/screens/screens.dart';

class AppRouter {
  static Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case MainScreen.routeName:
        return MainScreen.route();
      case OnboardingScreen.routeName:
        return OnboardingScreen.route();
      case AProposScreen.routeName:
        return AProposScreen.route();
      case DescriptionScreen.routeName:
        return DescriptionScreen.route();
      case SettingsScreen.routeName:
        return SettingsScreen.route();
      default:
        return _errorRoute();
    }
  }

  static Route _errorRoute() {
    return MaterialPageRoute(
      builder: (context) => SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Text(
                '${AppLocalizations.of(context)!.applicationName} - ${AppLocalizations.of(context)!.error404}'),
          ),
          body: Center(
            child: Text(
                '${AppLocalizations.of(context)!.error404} : ${AppLocalizations.of(context)!.error404Description}'),
          ),
        ),
      ),
    );
  }
}
