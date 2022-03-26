import 'package:animated_card/animated_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../entities/transaction_categorys.dart';
import '../../../../shared/providers/form_controller.dart';

class DropdownWidget extends StatelessWidget {
  const DropdownWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<FormController>(
      builder: (context, controller, child) => Padding(
        padding: const EdgeInsets.only(bottom: 16),
        child: AnimatedCard(
          child: Column(
            children: [
              SizedBox(
                width: double.maxFinite,
                child: DropdownButton(
                  isExpanded: true,
                  underline: const SizedBox(width: 0),
                  value: controller.selectedCategory,
                  items: controller.transactionProvider.categorysDefault
                      .map<DropdownMenuItem<Category>>(
                    (value) {
                      return DropdownMenuItem<Category>(
                        value: value,
                        child: Row(
                          children: [
                            Icon(
                              value.icon,
                              size: 30,
                              color: Theme.of(context).iconTheme.color,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(value.name),
                          ],
                        ),
                      );
                    },
                  ).toList(),
                  onChanged: (Category? newValue) =>
                      controller.setCategory(newValue),
                ),
              ),
              const Divider(
                height: 1,
                thickness: 1,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
