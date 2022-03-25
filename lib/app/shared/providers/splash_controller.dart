import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../services/database_connection.dart';
import 'auth_provider.dart';
import 'locale_provider.dart';
import 'transaction_provider.dart';

class SplashController extends ChangeNotifier {
  SplashController(this.context)
      : transactionController =
            Provider.of<TransactionUsecase>(context, listen: false),
        localeProvider = Provider.of<LocaleProvider>(context, listen: false),
        authService = Provider.of<AuthProvider>(context, listen: false);

  final BuildContext context;
  final LocaleProvider localeProvider;
  final TransactionUsecase transactionController;
  final AuthProvider authService;

  late final DatabaseConneection conneection = DatabaseConneection();

  late final AuthProvider _authService =
      Provider.of<AuthProvider>(context, listen: false);

  Future<void> initializeApp() async {
    await _authService.setUser();

    if (_authService.user != null)
      await conneection.inializeDatabase().then(
        (value) {
          transactionController.getDataUser(_authService.user!.id);
        },
      );
  }
}
