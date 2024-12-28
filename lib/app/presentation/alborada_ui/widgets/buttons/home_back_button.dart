import 'package:alborada_demo/app/presentation/alborada_ui/alborada_ui.dart';
import 'package:flutter/material.dart';

class HomeBackButton extends StatefulWidget {
  const HomeBackButton({super.key});

  @override
  HomeBackButtonState createState() => HomeBackButtonState();
}

class HomeBackButtonState extends State<HomeBackButton> {
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pop(context);
      },
      onTapDown: (_) {
        setState(() {
          _isPressed = true;
        });
      },
      onTapUp: (_) {
        setState(() {
          _isPressed = false;
        });
      },
      onTapCancel: () {
        setState(() {
          _isPressed = false;
        });
      },
      child: Padding(
        padding: const EdgeInsets.only(left: 20),
        child: AnimatedContainer(
          duration: Duration(milliseconds: 200),
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            color: _isPressed ? Palette.grey3 : Palette.black.withOpacity(0.9),
            shape: BoxShape.circle,
          ),
          child: Center(
            child: Icon(
              Icons.keyboard_arrow_left,
              color: Colors.white,
              size: 30,
            ),
          ),
        ),
      ),
    );
  }
}
