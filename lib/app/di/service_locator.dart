import 'package:alborada_demo/app/core/core.dart';
import 'package:alborada_demo/app/data/data_sources/remote/auth_remote_data_source.dart';
import 'package:alborada_demo/app/data/repositories/auth_repository_impl.dart';
import 'package:alborada_demo/app/domain/repositories/auth_repository.dart';
import 'package:alborada_demo/app/domain/use_cases/create_account_use_case.dart';
import 'package:alborada_demo/app/presentation/views/create_account.dart/cubit/create_account_cubit.dart';
import 'package:get_it/get_it.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
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

// Repository
  getIt.registerLazySingleton<AuthRepository>(
      () => AuthRepositoryImpl(getIt<AuthRemoteDataSource>()));

// Use Case
  getIt.registerLazySingleton<CreateAccountUseCase>(
      () => CreateAccountUseCase(getIt<AuthRepository>()));

// Cubits
  // getIt.registerFactory<SigninCubit>(() => SigninCubit(getIt<SigninUseCase>()));
  getIt.registerFactory<CreateAccountCubit>(
      () => CreateAccountCubit(getIt<CreateAccountUseCase>()));
}
