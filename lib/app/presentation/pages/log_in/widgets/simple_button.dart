import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SimpleButton extends StatelessWidget {
  const SimpleButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.isCreateProfile = false,
    this.imagePath,
  });
  final String text;
  final VoidCallback onPressed;
  final bool isCreateProfile;
  final String? imagePath;

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
            backgroundColor: isCreateProfile
                ? Colors.black.withOpacity(0.85)
                : const Color.fromRGBO(254, 235, 235, 1),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          onPressed: onPressed,
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
              Text(
                text,
                style: GoogleFonts.openSans(
                  fontSize: 19,
                  fontWeight: FontWeight.w500,
                  color: isCreateProfile ? Colors.white : Colors.orangeAccent,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
