import 'package:alborada_demo/app/domain/use_cases/auth_and_login_use_cases.dart';
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

  final AuthAndLoginUseCases useruseCase;

  Future<void> login(String email, String password) async {
    emit(LoginUserState.loading());
    try {
      final userLogin = await useruseCase.login(email, password);
      final user = await useruseCase.getUser(email);
      if (userLogin.id.isNotEmpty && user.isEmpty) {
        emit(LoginUserState.loginSuccess(userLogin, LoginType.onBoarding));
        return;
      }

      emit(
        LoginUserState.loginSuccess(userLogin, LoginType.loginSuccess),
      );
    } on AuthApiException catch (e) {
      emit(LoginUserState.error(e.message));
    } on PostgrestException catch (e) {
      if (e.message == 'Not Found') {
        emit(LoginUserState.loginSuccess(null, LoginType.onBoarding));
      }
    } catch (e) {
      emit(LoginUserState.error('Something went wrong'));
    }
  }
}
