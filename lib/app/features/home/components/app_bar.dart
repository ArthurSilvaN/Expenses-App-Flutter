import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/util/locale_intl.dart';
import '../../../services/auth_service.dart';

class AppBarFinancy extends StatefulWidget {
  const AppBarFinancy({
    Key? key,
    required this.globalKey,
  }) : super(key: key);

  final GlobalKey<ScaffoldState> globalKey;

  @override
  State<AppBarFinancy> createState() => _AppBarFinancyState();
}

class _AppBarFinancyState extends State<AppBarFinancy> {
  late final AuthService _authService =
      Provider.of<AuthService>(context, listen: false);

  late final size = MediaQuery.of(context).size;

  late final GlobalKey<ScaffoldState> globalKey = widget.globalKey;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      padding: const EdgeInsets.symmetric(horizontal: 18.0),
      child: Center(
        child: ListTile(
          title: Text.rich(
            TextSpan(
              text: context.locale().hi,
              children: [
                TextSpan(
                  text: '${_authService.user!.displayName}',
                )
              ],
            ),
          ),
          subtitle: Text(
            context.locale().welcome,
          ),
          trailing: GestureDetector(
            onTap: () => globalKey.currentState!.openEndDrawer(),
            child: Container(
              height: 48,
              width: 48,
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(5),
                image: DecorationImage(
                  image: NetworkImage(
                    _authService.user!.photoUrl.toString(),
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
