import 'package:alborada_demo/app/presentation/views/sign_in/widgets/simple_button.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TakeActionPage extends StatelessWidget {
  const TakeActionPage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.sizeOf(context).height;
    return SizedBox(
      height: screenHeight * 0.87,
      child: Column(
        children: [
          SizedBox(height: screenHeight * 0.1),
          Text(
            "Passe à l'action",
            style:
                GoogleFonts.outfit(fontSize: 30, fontWeight: FontWeight.w500),
            textAlign: TextAlign.center,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 30, bottom: 30),
            child: Image.asset(
                height: screenHeight * 0.35,
                'assets/images/png/onboarding_take_action.png'),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              "Concrétise ton action, en solo ou avec des amis, et renforce ton impact positif.",
              style: GoogleFonts.outfit(fontSize: 16),
              textAlign: TextAlign.center,
            ),
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14),
            child: SimpleButton(
              isDarkButton: true,
              text: 'Suivant',
              onPressed: () {},
            ),
          ),
          SizedBox(height: screenHeight * 0.09),
        ],
      ),
    );
  }
}
