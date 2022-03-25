import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../shared/providers/auth_provider.dart';
import '../home/home.dart';
import 'signup/signup.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late final AuthProvider _authService =
      Provider.of<AuthProvider>(context, listen: false);
      
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasData && _authService.user != null) {
          return const HomePage();
        } else if (snapshot.hasError) {
          return const Center(child: Text('error'));
        }
        return const SignUpPage();
      },
    );
  }
}
