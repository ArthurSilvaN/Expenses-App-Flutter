import 'package:animated_card/animated_card.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../../../core/util/locale_intl.dart';
import '../../../../shared/providers/form_controller.dart';

class DateWidget extends StatelessWidget {
  const DateWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<FormController>(
      builder: (context, controller, child) => Padding(
        padding: const EdgeInsets.only(bottom: 16),
        child: AnimatedCard(
          child: Column(
            children: [
              SizedBox(
                child: InputDecorator(
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.zero,
                    icon: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: const [
                        FaIcon(
                          FontAwesomeIcons.calendar,
                          size: 30,
                        ),
                        SizedBox(
                          width: 6,
                        ),
                      ],
                    ),
                    border: InputBorder.none,
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          controller.selectedDate == null
                              ? context.locale().noDate
                              : context.locale().selectedDate(
                                    DateFormat(context
                                            .locale()
                                            .dateFormatCompleted)
                                        .format(controller.selectedDate),
                                  ),
                        ),
                      ),
                      Expanded(
                        child: TextButton(
                          onPressed: () => controller.getDate(context),
                          child: Text(
                            context.locale().selectDate,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
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
