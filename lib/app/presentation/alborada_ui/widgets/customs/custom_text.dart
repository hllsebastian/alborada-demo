import 'package:alborada_demo/app/presentation/alborada_ui/theme/palette.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomText extends StatelessWidget {
  const CustomText(this.text, {super.key, this.textStyle, this.textAlign});
  final String text;
  final TextStyle? textStyle;
  final TextAlign? textAlign;

  CustomText.heading1(
    this.text, {
    super.key,
    TextStyle? additionalStyle,
    this.textAlign,
  }) : textStyle = GoogleFonts.outfit(
          fontSize: 30,
          fontWeight: FontWeight.w600,
        ).merge(additionalStyle);

  CustomText.heading2(
    this.text, {
    super.key,
    TextStyle? additionalStyle,
    this.textAlign,
  }) : textStyle = GoogleFonts.outfit(
                fontSize: 26,
                fontWeight: FontWeight.w600,
                letterSpacing: 0.03,
                height: 1.3)
            .merge(additionalStyle);

  CustomText.heading3(
    this.text, {
    super.key,
    this.textAlign,
  }) : textStyle = GoogleFonts.outfit(
            fontSize: 20,
            fontWeight: FontWeight.w500,
            letterSpacing: 0.03,
            height: 1.3);

  CustomText.heading4(
    this.text, {
    super.key,
    this.textAlign,
  }) : textStyle = GoogleFonts.outfit(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            letterSpacing: 0.03,
            height: 1.3);

  CustomText.bodlBodyText(
    this.text, {
    super.key,
    this.textAlign,
  }) : textStyle = GoogleFonts.outfit(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            letterSpacing: 0.03,
            height: 1.3);

  CustomText.bodyText(
    this.text, {
    super.key,
    this.textAlign,
  }) : textStyle = GoogleFonts.outfit(
            fontSize: 14,
            letterSpacing: 0.03,
            height: 1.3,
            color: Palette.grey3);

  CustomText.buttonText(
    this.text, {
    super.key,
    this.textAlign,
  }) : textStyle = GoogleFonts.outfit(
            fontSize: 18,
            fontWeight: FontWeight.w500,
            letterSpacing: 0.03,
            height: 1.3);

  CustomText.tagText(
    this.text, {
    super.key,
    this.textAlign,
  }) : textStyle = GoogleFonts.outfit(
            fontSize: 10,
            fontWeight: FontWeight.w400,
            letterSpacing: 0.03,
            height: 1.3);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: textStyle,
      textAlign: textAlign,
    );
  }
}
