import 'package:alborada_demo/app/presentation/pages/home/consts.dart';
import 'package:flutter/material.dart';

class AlboradaPageView extends StatefulWidget {
  const AlboradaPageView({super.key});

  @override
  State<AlboradaPageView> createState() => _AlboradaPageViewState();
}

class _AlboradaPageViewState extends State<AlboradaPageView> {
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      bottomNavigationBar: NavigationBarTheme(
        data: NavigationBarThemeData(
            labelTextStyle: MaterialStateTextStyle.resolveWith((states) {
          if (states.contains(MaterialState.selected)) {
            return const TextStyle(
              fontWeight: FontWeight.bold,
            );
          }
          return const TextStyle(
            fontWeight: FontWeight.normal,
          );
        })),
        child: NavigationBar(
          animationDuration: const Duration(milliseconds: 600),
          height: MediaQuery.sizeOf(context).height * 0.1,
          selectedIndex: _selectedIndex,
          indicatorColor: Colors.amber,
          onDestinationSelected: (index) {
            setState(() {
              _selectedIndex = index;
            });
          },
          destinations: navigationBarItems,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18),
        child: bodyWidget[_selectedIndex],
      ),
    );
  }
}
