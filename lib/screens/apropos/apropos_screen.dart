import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';

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
        title: Text(
            '${AppLocalizations.of(context)!.applicationName} - ${AppLocalizations.of(context)!.about}'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '${AppLocalizations.of(context)!.developpedBy} :',
              style: const TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8.0),
            Text(AppLocalizations.of(context)!.developperName),
            const SizedBox(height: 8.0),
            Text(
              AppLocalizations.of(context)!.developperEmail,
              textDirection: TextDirection.ltr,
            ),
            const SizedBox(height: 8.0),
            Text(
              AppLocalizations.of(context)!.developperPhone,
              textDirection: TextDirection.ltr,
            ),
            const SizedBox(height: 8.0),
            Text(
              AppLocalizations.of(context)!.developperSite,
              textDirection: TextDirection.ltr,
            ),
            const SizedBox(height: 16.0),
            Text(
              AppLocalizations.of(context)!.developpedFor,
              style: const TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8.0),
            Text(AppLocalizations.of(context)!.developpedForName),
            const SizedBox(height: 8.0),
            Text(
              AppLocalizations.of(context)!.developpedForEmail,
              textDirection: TextDirection.ltr,
            ),
            const SizedBox(height: 8.0),
            Text(
              AppLocalizations.of(context)!.developpedForSite,
              textDirection: TextDirection.ltr,
            ),
            const Spacer(),
            const Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '${AppLocalizations.of(context)!.version} : ',
                ),
                Text(
                  AppLocalizations.of(context)!.versionNumber,
                  textDirection: TextDirection.ltr,
                ),
              ],
            ),
            const SizedBox(height: 16.0),
          ],
        ),
      ),
    );
  }
}
