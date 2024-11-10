import 'package:alborada_demo/app/presentation/alborada_ui/widgets/custom_text_field.dart';
import 'package:alborada_demo/app/presentation/alborada_ui/widgets/widgets.dart';
import 'package:alborada_demo/app/presentation/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CreateAccountView extends StatelessWidget {
  const CreateAccountView({super.key});

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
    void goTo(String route) {
      Navigator.pushNamed(context, route);
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: SizedBox(
        height: screenSize.height * 0.85,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: screenSize.height * 0.1),
            const CustomBackButton(),
            Text(
              'Je créé mon compte',
              style: GoogleFonts.openSans(
                  fontSize: 30, fontWeight: FontWeight.w500),
            ),
            CustomTextField(
              hintText: 'Adresse e-mail',
              onChanged: (value) {},
            ),
            SizedBox(height: screenSize.height * 0.01),
            CustomTextField(
              hintText: 'Mot de passe',
              onChanged: (value) {},
            ),
            SizedBox(height: screenSize.height * 0.01),
            CustomTextField(
              hintText: 'Confirmer le mot de passe',
              onChanged: (value) {},
            ),
            SizedBox(height: screenSize.height * 0.01),
            SimpleButton(
              text: 'Créer un compte',
              isDarkButton: true,
              onPressed: () => Navigator.pushNamed(
                context,
                Routes.onboarding,
                // (Route<dynamic> route) => false,
              ),
            ),
            Text(
              'En cliquant sur “Créer un compte, vous acceptez les conditions d’utilisation d’Alborada.',
              style: GoogleFonts.outfit(fontSize: 16),
            ),
            const Spacer(),
            Align(
              alignment: Alignment.center,
              child: Text(
                'Tu as déjà un compte ?',
                style: GoogleFonts.outfit(fontSize: 16),
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: TextButton(
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
            ),
          ],
        ),
      ),
    );
  }
}
