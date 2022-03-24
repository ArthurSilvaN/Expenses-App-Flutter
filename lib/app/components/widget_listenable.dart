import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class WidgetListenable extends StatefulWidget {
  const WidgetListenable({
    Key? key,
    required this.valueListenable,
    required this.body,
  }) : super(key: key);

  final ValueListenable<Object?> valueListenable;
  final Widget body;

  @override
  State<WidgetListenable> createState() => _WidgetListenable();
}

class _WidgetListenable extends State<WidgetListenable> {
  late final body = widget.body;
  late final valueListenable = widget.valueListenable;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: valueListenable,
      builder: (_, __, ___) {
        return body;
      },
    );
  }
}
