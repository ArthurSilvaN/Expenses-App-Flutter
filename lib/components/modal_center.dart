import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SimpleDialogItem extends StatelessWidget {
  const SimpleDialogItem({
    required this.widget,
    required this.color,
    required this.text,
    required this.onPressed,
    Key? key,
  }) : super(key: key);

  final Widget widget;
  final Color color;
  final String text;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return SimpleDialogOption(
      onPressed: onPressed,
      child: Row(
        children: [
          SizedBox(
            height: 30,
            child: widget,
          ),
          Padding(
            padding: const EdgeInsetsDirectional.only(start: 16.0),
            child: Text(text),
          ),
        ],
      ),
    );
  }
}
