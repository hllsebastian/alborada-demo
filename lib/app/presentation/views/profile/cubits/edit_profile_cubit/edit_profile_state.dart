part of 'edit_profile_cubit.dart';

@freezed
class EditProfiletState with _$EditProfiletState {
  const factory EditProfiletState.initial() = _Initial;
  const factory EditProfiletState.loading() = _Loading;
  const factory EditProfiletState.updated(AlboradaUser user, bool isUserUpdated,
      {File? selectedImage}) = _Updated;
  const factory EditProfiletState.error(String message) = _Error;
}

extension EditProfileStateX on EditProfiletState {
  bool get isUserUpdated => this is _Updated;
  bool get isLoading => this is _Updated;

  AlboradaUser? get user => switch (this) {
        _Updated(user: final user) => user,
        _ => null,
      };

  File? get selectedImage => switch (this) {
        _Updated(selectedImage: final selectedImage) => selectedImage,
        _ => null,
      };
}
