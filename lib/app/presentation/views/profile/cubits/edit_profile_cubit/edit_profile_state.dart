part of 'edit_profile_cubit.dart';

@freezed
class EditProfiletState with _$EditProfiletState {
  const factory EditProfiletState.initial() = _Initial;
  const factory EditProfiletState.loading() = _Loading;
  const factory EditProfiletState.updated(
      AlboradaUser user, bool isUserUpdated) = _Updated;
  const factory EditProfiletState.error(String message) = _Error;
}

extension EditProfileStateX on EditProfiletState {
  bool get isUserUpdated => this is _Updated;
}
