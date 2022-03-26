import 'package:flutter/material.dart';

class SnackBarFinancy {
  const SnackBarFinancy(this.context);

  final BuildContext context;

  void showSnackBar({required String message, required Color color}) {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: color,
      ),
    );
  }
}
