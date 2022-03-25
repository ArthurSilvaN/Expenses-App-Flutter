import 'package:flutter/material.dart';

import '../../../../core/util/mediaquery_contex.dart';

class ButtonUpdate extends StatelessWidget {
  const ButtonUpdate({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.sizeContext().height * 0.075,
      width: context.sizeContext().height * 0.075,
      child: Container(
        width: context.sizeContext().width * 0.12,
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
