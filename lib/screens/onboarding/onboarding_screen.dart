import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';

import '/ressources/ressources.dart';
import '/screens/main/main_screen.dart';
import '/screens/widgets/my_button.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  static const String routeName = "/onboardingScreen";

  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (_) => const OnboardingScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.33,
                  child: Image.asset(
                    AppAssets.appLogo,
                    fit: BoxFit.cover,
                  ),
                ),
                Text(
                  '${AppLocalizations.of(context)!.welcome}\n${AppLocalizations.of(context)!.applicationName}',
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 28),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.5,
                  child: Image.asset(
                    AppAssets.onboardingImage,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(height: 16.0),
                Text(
                  AppLocalizations.of(context)!.descriptionShort,
                  style: const TextStyle(fontSize: 16),
                ),
                Text(
                  AppLocalizations.of(context)!.multilangueAvailable,
                  style: const TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 16.0),
                MyButton(
                  onPressed: () {
                    Navigator.pushNamed(context, MainScreen.routeName);
                  },
                  text: AppLocalizations.of(context)!.start,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
