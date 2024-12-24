import 'package:alborada_demo/app/domain/entities/entities.dart';
import 'package:alborada_demo/app/domain/use_cases/signin_use_case.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'create_account_cubit.freezed.dart';
part 'create_account_state.dart';

@injectable
class CreateAccountCubit extends Cubit<CreateAccountState> {
  CreateAccountCubit(this.signinUseCase) : super(CreateAccountState.initial());
  final SigninUseCase signinUseCase;

  Future<void> createAccount(String email, String password) async {
    emit(CreateAccountState.loading());
    try {
      final user = await signinUseCase(email, password);
      emit(CreateAccountState.success(user));
    } catch (e) {
      emit(CreateAccountState.error(e.toString()));
    }
  }
}
