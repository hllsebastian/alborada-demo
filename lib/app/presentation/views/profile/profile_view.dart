import 'package:alborada_demo/app/presentation/alborada_ui/alborada_ui.dart';
import 'package:flutter/material.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Perfil',
          style: AlboradaTextStyle.heading3,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 26, vertical: 30),
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  width: 80,
                  height: 80,
                  margin: EdgeInsets.only(right: 20),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: const DecorationImage(
                      image: AssetImage(
                          'assets/images/png/saitama_poker_face.png'),
                      fit: BoxFit.cover,
                    ),
                    border: Border.all(
                      color: Colors.black12,
                      width: 1.0,
                    ),
                  ),
                ),
                Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Saitama Seiyū	Makoto Furukawa',
                        style: AlboradaTextStyle.bodyText.copyWith(
                            fontWeight: FontWeight.bold, color: Palette.black),
                      ),
                      Text(
                        'Medellín, Colombia',
                        style: AlboradaTextStyle.bodyText,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                ButtonIconWidget(
                  height: 32,
                  margin: EdgeInsets.zero,
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  buttonColor: Palette.black,
                  text: 'Editar',
                  imagePath: 'deseos.svg',
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
