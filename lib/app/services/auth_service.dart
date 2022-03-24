import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../entities/user.dart';

class AuthService extends ChangeNotifier {
  final googleSignIn = GoogleSignIn();

  GoogleSignInAccount? _user;
  GoogleSignInAccount? get user => _user;

  UserFinancy? _userFinancy;
  UserFinancy? get userFinancy => _userFinancy;

  Future<void> googleLogin() async {
    try {
      final googleUser = await googleSignIn.signIn();
      if (googleUser == null) {
        return;
      }
      _user = googleUser;

      final googleAuth = await googleUser.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      await FirebaseAuth.instance.signInWithCredential(credential);
    } catch (exeption) {
      log(exeption.toString());
    }
    notifyListeners();
  }

  Future<void> setUser() async {
    final googleUser = await googleSignIn.signInSilently();

    _user = googleUser;
    notifyListeners();
  }

  Future<void> logout() async {
    await googleSignIn.disconnect();
    FirebaseAuth.instance.signOut();
  }
}
