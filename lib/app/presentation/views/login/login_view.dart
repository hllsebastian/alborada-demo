import 'package:alborada_demo/app/presentation/alborada_ui/widgets/alborada_scaffold_widget.dart';
import 'package:alborada_demo/app/presentation/alborada_ui/widgets/back_button.dart';
import 'package:alborada_demo/app/presentation/alborada_ui/widgets/custom_text_field.dart';
import 'package:alborada_demo/app/presentation/routes/routes.dart';
import 'package:alborada_demo/app/presentation/views/sign_in/widgets/simple_button.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

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

    return SizedBox(
      height: screenSize.height * 0.85,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: screenSize.height * 0.1),
          const CustomBackButton(),
          Text(
            'Je me connecte',
            style:
                GoogleFonts.openSans(fontSize: 30, fontWeight: FontWeight.w500),
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
          SimpleButton(
            text: 'Se connecter',
            isDarkButton: true,
            onPressed: () => Navigator.pushNamedAndRemoveUntil(
              context,
              Routes.pageView,
              (Route<dynamic> route) => false,
            ),
          ),
          SizedBox(height: screenSize.height * 0.01),
          TextButton(
            style: TextButton.styleFrom(
              padding: EdgeInsets.zero,
              minimumSize: const Size(0, 0),
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            ),
            onPressed: () => goTo(Routes.forgotPassword),
            child: Text(
              'Mot de passe oublié ?',
              style: GoogleFonts.outfit(fontSize: 16, color: Colors.black),
            ),
          ),
          const Spacer(),
          Align(
            alignment: Alignment.center,
            child: Text(
              'Tu n’as pas encore de compte ?',
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
              onPressed: () => goTo(Routes.createAccount),
              child: Text(
                'Je créé mon compte',
                style: GoogleFonts.outfit(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
