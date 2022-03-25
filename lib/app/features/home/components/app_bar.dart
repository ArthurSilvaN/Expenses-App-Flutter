import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/util/locale_intl.dart';
import '../../../shared/providers/auth_provider.dart';
import '../../../shared/providers/home_controller.dart';

class AppBarFinancy extends StatefulWidget {
  const AppBarFinancy({Key? key}) : super(key: key);

  @override
  State<AppBarFinancy> createState() => _AppBarFinancyState();
}

class _AppBarFinancyState extends State<AppBarFinancy> {
  @override
  Widget build(BuildContext context) {
    return Consumer2<AuthProvider, HomeController>(
      builder: (context, auth, homeController, child) => Container(
        height: 150,
        padding: const EdgeInsets.symmetric(horizontal: 18.0),
        child: Center(
          child: ListTile(
            title: Text.rich(
              TextSpan(
                text: context.locale().hi,
                children: [
                  TextSpan(
                    text: '${auth.user!.displayName}',
                  )
                ],
              ),
            ),
            subtitle: Text(
              context.locale().welcome,
            ),
            trailing: GestureDetector(
              onTap: () =>
                  homeController.globalKey.currentState!.openEndDrawer(),
              child: Container(
                height: 48,
                width: 48,
                decoration: BoxDecoration(
                  color: Colors.black,
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
        ),
      ),
    );
  }
}
