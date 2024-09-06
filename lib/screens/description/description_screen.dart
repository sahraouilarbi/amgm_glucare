import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';

class DescriptionScreen extends StatelessWidget {
  const DescriptionScreen({super.key});

  static const String routeName = "/descriptionScreen";

  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (_) => const DescriptionScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '${AppLocalizations.of(context)!.applicationName} - ${AppLocalizations.of(context)!.description}',
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Text(
                AppLocalizations.of(context)!.descriptionLong,
                style: const TextStyle(height: 1.5),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
