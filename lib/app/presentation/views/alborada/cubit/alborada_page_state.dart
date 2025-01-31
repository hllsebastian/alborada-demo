part of 'alborada_page_cubit.dart';

@freezed
class AlboradaPageState with _$AlboradaPageState {
  const factory AlboradaPageState.initial() = _Initial;
  const factory AlboradaPageState.loading() = _Loading;
  const factory AlboradaPageState.updated(AlboradaUser user) = _Updated;
  const factory AlboradaPageState.error(String message) = _Error;
}

extension AlboradaPageStateX on AlboradaPageState {
  bool get isLoading => this is _Loading;
  bool get isUpdated => this is _Updated;

  AlboradaUser get user => (this as _Updated).user;
  String get errorMessage => (this as _Error).message;
}
