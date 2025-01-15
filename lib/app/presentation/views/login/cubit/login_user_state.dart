part of 'login_user_cubit.dart';

@freezed
class LoginUserState with _$LoginUserState {
  const factory LoginUserState.initial() = _Initial;
  const factory LoginUserState.loading() = _Loading;
  const factory LoginUserState.loginSuccess(
    User? user,
    LoginType sucessType,
  ) = LoginSuccess;
  const factory LoginUserState.error(String error) = _Error;
}

extension LoginUserStateX on LoginUserState {
  bool get isLoading => this is _Loading;

  String? get errorMessage => switch (this) {
        _Error(error: final message) => message,
        _ => null,
      };
}
