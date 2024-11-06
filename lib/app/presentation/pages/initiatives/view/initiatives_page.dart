import 'package:flutter/material.dart';

class InitiativesView extends StatelessWidget {
  const InitiativesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: MediaQuery.sizeOf(context).width,
        height: MediaQuery.sizeOf(context).height,
        child: const ColoredBox(
          color: Colors.purple,
          child: Center(
            child: Text('Initiatives Exchange Page'),
          ),
        ),
      ),
    );
  }
}
