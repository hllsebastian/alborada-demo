import 'package:alborada_demo/app/presentation/presentation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SimpleButton extends StatelessWidget {
  const SimpleButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.isDarkButton = false,
    this.imagePath,
    this.buttonColor = const Color.fromRGBO(254, 235, 235, 1),
    this.textColor = Colors.orangeAccent,
    this.icon,
    this.isLoading = false,
  });
  final String text;
  final VoidCallback? onPressed;
  final bool isDarkButton;
  final String? imagePath;
  final Color? buttonColor;
  final Color? textColor;
  final IconData? icon;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.sizeOf(context);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: SizedBox(
        height: screenSize.height * 0.07,
        width: screenSize.width * 0.9,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: isDarkButton
                ? Colors.black.withValues(alpha: 0.85)
                : buttonColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          onPressed: isLoading ? () {} : onPressed,
          child: Row(
            mainAxisAlignment: imagePath == null
                ? MainAxisAlignment.center
                : MainAxisAlignment.start,
            children: [
              if (imagePath != null)
                Padding(
                  padding: const EdgeInsets.only(right: 15),
                  child: Image.asset(
                    imagePath!,
                    width: screenSize.width * 0.08,
                  ),
                ),
              Flexible(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if (icon != null)
                      Icon(
                        Icons.qr_code,
                        color: Colors.white,
                      ),
                    SizedBox(width: 6),
                    isLoading
                        ? CircularProgressIndicator.adaptive(
                            backgroundColor: Palette.yellow100,
                          )
                        : Text(
                            text,
                            style: GoogleFonts.openSans(
                              fontSize: 19,
                              fontWeight: FontWeight.w500,
                              color: isDarkButton ? Colors.white : textColor,
                            ),
                          ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
