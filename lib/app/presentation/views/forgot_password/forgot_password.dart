import 'package:alborada_demo/app/presentation/alborada_ui/widgets/custom_text_field.dart';
import 'package:alborada_demo/app/presentation/alborada_ui/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({super.key});

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
    // void goTo(String route) {
    //   Navigator.pushNamed(context, route);
    // }

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
              'Mot de passe oublié',
              style: GoogleFonts.openSans(
                  fontSize: 30, fontWeight: FontWeight.w500),
            ),
            SizedBox(height: screenSize.height * 0.01),
            Text(
              'Nous vous enverons un e-mail pour réinitialiser votre mot de passe.',
              style: GoogleFonts.outfit(fontSize: 16),
            ),
            SizedBox(height: screenSize.height * 0.01),
            CustomTextField(
              hintText: 'Adresse e-mail',
              onChanged: (value) {},
            ),
            SizedBox(height: screenSize.height * 0.01),
            SimpleButton(
              text: 'Réinitialiser le mot de passe',
              isDarkButton: true,
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
