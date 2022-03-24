import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ElevatedButtonApp extends StatelessWidget {
  const ElevatedButtonApp(
      {Key? key, required this.callBack, required this.textButton})
      : super(key: key);

  final void Function()? callBack;
  final String textButton;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: callBack,
      style: ElevatedButton.styleFrom(
        elevation: 5,
        padding: const EdgeInsets.all(16.0),
        primary: Theme.of(context).colorScheme.primary,
        onPrimary: const Color.fromARGB(255, 225, 241, 233),
      ),
      child: Text(textButton),
    );
  }
}
