import 'package:flutter/material.dart';

import '/ressources/ressources.dart';

class AProposScreen extends StatelessWidget {
  const AProposScreen({Key? key}) : super(key: key);

  static const String routeName = "/aproposScreen";

  static Route route() {
    return MaterialPageRoute(
        settings: const RouteSettings(name: routeName),
        builder: (_) => const AProposScreen());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            const Text('${AppStrings.applicationName} - ${AppStrings.about}'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              '${AppStrings.developpedBy} :',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8.0),
            Text(AppStrings.developperName),
            SizedBox(height: 8.0),
            Text(AppStrings.developperEmail),
            SizedBox(height: 8.0),
            Text(AppStrings.developperPhone),
            SizedBox(height: 8.0),
            Text(AppStrings.developperSite),
            SizedBox(height: 16.0),
            Text(
              AppStrings.developpedFor,
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8.0),
            Text(AppStrings.developpedForName),
            SizedBox(height: 8.0),
            Text(AppStrings.developpedForEmail),
            SizedBox(height: 8.0),
            Text(AppStrings.developpedForSite),
            Spacer(),
            Divider(),
            Align(
              alignment: Alignment.center,
              child: Text(
                '${AppStrings.version} : ${AppStrings.applicationVersion}',
              ),
            ),
            SizedBox(height: 16.0),
          ],
        ),
      ),
    );
  }
}
