import 'package:animations/animations.dart';
import 'package:flutter/material.dart';

import '../../../core/util/mediaquery_contex.dart';
import '../../transaction/transaction_form/transaction_form.dart';

class FloatingButtonFinancy extends StatelessWidget {
  const FloatingButtonFinancy({Key? key}) : super(key: key);

  @override
  Widget build(context) {
    return SizedBox(
      height: context.sizeContext().height * 0.075,
      width: context.sizeContext().height * 0.075,
      child: OpenContainer(
        closedElevation: 0,
        transitionDuration: const Duration(milliseconds: 500),
        closedShape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(5.0)),
        ),
        closedBuilder: (context, action) => Container(
          width: context.sizeContext().width * 0.12,
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primary,
          ),
          child: const Icon(
            Icons.add_box_outlined,
            color: Colors.white,
          ),
        ),
        openBuilder: (context, action) => const Scaffold(
          body: Center(
            child: TransactionForm(),
          ),
        ),
      ),
    );
  }
}
