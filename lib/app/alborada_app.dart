import 'package:alborada_demo/app/presentation/routes/routes.dart';
import 'package:alborada_demo/app/presentation/views/alborada/alborada_page_view.dart';
import 'package:alborada_demo/app/presentation/views/create_account.dart/create_account_view.dart';
import 'package:alborada_demo/app/presentation/views/forgot_password/forgot_password.dart';
import 'package:alborada_demo/app/presentation/views/login/login_view.dart';
import 'package:alborada_demo/app/presentation/views/onboarding/cubit/onboarding_cubit.dart';
import 'package:alborada_demo/app/presentation/views/onboarding/onboarding_view.dart';
import 'package:alborada_demo/app/presentation/views/profile/edit_profile_view.dart';
import 'package:alborada_demo/app/presentation/views/profile/profile_view.dart';
import 'package:alborada_demo/app/presentation/views/sign_in/view/sign_in_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'presentation/views/cubit/user_cubit/user_cubit.dart';
import 'presentation/views/event_details/event_details_view.dart';

class AlboradaApp extends StatelessWidget {
  const AlboradaApp({super.key});

  @override
  Widget build(BuildContext context) {
    final sessionActive = Supabase.instance.client.auth.currentSession != null;
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: BlocProvider(
        create: (context) => UserCubit(),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            appBarTheme: AppBarTheme(
              backgroundColor:
                  Colors.white, // Color constante para todo el AppBar
              elevation: 0, // Elimina la sombra en todos los AppBar
            ),
          ),
          initialRoute: sessionActive ? Routes.pageView : Routes.signIn,
          onGenerateRoute: (settings) {
            switch (settings.name) {
              case Routes.pageView:
                return MaterialPageRoute(
                    builder: (context) => const AlboradaPageView());
              case Routes.login:
                return MaterialPageRoute(
                  builder: (context) => const LoginView(),
                );
              case Routes.createAccount:
                return MaterialPageRoute(
                    builder: (context) => const CreateAccountView());
              case Routes.forgotPassword:
                return MaterialPageRoute(
                    builder: (context) => const ForgotPassword());
              case Routes.onboarding:
                return MaterialPageRoute(
                    builder: (context) => BlocProvider(
                          create: (context) => GetIt.I.get<OnboardingCubit>(),
                          child: const OnboardingView(),
                        ));
              case Routes.initiativeDetails:
                return MaterialPageRoute(
                    builder: (context) => const EventDetailsView(null));
              case Routes.profile:
                return MaterialPageRoute(
                    builder: (context) => const ProfileView());
              case Routes.editProfile:
                return MaterialPageRoute(
                    builder: (context) => const EditProfileView());
              default:
                return MaterialPageRoute(
                    builder: (context) => const SignInView());
            }
          },
        ),
      ),
    );
  }
}
