import 'package:animated_card/animated_card.dart';
import 'package:flutter/material.dart';

class InputText extends StatelessWidget {
  const InputText({
    Key? key,
    required this.label,
    required this.icon,
    this.initialValue,
    this.controller,
  }) : super(key: key);

  final String label;
  final IconData icon;
  final String? initialValue;

  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return AnimatedCard(
      child: Padding(
        padding: const EdgeInsets.only(bottom: 16),
        child: Column(
          children: [
            TextFormField(
              initialValue: initialValue,
              controller: controller,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.zero,
                labelText: label,
                icon: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 18),
                      child: Icon(
                        icon,
                      ),
                    ),
                    const SizedBox(
                      width: 1,
                      height: 48,
                    )
                  ],
                ),
                border: InputBorder.none,
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
