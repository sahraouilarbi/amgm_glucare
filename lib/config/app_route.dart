import 'package:flutter/material.dart';
import '/screens/screens.dart';
import '/ressources/ressources.dart';

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
      default:
        return _errorRoute();
    }
  }

  static Route _errorRoute() {
    return MaterialPageRoute(
      builder: (_) => SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: const Text('${AppStrings.applicationName} - ${AppStrings.error404}'),
          ),
          body: const Center(
            child: Text('${AppStrings.error404} : ${AppStrings.error404Description}'),
          ),
        ),
      ),
    );
  }
}
