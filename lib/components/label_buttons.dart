import 'package:flutter/material.dart';

class SetLabelButtons extends StatelessWidget {
  const SetLabelButtons({
    Key? key,
    required this.primaryLabel,
    required this.primaryOnPressed,
    required this.secondaryLabel,
    required this.secondaryOnPressed,
    this.enablePrimaryColor = false,
    this.enableSecondaryColor = false,
  }) : super(key: key);

  final String primaryLabel;
  final VoidCallback primaryOnPressed;
  final String secondaryLabel;
  final VoidCallback secondaryOnPressed;
  final bool enablePrimaryColor;
  final bool enableSecondaryColor;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 57,
      child: Column(
        children: [
          const Divider(thickness: 1, height: 1),
          SizedBox(
            height: 56,
            child: Row(
              children: [
                Expanded(
                  child: SizedBox(
                    height: 56,
                    child: TextButton(
                      onPressed: primaryOnPressed,
                      child: Text(
                        primaryLabel,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: TextButton(
                    onPressed: secondaryOnPressed,
                    child: Text(
                      secondaryLabel,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
