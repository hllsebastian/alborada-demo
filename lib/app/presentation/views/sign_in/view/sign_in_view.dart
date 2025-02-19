import 'package:alborada_demo/app/presentation/alborada_ui/alborada_ui.dart';
import 'package:alborada_demo/app/presentation/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SignInView extends StatelessWidget {
  const SignInView({super.key});

  @override
  Widget build(BuildContext context) {
    return AlboradaScaffoldWidget(
      body: _LoginBody(),
    );
  }
}

class _LoginBody extends StatelessWidget {
  const _LoginBody();

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.sizeOf(context);
    void goTo(String route) {
      Navigator.pushNamed(context, route);
    }

    return Padding(
      padding: edgeInsetsH25,
      child: Column(
        children: [
          SizedBox(height: screenSize.height * 0.3),
          Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Image.asset('assets/images/png/logo.png'),
          ),
          SimpleButton(
            text: 'C’est parti !',
            isDarkButton: true,
            onPressed: () => Navigator.pushNamed(context, Routes.createAccount),
          ),
          const SizedBox(height: 30),
          Text(
            'Tu as déjà un compte ?',
            style: GoogleFonts.outfit(fontSize: 16),
          ),
          TextButton(
            style: TextButton.styleFrom(
              padding: EdgeInsets.zero,
              minimumSize: const Size(0, 0),
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            ),
            onPressed: () => goTo(Routes.login),
            child: Text(
              'Je me connecte',
              style: GoogleFonts.outfit(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
          ),
        ],
      ),
    );
  }
}
