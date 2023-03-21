import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            SizedBox(height: 50.0),
            Text(
              'A Propos',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18.0,
              ),
            ),
            Text('Développer par : Sahraoui Larbi'),
            Text(
                'Pour le compte de:\nl\'Association des Médecins Généraliste de la Wilaya de Mostaganem'),
            Divider(),
            Text(
                'Toutes les recommandations présentées dans cette application sont tirées des lignes directrices de l\'IDF-DAR 2021'),
            Spacer(),
            Divider(),

            Text(
              'mgmostaganem.net',
              textAlign: TextAlign.center,
            ),
            Text(
              '(c) AMGM 2023 - Version 1.0.0+1',
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
