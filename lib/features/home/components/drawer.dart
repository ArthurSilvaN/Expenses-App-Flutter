import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

import '../../../components/modal_center.dart';
import '../../../core/usecases/locale_usecase.dart';
import '../../../core/util/locale_intl.dart';
import '../../../services/auth_service.dart';

class DrawerHome extends StatelessWidget {
  const DrawerHome({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    late final authService = Provider.of<AuthService>(context, listen: false);

    late final localeController =
        Provider.of<LocaleUseCase>(context, listen: false);

    void _openLocaleModal(BuildContext context) {
      showDialog(
        context: context,
        builder: (context) {
          return SimpleDialog(
            title: Text(context.locale().languages),
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.2,
                width: MediaQuery.of(context).size.height * 0.1,
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
        ],
      ),
    );
  }
}
