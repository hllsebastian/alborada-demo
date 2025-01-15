import 'package:alborada_demo/app/presentation/alborada_ui/alborada_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class WishesView extends StatelessWidget {
  const WishesView({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      width: MediaQuery.sizeOf(context).width,
      height: MediaQuery.sizeOf(context).height * 0.8,
      // height: MediaQuery.sizeOf(context).height - kBottomNavigationBarHeight,
      color: Palette.yellow20,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 60),
        child: Column(
          children: [
            SizedBox(height: 50),
            Text(
              'Próximamente disponible',
              style: AlboradaTextStyle.heading1,
              textAlign: TextAlign.center,
            ),
            SvgPicture.asset(
              'assets/images/svg/award.svg',
              height: MediaQuery.sizeOf(context).height * 0.5,
            ),
            Text(
              'Acumula deseos participando en acciones sociales y canjéalas por recompensas exclusivas',
              style: AlboradaTextStyle.bodyText,
              textAlign: TextAlign.center,
            ),
            Spacer(),
          ],
        ),
      ),
    );
  }
}
