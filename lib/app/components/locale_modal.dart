import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../core/util/locale_intl.dart';
import '../core/util/mediaquery_contex.dart';
import '../shared/providers/locale_provider.dart';
import 'modal_center.dart';

void openLocaleModal(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) {
      return Consumer<LocaleProvider>(
        builder: (context, controller, child) => SimpleDialog(
          title: Text(context.locale().languages),
          children: [
            SizedBox(
              height: context.sizeContext().height * 0.2,
              width: context.sizeContext().height * 0.1,
              child: Center(
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: controller.languagesLocale.length,
                  itemBuilder: (_, index) {
                    final language = controller.languagesLocale[index];
                    return Container(
                      decoration: BoxDecoration(
                        color: language.locale == controller.locale.value
                            ? Theme.of(context)
                                .colorScheme
                                .primary
                                .withOpacity(0.7)
                            : null,
                      ),
                      child: SimpleDialogItem(
                        widget: Text(
                          language.flag,
                          style: const TextStyle(fontSize: 24),
                        ),
                        color: language.color,
                        text: language.languageName,
                        onPressed: () {
                          controller.setLocale(language.locale);
                          Navigator.pop(context);
                        },
                      ),
                    );
                  },
                ),
              ),
            )
          ],
        ),
      );
    },
  );
}
