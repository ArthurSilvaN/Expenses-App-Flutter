import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {
  final googleSignIn = GoogleSignIn();

  Future<GoogleSignInAccount?> googleLogin() async {
    try {
      final googleUser = await googleSignIn.signIn();
      if (googleUser == null) {
        return null;
      }

      final googleAuth = await googleUser.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      await FirebaseAuth.instance.signInWithCredential(credential);

      return googleUser;
    } catch (exeption) {
      log(exeption.toString());
    }
    return null;
  }

  Future<GoogleSignInAccount?> setUser() async {
    return googleSignIn.signInSilently();
  }

  Future<void> logout() async {
    await googleSignIn.disconnect();
    FirebaseAuth.instance.signOut();
  }
}
