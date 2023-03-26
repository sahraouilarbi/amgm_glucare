// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:amgm_glucare/screens/widgets/my_dropdown_button_form_field.dart';

void main() {
  group(
    'MyDropdownButtonFormField tests',
    () {
      testWidgets(
        'Dropdown menu items should match values',
        (WidgetTester tester) async {
          final pregnancyKey = GlobalKey<FormFieldState>();
          String? dropdownValue = '0.0';

          await tester.pumpWidget(
            MaterialApp(
              home: Scaffold(
                body: StatefulBuilder(
                  builder: (BuildContext context, StateSetter setState) {
                    return MyDropdownButtonFormField(
                      formFieldStateKey: pregnancyKey,
                      label: '10. Pregnancy',
                      value: dropdownValue,
                      items: const <DropdownMenuItem<String>>[
                        DropdownMenuItem<String>(
                          value: '6.5',
                          child: Text('Pregnant not within targets'),
                        ),
                        DropdownMenuItem<String>(
                          value: '3.5',
                          child: Text('Pregnant within targets'),
                        ),
                        DropdownMenuItem<String>(
                          value: '0.0',
                          child: Text('Not pregnant'),
                        ),
                      ],
                      onChanged: (value) {
                        setState(() {});
                        dropdownValue = value;
                      },
                      onSaved: (value) {},
                    );
                  },
                ),
              ),
            ),
          );

          expect(dropdownValue, '0.0');

          await tester.tap(find.text('Not pregnant'));
          await tester.pumpAndSettle();

          expect(dropdownValue, '0.0');

          // await tester.tap(find.text('Pregnant within targets'));
          // await tester.pumpAndSettle();

          // expect(dropdownValue, '3.5');

          await tester.tap(find.text('Pregnant not within targets'));
          await tester.pumpAndSettle();

          expect(dropdownValue, '6.5');
        },
      );
    },
  );
}
