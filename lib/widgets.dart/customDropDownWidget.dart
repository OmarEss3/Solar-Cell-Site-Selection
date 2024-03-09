
  import 'package:flutter/material.dart';

Widget buildDropdownField(String value, List<String> items,
      void Function(String?) onChanged, String labelText) {
    return DropdownButtonFormField<String>(
      value: value,
      items: items
          .map((String value) => DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              ))
          .toList(),
      onChanged: onChanged,
      decoration: InputDecoration(labelText: labelText),
    );
  }
