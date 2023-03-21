import 'package:flutter/material.dart';

import '/ressources/ressources.dart';
import '/screens/screens.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            DrawerHeader(
              child: Image.asset(
                AppAssets.appLogo,
                width: 96.0,
              ),
            ),
            ListTile(
              title: const Text(
                AppStrings.description,
              ),
              trailing: const Icon(Icons.chevron_right_rounded),
              onTap: () {
                Navigator.pushNamed(
                  context,
                  DescriptionScreen.routeName,
                );
              },
            ),
            ListTile(
              title: const Text(
                AppStrings.about,
              ),
              trailing: const Icon(Icons.chevron_right_rounded),
              onTap: () {
                Navigator.pushNamed(
                  context,
                  AProposScreen.routeName,
                );
              },
            ),
            const Spacer(),
            const Divider(),
            const Text(
              AppStrings.developpedForEmail,
              textAlign: TextAlign.center,
            ),
            const Text(
              '(c) ${AppStrings.applicationName} 2023 - ${AppStrings.version} ${AppStrings.applicationVersion}',
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
