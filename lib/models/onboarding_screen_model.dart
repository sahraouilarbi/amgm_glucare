import 'package:flutter/foundation.dart' show immutable;

@immutable
class OnboardingScreenModel {
  final String title;
  final String description;
  final String image;

  const OnboardingScreenModel({
    required this.title,
    required this.description,
    required this.image,
  });
}
