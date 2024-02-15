import 'package:alborada_demo/app/presentation/design/alborada_texts.dart';
import 'package:alborada_demo/app/presentation/pages/log_in/widgets/simple_button.dart';
import 'package:alborada_demo/app/presentation/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SignInView extends StatelessWidget {
  const SignInView({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.sizeOf(context);

    void goTo() {
      Navigator.pushReplacementNamed(context, Routes.pageView);
    }

    return Scaffold(
      body: Center(
        child: Column(
          children: [
            SizedBox(height: screenSize.height * 0.3),
            Text(
              AlboradaTexts.welcomeTo,
              style: GoogleFonts.openSans(
                  fontSize: 18, fontWeight: FontWeight.w600),
            ),
            Text(
              AlboradaTexts.alborada,
              style: GoogleFonts.openSans(
                  fontSize: 50, fontWeight: FontWeight.bold),
            ),
            SimpleButton(
              text: AlboradaTexts.createAccount,
              isCreateProfile: true,
              onPressed: () {},
            ),
            SimpleButton(
              text: AlboradaTexts.googleLogin,
              imagePath: 'assets/images/google_icone_yelow.png',
              onPressed: goTo,
            ),
            SimpleButton(
              text: AlboradaTexts.fbookLogin,
              imagePath: 'assets/images/fbook_icon_yellow.png',
              onPressed: goTo,
            ),
          ],
        ),
      ),
    );
  }
}
