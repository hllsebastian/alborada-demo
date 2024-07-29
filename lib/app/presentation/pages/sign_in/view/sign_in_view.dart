import 'package:alborada_demo/app/presentation/alborada_ui/widgets/alborada_scaffold_widget.dart';
import 'package:alborada_demo/app/presentation/pages/sign_in/widgets/simple_button.dart';
import 'package:alborada_demo/app/presentation/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SignInView extends StatelessWidget {
  const SignInView({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.sizeOf(context);

    return AlboradaScaffoldWidget(
      body: _LoginBody(screenSize: screenSize),
    );
  }
}

class _LoginBody extends StatelessWidget {
  const _LoginBody({
    required this.screenSize,
  });

  final Size screenSize;

  @override
  Widget build(BuildContext context) {
    // void goTo() {
    //   Navigator.pushReplacementNamed(context, Routes.pageView);
    // }
    void goTo(String route) {
      Navigator.pushNamed(context, route);
    }

    return Column(
      children: [
        SizedBox(height: screenSize.height * 0.3),
        Image.asset('assets/images/logo.png'),
        SimpleButton(
          text: 'C’est parti !',
          // text: AlboradaTexts.createAccount,
          isCreateProfile: true,
          onPressed: () {},
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
                fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black),
          ),
        ),
      ],
    );
  }
}
