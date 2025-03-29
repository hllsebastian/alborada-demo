import 'package:alborada_demo/app/presentation/alborada_ui/icons/svg_icon.dart';
import 'package:alborada_demo/app/presentation/alborada_ui/theme/palette.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class InfoButton extends StatelessWidget {
  const InfoButton({super.key, required this.nameImage, required this.text});

  final String nameImage;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 6),
      // margin: const EdgeInsets.symmetric(horizontal: 2),
      decoration: BoxDecoration(
        color: Palette.black,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SvgIcon(nameImage),
          const SizedBox(width: 1),
          Text(
            text,
            style: GoogleFonts.outfit(
              fontSize: 14,
              color: Palette.white,
            ),
          ),
        ],
      ),
    );
  }
}
