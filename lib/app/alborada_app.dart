import 'package:alborada_demo/app/presentation/routes/routes.dart';
import 'package:alborada_demo/app/presentation/views/alborada_page_view.dart';
import 'package:alborada_demo/app/presentation/views/create_account.dart/create_account_view.dart';
import 'package:alborada_demo/app/presentation/views/forgot_password/forgot_password.dart';
import 'package:alborada_demo/app/presentation/views/initiative_details/initiative_details_view.dart';
import 'package:alborada_demo/app/presentation/views/login/login_view.dart';
import 'package:alborada_demo/app/presentation/views/onboarding/onboarding_view.dart';
import 'package:alborada_demo/app/presentation/views/sign_in/view/sign_in_view.dart';
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
            case Routes.onboarding:
              return MaterialPageRoute(
                  builder: (context) => const OnboardingView());
            case Routes.initiativeDetails:
              return MaterialPageRoute(
                  builder: (context) => const InitiativeDetailsView());
            default:
              return MaterialPageRoute(
                  // builder: (context) => const OnboardingPageController());
                  // builder: (context) => const ChoiseInitiativePage());
                  builder: (context) => const SignInView());
          }
        },
      ),
    );
  }
}
