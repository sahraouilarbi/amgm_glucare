import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';

import '/config/version.dart';
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
              title: Text(
                AppLocalizations.of(context)!.description,
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
              title: Text(
                AppLocalizations.of(context)!.about,
              ),
              trailing: const Icon(Icons.chevron_right_rounded),
              onTap: () {
                Navigator.pushNamed(
                  context,
                  AProposScreen.routeName,
                );
              },
            ),
            ListTile(
              title: Text(
                AppLocalizations.of(context)!.settings,
              ),
              trailing: const Icon(Icons.chevron_right_rounded),
              onTap: () {
                Navigator.pushNamed(
                  context,
                  SettingsScreen.routeName,
                );
              },
            ),
            const Spacer(),
            const Divider(),
            Text(
              AppLocalizations.of(context)!.developpedForEmail,
              textAlign: TextAlign.center,
            ),
            Text(
              '(c) ${AppLocalizations.of(context)!.applicationName} 2023',
              textAlign: TextAlign.center,
            ),
            Text(
              '${AppLocalizations.of(context)!.version} : $versionNumber',
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
