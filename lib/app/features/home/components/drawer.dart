import 'package:day_night_switcher/day_night_switcher.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

import '../../../components/locale_modal.dart';
import '../../../core/util/locale_intl.dart';
import '../../../shared/providers/auth_provider.dart';
import '../../../shared/providers/home_controller.dart';

class DrawerHome extends StatelessWidget {
  const DrawerHome({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Consumer2<AuthProvider, HomeController>(
      builder: (context, auth, homeController, child) => Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            UserAccountsDrawerHeader(
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary,
              ),
              accountEmail: Text(auth.user!.email),
              accountName: Text('${auth.user!.displayName}'),
              currentAccountPicture: CircleAvatar(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    image: DecorationImage(
                      image: NetworkImage(
                        auth.user!.photoUrl.toString(),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.language),
              title: Text(context.locale().languages),
              onTap: () => openLocaleModal(context),
            ),
            ListTile(
              leading: const Icon(Icons.logout),
              title: Text(context.locale().logout),
              onTap: () => auth.logout(),
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
      ),
    );
  }
}
