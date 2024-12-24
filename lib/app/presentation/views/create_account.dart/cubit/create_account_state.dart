part of 'create_account_cubit.dart';

@freezed
class CreateAccountState with _$CreateAccountState {
  const factory CreateAccountState.initial() = _Initial;
  const factory CreateAccountState.loading() = _Loading;
  const factory CreateAccountState.success(AlboradaUser user) = _Success;
  const factory CreateAccountState.error(String user) = _Error;
}
