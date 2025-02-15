import 'package:alborada_demo/app/presentation/routes/routes.dart';
import 'package:alborada_demo/app/presentation/views/alborada/alborada_page_view.dart';
import 'package:alborada_demo/app/presentation/views/create_account.dart/create_account_view.dart';
import 'package:alborada_demo/app/presentation/views/forgot_password/forgot_password.dart';
import 'package:alborada_demo/app/presentation/views/login/login_view.dart';
import 'package:alborada_demo/app/presentation/views/onboarding/cubit/onboarding_cubit.dart';
import 'package:alborada_demo/app/presentation/views/onboarding/onboarding_view.dart';
import 'package:alborada_demo/app/presentation/views/profile/views/edit_profile_view.dart';
import 'package:alborada_demo/app/presentation/views/profile/views/profile_view.dart';
import 'package:alborada_demo/app/presentation/views/sign_in/view/sign_in_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'presentation/views/cubit/user_cubit/user_cubit.dart';
import 'presentation/views/event_details/event_details_view.dart';

class AlboradaApp extends StatelessWidget {
  const AlboradaApp({super.key, this.flavor = 'env'});
  final String flavor;

  @override
  Widget build(BuildContext context) {
    // TODO: try to "currentUser" from UserCubit
    final currentUser = Supabase.instance.client.auth.currentUser;
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: BlocProvider(
        create: (context) =>
            GetIt.I.get<UserCubit>()..fetchUser(currentUser?.id),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            appBarTheme: AppBarTheme(
              backgroundColor: Colors.white,
              elevation: 0,
            ),
          ),
          initialRoute: currentUser != null ? Routes.pageView : Routes.signIn,
          onGenerateRoute: (settings) {
            return _alboradaRoutes(settings);
          },
        ),
      ),
    );
  }

  MaterialPageRoute<dynamic> _alboradaRoutes(RouteSettings settings) {
    return switch (settings.name) {
      Routes.pageView => MaterialPageRoute(
          builder: (context) => const AlboradaPageView(),
        ),
      Routes.login => MaterialPageRoute(
          builder: (context) => const LoginView(),
        ),
      Routes.createAccount => MaterialPageRoute(
          builder: (context) => const CreateAccountView(),
        ),
      Routes.forgotPassword => MaterialPageRoute(
          builder: (context) => const ForgotPassword(),
        ),
      Routes.onboarding => MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => GetIt.I.get<OnboardingCubit>(),
            child: const OnboardingView(),
          ),
        ),
      Routes.initiativeDetails => MaterialPageRoute(
          builder: (context) => const EventDetailsView(null),
        ),
      Routes.profile => MaterialPageRoute(
          builder: (context) => const ProfileView(),
        ),
      Routes.editProfile => MaterialPageRoute(
          builder: (context) => const EditProfileView(),
        ),
      _ => MaterialPageRoute(
          builder: (context) => const SignInView(),
        )
    };
  }
}
