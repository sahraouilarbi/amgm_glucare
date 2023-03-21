import 'package:flutter/material.dart';

import '/screens/main/main_screen.dart';
import '/screens/widgets/my_button.dart';
import 'onboarding_screen_viewmodel.dart';

class OnboardingScreen extends StatelessWidget {
  final viewModel = OnboardingScreenViewModel();

  OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Text(
                  viewModel.onboardingScreenModel.title,
                  style: const TextStyle(fontSize: 24),
                ),
                const SizedBox(height: 16.0),
                Text(
                  viewModel.onboardingScreenModel.description,
                  style: const TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 16.0),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.75,
                  child: Image.asset(
                    viewModel.onboardingScreenModel.image,
                    fit: BoxFit.cover,
                  ),
                ),
                MyButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const MainScreen(),
                      ),
                    );
                  },
                  text: 'Commencer',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
