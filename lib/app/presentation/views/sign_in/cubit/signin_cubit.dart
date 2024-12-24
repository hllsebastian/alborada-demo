import 'package:alborada_demo/app/domain/entities/entities.dart';
import 'package:alborada_demo/app/domain/use_cases/signin_use_case.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'signin_cubit.freezed.dart';
part 'signin_state.dart';

@injectable
class SigninCubit extends Cubit<SigninState> {
  SigninCubit(this.signinUseCase) : super(SigninState.initial());

  final SigninUseCase signinUseCase;

  Future<void> signinUser(String email, String password) async {
    emit(SigninState.loading());
    try {
      final user = await signinUseCase(email, password);
      emit(SigninState.success(user));
    } catch (e) {
      emit(SigninState.error(e.toString()));
    }
  }
}
