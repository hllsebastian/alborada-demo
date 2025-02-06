import 'package:alborada_demo/app/core/core.dart';
import 'package:alborada_demo/app/data/data_sources/remote/auth_remote_data_source.dart';
import 'package:alborada_demo/app/data/data_sources/remote/user_remote_data_source.dart';
import 'package:alborada_demo/app/data/repositories/auth_repository_impl.dart';
import 'package:alborada_demo/app/data/repositories/user_repository_impl.dart';
import 'package:alborada_demo/app/domain/repositories/repositories.dart';
import 'package:alborada_demo/app/domain/use_cases/auth_and_login_use_cases.dart';
import 'package:alborada_demo/app/domain/use_cases/user_use_cases.dart';
import 'package:alborada_demo/app/presentation/views/alborada/cubit/alborada_page_cubit.dart';
import 'package:alborada_demo/app/presentation/views/create_account.dart/cubit/create_account_cubit.dart';
import 'package:alborada_demo/app/presentation/views/home/cubit/home_cubit.dart';
import 'package:alborada_demo/app/presentation/views/login/cubit/login_user_cubit.dart';
import 'package:alborada_demo/app/presentation/views/onboarding/cubit/onboarding_cubit.dart';
import 'package:alborada_demo/app/presentation/views/profile/cubits/edit_profile_cubit/edit_profile_cubit.dart';
import 'package:get_it/get_it.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../presentation/views/cubit/user_cubit/user_cubit.dart';

final getIt = GetIt.instance;

Future<void> setupServiceLocator() async {
// Supabase client
  getIt.registerLazySingleton<SupabaseClient>(
    () => Supabase.instance.client,
  );

// Logger
  getIt.registerLazySingleton<Logger>(() => Logger());

// Datasource
  getIt.registerLazySingleton<AuthRemoteDataSource>(
    () => AuthRemoteDataSourceImpl(getIt<SupabaseClient>()),
  );
  getIt.registerLazySingleton<UserRemoteDataSource>(
    () => UserRemoteDataSourceImpl(getIt<SupabaseClient>()),
  );

// Repository
  getIt.registerLazySingleton<IAuthRepository>(
      () => AuthRepositoryImpl(getIt<AuthRemoteDataSource>()));
  getIt.registerLazySingleton<IUserRepository>(
      () => UserRepositoryImpl(getIt<UserRemoteDataSource>()));

// Use Case
  getIt.registerLazySingleton<AuthAndLoginUseCases>(
      () => AuthAndLoginUseCases(getIt<IAuthRepository>()));
  getIt.registerLazySingleton<UserUseCases>(
      () => UserUseCases(getIt<IUserRepository>()));

// Cubits
  // getIt.registerFactory<SigninCubit>(() => SigninCubit(getIt<SigninUseCase>()));
  getIt.registerFactory<CreateAccountCubit>(
      () => CreateAccountCubit(getIt<AuthAndLoginUseCases>()));
  getIt.registerFactory<LoginUserCubit>(
      () => LoginUserCubit(getIt<AuthAndLoginUseCases>()));
  getIt.registerFactory<OnboardingCubit>(
      () => OnboardingCubit(getIt<AuthAndLoginUseCases>()));
  getIt.registerFactory<UserCubit>(() => UserCubit(getIt<UserUseCases>()));
  getIt.registerFactory<HomeCubit>(() => HomeCubit(getIt<UserUseCases>()));
  getIt.registerFactory<EditProfileCubit>(
      () => EditProfileCubit(getIt<UserUseCases>()));
  getIt.registerFactory<AlboradaPageCubit>(
      () => AlboradaPageCubit(getIt<UserUseCases>()));
}
