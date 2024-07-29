import 'package:alborada_demo/app/presentation/alborada_ui/widgets/alborada_scaffold_widget.dart';
import 'package:alborada_demo/app/presentation/alborada_ui/widgets/back_button.dart';
import 'package:alborada_demo/app/presentation/alborada_ui/widgets/custom_text_field.dart';
import 'package:alborada_demo/app/presentation/pages/sign_in/widgets/simple_button.dart';
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

    return SizedBox(
      height: screenSize.height * 0.85,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: screenSize.height * 0.2),
          const CustomBackButton(),
          Text(
            'Mot de passe oublié',
            style:
                GoogleFonts.openSans(fontSize: 30, fontWeight: FontWeight.w500),
          ),
          Text(
            'Nous vous enverons un e-mail pour réinitialiser votre mot de passe.',
            style: GoogleFonts.outfit(fontSize: 16),
          ),
          CustomTextField(onChanged: (value) {}),
          SimpleButton(
            text: 'Réinitialiser le mot de passe',
            isCreateProfile: true,
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
