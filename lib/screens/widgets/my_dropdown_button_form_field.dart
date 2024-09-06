import 'package:flutter/material.dart';

class MyDropdownButtonFormField extends StatelessWidget {
  const MyDropdownButtonFormField({
    required this.formFieldStateKey,
    required this.label,
    this.value,
    required this.items,
    required this.onChanged,
    super.key,
  });
  final GlobalKey<FormFieldState> formFieldStateKey;
  final String label;
  final String? value;
  final List<DropdownMenuItem<String>>? items;
  final void Function(String?)? onChanged;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      key: formFieldStateKey,
      decoration: InputDecoration(
        labelText: label,
        border: const OutlineInputBorder(),
      ),
      value: value,
      items: items,
      isExpanded: true,
      onChanged: onChanged,
      validator: (String? value) {
        if (value == '') {
          return "can't be empty";
        } else {
          return null;
        }
      },
    );
  }
}
