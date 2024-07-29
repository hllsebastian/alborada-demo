import 'package:alborada_demo/app/presentation/pages/alborada_page_view.dart';
import 'package:alborada_demo/app/presentation/pages/create_account.dart/create_account_view.dart';
import 'package:alborada_demo/app/presentation/pages/forgot_password/forgot_password.dart';
import 'package:alborada_demo/app/presentation/pages/login/login_view.dart';
import 'package:alborada_demo/app/presentation/pages/sign_in/view/sign_in_view.dart';
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
            case Routes.login:
              return MaterialPageRoute(builder: (context) => const LoginView());
            case Routes.createAccount:
              return MaterialPageRoute(
                  builder: (context) => const CreateAccountView());
            case Routes.forgotPassword:
              return MaterialPageRoute(
                  builder: (context) => const ForgotPassword());
            default:
              return MaterialPageRoute(
                  builder: (context) => const SignInView());
          }
        },
      ),
    );
  }
}
