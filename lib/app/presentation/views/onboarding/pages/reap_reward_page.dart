import 'package:alborada_demo/app/presentation/views/sign_in/widgets/simple_button.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ReapRewardPage extends StatelessWidget {
  const ReapRewardPage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.sizeOf(context).height;
    return SizedBox(
      height: screenHeight * 0.87,
      child: Column(
        children: [
          SizedBox(height: screenHeight * 0.1),
          Text(
            'Récolte tes récompenses',
            style:
                GoogleFonts.outfit(fontSize: 30, fontWeight: FontWeight.w500),
            textAlign: TextAlign.center,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 30, bottom: 30),
            child: Image.asset(
                height: screenHeight * 0.35,
                'assets/images/png/onboarding_reap_reward.png'),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              'Accumule des deseos en participant à des actions et échange-les contre des réductions chez nos partenaires engagés.',
              style: GoogleFonts.outfit(fontSize: 16),
              textAlign: TextAlign.center,
            ),
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14),
            child: SimpleButton(
              isDarkButton: true,
              text: 'C’est compris !',
              onPressed: () {},
            ),
          ),
          SizedBox(height: screenHeight * 0.09),
        ],
      ),
    );
  }
}
