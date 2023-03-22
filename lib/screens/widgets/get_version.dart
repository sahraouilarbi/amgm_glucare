import 'package:flutter/services.dart' show rootBundle;

Future<String> getVersion() async {
  final String contents = await rootBundle.loadString('pubspec.yaml');
  final RegExp regex = RegExp(r'version: (\d+\.\d+\.\d+)');
  final RegExpMatch? match = regex.firstMatch(contents);
  return match != null ? match.group(1).toString() : 'unknown';
}