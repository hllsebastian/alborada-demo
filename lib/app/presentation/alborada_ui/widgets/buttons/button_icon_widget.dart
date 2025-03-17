import 'package:alborada_demo/app/presentation/alborada_ui/alborada_ui.dart';
import 'package:alborada_demo/app/presentation/alborada_ui/icons/svg_icon.dart';
import 'package:flutter/material.dart';

class ButtonIconWidget extends StatelessWidget {
  const ButtonIconWidget({
    super.key,
    required this.text,
    required this.imagePath,
    this.buttonColor,
    this.width,
    this.height,
    this.padding,
    this.margin,
    this.textStyle,
    this.onTap,
  });
  final String text;
  final String imagePath;
  final Color? buttonColor;
  final double? width;
  final double? height;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final TextStyle? textStyle;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap == null ? () {} : () => onTap!(),
      child: Container(
        width: width,
        height: height,
        padding:
            padding ?? const EdgeInsets.symmetric(vertical: 4, horizontal: 12),
        margin: margin ?? const EdgeInsets.symmetric(horizontal: 2),
        decoration: BoxDecoration(
          color: buttonColor ?? Colors.black26.withOpacity(0.2),
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Palette.yellow80
                  .withOpacity(0.3), // Color de la sombra con opacidad
              spreadRadius: 1, // Cuánto se extiende la sombra
              blurRadius: 1, // Difuminado de la sombra
              offset:
                  Offset(0, 1), // Posición de la sombra (0, 3) es hacia abajo
            )
          ],
        ),
        child: Row(
          children: [
            SvgIcon(imagePath),
            const SizedBox(width: 4),
            Text(
              text,
              style: textStyle ??
                  const TextStyle(
                    color: Colors.white,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
