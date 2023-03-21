import '/models/models.dart';

class OnboardingScreenViewModel {
  OnboardingScreenModel get onboardingScreenModel => OnboardingScreenModel(
        title: 'Bienvenue sur AMGM Glucare',
        description:
            'Notre application est conçue pour vous aider à mesurer le risque de jeûne chez les patients diabètiques selon l\'IDF-DAR 2021.',
        image: 'assets/images/onboarding_image.png',
      );
}
