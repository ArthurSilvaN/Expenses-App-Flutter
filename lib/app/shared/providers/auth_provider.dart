import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../entities/user.dart';
import '../../services/auth_service.dart';

class AuthProvider extends ChangeNotifier {
  late final AuthService _authService = AuthService();

  GoogleSignInAccount? _user;
  GoogleSignInAccount? get user => _user;

  UserFinancy? _userFinancy;
  UserFinancy? get userFinancy => _userFinancy;

  Future<void> googleLogin() async {
    _user = await _authService.googleLogin();
    notifyListeners();
  }

  Future<void> setUser() async {
    _user = await _authService.setUser();
    notifyListeners();
  }

  Future<void> logout() async {
    await _authService.logout();
  }
}
