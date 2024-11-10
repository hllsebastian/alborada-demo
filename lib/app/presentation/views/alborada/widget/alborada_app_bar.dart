import 'package:alborada_demo/app/presentation/alborada_ui/alborada_ui.dart';
import 'package:flutter/material.dart';

class AlboradaAppbar extends StatelessWidget implements PreferredSizeWidget {
  const AlboradaAppbar({super.key});

  @override
  Size get preferredSize {
    return const Size.fromHeight(56);
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Palette.white,
      elevation: 0,
      bottomOpacity: 0,
      actions: [
        Padding(
          padding: const EdgeInsets.only(left: 20),
          child: ButtonIconWidget(
              height: 32,
              margin: EdgeInsets.zero,
              padding: EdgeInsets.symmetric(horizontal: 8),
              buttonColor: Palette.black,
              text: '25',
              imagePath: 'deseos.svg'),
        ),
        Spacer(),
        Container(
          width: 46,
          height: 46,
          margin: EdgeInsets.only(right: 20),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            image: const DecorationImage(
              image: AssetImage('assets/images/png/saitama_poker_face.png'),
              fit: BoxFit.cover,
            ),
            border: Border.all(
              color: Colors.black12,
              width: 1.0,
            ),
          ),
        ),
      ],
    );
  }
}
