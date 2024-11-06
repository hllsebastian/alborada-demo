import 'package:flutter/material.dart';

class InitiativesView extends StatelessWidget {
  const InitiativesView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.sizeOf(context)
          .height, // height: MediaQuery.sizeOf(context).height * 0.8,
      child: const ColoredBox(
        color: Colors.purple,
        child: Center(
          child: Text('Initiatives Exchange Page'),
        ),
      ),
    );
  }
}
