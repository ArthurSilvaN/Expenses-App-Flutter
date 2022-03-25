import 'package:day_night_switcher/day_night_switcher.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

import '../../../components/modal_center.dart';
import '../../../core/util/locale_intl.dart';
import '../../../core/util/mediaquery_contex.dart';
import '../../../shared/providers/auth_provider.dart';
import '../../../shared/providers/home_controller.dart';
import '../../../shared/providers/locale_provider.dart';

class DrawerHome extends StatelessWidget {
  const DrawerHome({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    late final authService = Provider.of<AuthProvider>(context, listen: false);

    late final localeController =
        Provider.of<LocaleProvider>(context, listen: false);

    late final homeController =
        Provider.of<HomeController>(context, listen: false);

    void _openLocaleModal(BuildContext context) {
      showDialog(
        context: context,
        builder: (context) {
          return SimpleDialog(
            title: Text(context.locale().languages),
            children: [
              SizedBox(
                height: context.sizeContext().height * 0.2,
                width: context.sizeContext().height * 0.1,
                child: Center(
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: localeController.languagesLocale.length,
                    itemBuilder: (_, index) {
                      final language = localeController.languagesLocale[index];
                      return Container(
                        decoration: BoxDecoration(
                          color:
                              language.locale == localeController.locale.value
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
                            localeController.setLocale(language.locale);
                            Navigator.pop(context);
                          },
                        ),
                      );
                    },
                  ),
                ),
              )
            ],
          );
        },
      );
    }

    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary,
            ),
            accountEmail: Text(authService.user!.email),
            accountName: Text('${authService.user!.displayName}'),
            currentAccountPicture: CircleAvatar(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  image: DecorationImage(
                    image: NetworkImage(
                      authService.user!.photoUrl.toString(),
                    ),
                  ),
                ),
              ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.language),
            title: Text(context.locale().languages),
            onTap: () => _openLocaleModal(context),
          ),
          ListTile(
            leading: const Icon(Icons.logout),
            title: Text(context.locale().logout),
            onTap: () => authService.logout(),
          ),
          const Divider(),
          ListTile(
            title: SizedBox(
              child: DayNightSwitcher(
                isDarkModeEnabled: homeController.isDarkModeEnabled,
                onStateChanged: homeController.onStateChanged,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
