import 'package:animated_card/animated_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class InputText extends StatelessWidget {
  const InputText({
    Key? key,
    required this.label,
    required this.icon,
    this.initialValue,
    this.controller,
    this.keyboardType,
  }) : super(key: key);

  final String label;
  final IconData icon;
  final String? initialValue;
  final TextInputType? keyboardType;

  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return AnimatedCard(
      child: Padding(
        padding: const EdgeInsets.only(bottom: 16),
        child: Column(
          children: [
            TextFormField(
              controller: controller,
              keyboardType: keyboardType,
              initialValue: initialValue,
              maxLength: keyboardType == null ? 40 : 9,
              decoration: InputDecoration(
                counterText: '',
                contentPadding: EdgeInsets.zero,
                labelText: label,
                icon: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      icon,
                      size: 30,
                    ),
                    const SizedBox(
                      width: 1,
                    )
                  ],
                ),
                border: InputBorder.none,
                alignLabelWithHint: true,
              ),
            ),
            const Divider(
              height: 1,
              thickness: 1,
            ),
          ],
        ),
      ),
    );
  }
}
