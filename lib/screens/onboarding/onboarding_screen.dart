import 'package:flutter/material.dart';

import 'onboarding_screen_viewmodel.dart';
import '/ressources/ressources.dart';
import '/screens/main/main_screen.dart';
import '/screens/widgets/my_button.dart';

class OnboardingScreen extends StatelessWidget {
  final viewModel = OnboardingScreenViewModel();

  OnboardingScreen({super.key});

  static const String routeName = "/onboardingScreen";

  static Route route() {
    return MaterialPageRoute(
        settings: const RouteSettings(name: routeName),
        builder: (_) => OnboardingScreen());
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
                  width: MediaQuery.of(context).size.width * 0.5,
                  child: Image.asset(
                    AppAssets.appLogo,
                    fit: BoxFit.cover,
                  ),
                ),
                Text(
                  viewModel.onboardingScreenModel.title,
                  style: const TextStyle(fontSize: 24),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.5,
                  child: Image.asset(
                    viewModel.onboardingScreenModel.image,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(height: 16.0),
                Text(
                  viewModel.onboardingScreenModel.description,
                  style: const TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 16.0),
                MyButton(
                  onPressed: () {
                    Navigator.pushNamed(context, MainScreen.routeName);
                  },
                  text: AppStrings.start,
                ),
                const SizedBox(height: 16.0),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
