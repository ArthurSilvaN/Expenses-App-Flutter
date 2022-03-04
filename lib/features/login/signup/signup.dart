import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

import '../../../services/auth_service.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  late AuthService authProvider =
      Provider.of<AuthService>(context, listen: false);

  late final size = MediaQuery.of(context).size;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Theme.of(context).colorScheme.primary,
            Colors.white,
          ],
        ),
      ),
      padding: EdgeInsets.all(size.height * 0.1),
      child: Column(
        children: [
          const Spacer(),
          Image.asset(
            'assets/images/white_logo.png',
            height: size.height * 0.2,
          ),
          const Spacer(),
          const Text(
            'Organize suas finanças em um só lugar',
            style: TextStyle(
              color: Colors.black,
              inherit: false,
              fontSize: 32,
            ),
          ),
          const Spacer(),
          SizedBox(
            width: size.width * 0.5,
            height: size.height * 0.08,
            child: ElevatedButton.icon(
              style: ButtonStyle(
                elevation: MaterialStateProperty.all(5),
                backgroundColor: MaterialStateProperty.all(Colors.red),
                padding: MaterialStateProperty.all(
                  const EdgeInsets.symmetric(horizontal: 50.0),
                ),
              ),
              icon: Row(
                children: const [
                  FaIcon(FontAwesomeIcons.google),
                  Divider(),
                ],
              ),
              onPressed: () => authProvider.googleLogin(),
              label: const Center(
                  child: Text(
                'Entre com o google',
                style: TextStyle(fontSize: 20),
              )),
            ),
          ),
        ],
      ),
    );
  }
}
