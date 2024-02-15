import 'package:flutter/material.dart';

class InitiativeButtons extends StatelessWidget {
  const InitiativeButtons({super.key});

  @override
  Widget build(BuildContext context) {
    const separator = SizedBox(width: 7);
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _SmallButton('📆 16.03'),
        separator,
        _SmallButton('🏃‍♂️ 450m'),
        separator,
        _SmallButton('🪙 +120'),
        separator,
        _SmallButton('👨‍👩‍👧‍👦 6/15'),
      ],
    );
  }
}

class _SmallButton extends StatelessWidget {
  const _SmallButton(this.data);
  final String data;

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.sizeOf(context);

    const smallbuttonTextStyle = TextStyle(fontSize: 11, color: Colors.white);
    final smallButtonHeight = screenSize.height * 0.04;
    final smallButtonwidth = screenSize.width * 0.17;
    final buttonSyle = ElevatedButton.styleFrom(
      backgroundColor: Colors.transparent,
      padding: EdgeInsets.zero,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
    );
    return SizedBox(
      width: smallButtonwidth,
      height: smallButtonHeight,
      child: ElevatedButton(
          style: buttonSyle,
          onPressed: () {},
          child: Text(
            data,
            style: smallbuttonTextStyle,
          )),
    );
  }
}
