import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../../services/auth_service.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final kNormalText = const TextStyle(
    fontSize: 40,
    color: Colors.white,
    inherit: false,
    fontWeight: FontWeight.bold,
  );

  final kUnderlinedText = const TextStyle(
    fontSize: 20,
    color: Colors.white,
    fontWeight: FontWeight.w500,
    inherit: false,
  );
  late AuthService authProvider =
      Provider.of<AuthService>(context, listen: false);

  late final size = MediaQuery.of(context).size;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [
            Theme.of(context).colorScheme.primary,
            const Color.fromARGB(255, 255, 125, 3),
          ],
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: 'Bem Vindo\n',
                  style: kNormalText,
                ),
                TextSpan(
                  text: 'ao FinancyApp',
                  style: kNormalText,
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          Text(
            'Seu aplicativo de finanças em um só lugar',
            style: GoogleFonts.inter(
              textStyle: kUnderlinedText,
            ),
          ),
          const SizedBox(height: 20),
          SizedBox(
            width: size.width,
            height: size.height * 0.07,
            child: ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.transparent),
                elevation: MaterialStateProperty.all(0),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                    side: const BorderSide(color: Colors.white),
                  ),
                ),
              ),
              onPressed: () => authProvider.googleLogin(),
              child: Row(
                children: [
                  const FaIcon(
                    FontAwesomeIcons.google,
                    color: Colors.white,
                  ),
                  const Spacer(),
                  Text(
                    'Entre com o google',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.inter(
                      textStyle: const TextStyle(
                        inherit: false,
                        color: Colors.white,
                        letterSpacing: 0.5,
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  const Spacer(),
                ],
              ),
            ),
          ),
          const SizedBox(height: 20),
          const Center(
            child: Text(
              'Termos e condições',
              style: TextStyle(
                inherit: false,
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Colors.white,
              ),
            ),
          ),
          SizedBox(height: size.height * 0.05),
        ],
      ),
    );
  }
}
