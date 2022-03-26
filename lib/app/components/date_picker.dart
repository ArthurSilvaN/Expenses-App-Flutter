import 'package:flutter/material.dart';

Future<DateTime?> showDatePickerFinancy(
  BuildContext context,
) async {
  return showDatePicker(
    context: context,
    initialDate: DateTime.now(),
    firstDate: DateTime(2019),
    lastDate: DateTime.now(),
  ).then(
    (pickedDate) {
      if (pickedDate == null) {
        return null;
      }
      return pickedDate;
    },
  );
}
