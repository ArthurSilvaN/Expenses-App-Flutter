import 'package:flutter/material.dart';

class ButtonUpdate extends StatelessWidget {
  const ButtonUpdate({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.075,
      width: MediaQuery.of(context).size.height * 0.075,
      child: Container(
        width: MediaQuery.of(context).size.width * 0.12,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary,
        ),
        child: const Icon(
          Icons.add_box_outlined,
          color: Colors.white,
        ),
      ),
    );
  }
}
