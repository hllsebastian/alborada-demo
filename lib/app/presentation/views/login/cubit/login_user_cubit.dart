import 'package:alborada_demo/app/domain/use_cases/user_use_cases.dart';
import 'package:alborada_demo/app/presentation/presentation.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'login_user_cubit.freezed.dart';
part 'login_user_state.dart';

@injectable
class LoginUserCubit extends Cubit<LoginUserState> {
  LoginUserCubit(this.useruseCase) : super(LoginUserState.initial());

  final UserUseCases useruseCase;

  Future<void> login(String email, String password) async {
    emit(LoginUserState.loading());
    try {
      final user = await useruseCase.login(email, password);
      emit(LoginUserState.loginSuccess(user, SuccessType.loginSuccess));
    } on AuthApiException catch (e) {
      emit(LoginUserState.error(e.message));
    } catch (e) {
      emit(LoginUserState.error('Something went wrong'));
    }
  }
}
