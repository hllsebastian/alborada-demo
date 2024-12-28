import 'package:alborada_demo/app/domain/entities/entities.dart';
import 'package:alborada_demo/app/domain/use_cases/user_use_cases.dart';
import 'package:alborada_demo/app/presentation/enums/enums.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'create_account_cubit.freezed.dart';
part 'create_account_state.dart';

@injectable
class CreateAccountCubit extends Cubit<CreateAccountState> {
  CreateAccountCubit(this.signinUseCase) : super(CreateAccountState.initial());
  final UserUseCases signinUseCase;

  Future<void> createAccount(String email, String password) async {
    emit(CreateAccountState.loading());
    try {
      final user = await signinUseCase.create(email, password);
      emit(
        CreateAccountState.createAccountSuccess(
          user,
          user.id.isNotEmpty
              ? SuccessType.confirmEmail
              : SuccessType.accountAlreadyExists,
          // TODO: Verify email before continue the onboarding
          // user.confirmationSentAt == null
          //     ? SuccessType.confirmEmail
          //     : SuccessType.accountAlreadyExists,
        ),
      );
    } catch (e) {
      emit(CreateAccountState.error(e.toString()));
    }
  }
}
