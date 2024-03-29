import 'package:alborada_demo/app/presentation/pages/alborada_page_view.dart';
import 'package:alborada_demo/app/presentation/pages/log_in/view/log_in_view.dart';
import 'package:alborada_demo/app/presentation/routes/routes.dart';
import 'package:flutter/material.dart';

class AlboradaApp extends StatelessWidget {
  const AlboradaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        onGenerateRoute: (settings) {
          switch (settings.name) {
            case Routes.pageView:
              return MaterialPageRoute(
                  builder: (context) => const AlboradaPageView());
            default:
              return MaterialPageRoute(
                  builder: (context) => const SignInView());
          }
        },
      ),
    );
  }
}
