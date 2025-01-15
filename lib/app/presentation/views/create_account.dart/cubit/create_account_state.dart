part of 'create_account_cubit.dart';

@freezed
class CreateAccountState with _$CreateAccountState {
  const factory CreateAccountState.initial() = _Initial;
  const factory CreateAccountState.loading() = _Loading;
  const factory CreateAccountState.createAccountSuccess(
    AlboradaUser user,
    LoginType sucessType,
  ) = _CreateAccountSuccess;
  const factory CreateAccountState.error(String error) = _Error;
}

extension CreateAccountStateX on CreateAccountState {
  bool get isLoading => this is _Loading;
}
