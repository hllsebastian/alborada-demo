import 'dart:io';

import 'package:alborada_demo/app/domain/entities/alborada_user.dart';
import 'package:alborada_demo/app/domain/use_cases/use_cases.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:image_picker/image_picker.dart';
import 'package:injectable/injectable.dart';

part 'edit_profile_cubit.freezed.dart';
part 'edit_profile_state.dart';

@injectable
class EditProfileCubit extends Cubit<EditProfiletState> {
  EditProfileCubit(this._useCase) : super(EditProfiletState.initial());
  final UserUseCases _useCase;

  Future<void> updateUserProfile(AlboradaUser user) async {
    // emit(EditProfiletState.loading());
    try {
      // final image =
      //     state.maybeMap(updated: (u) => u.selectedImage, orElse: () => null);
      String? imageUrl = '';
      // if (state.selectedImage != null) {
      imageUrl = await updateUserImage();
      // }
      final response = await _useCase.editProfileUser(
        userId: user.id,
        biography: user.biography,
        name: user.name,
        lastName: user.lastName,
        imageUrl: imageUrl,
      );
      emit(EditProfiletState.updated(response, true));
      return;
    } catch (e) {
      emit(EditProfiletState.error(e.toString()));
    }
  }

  Future<void> updateUserState(AlboradaUser? user) async {
    if (user == null) {
      emit(EditProfiletState.error('User not found'));
      return;
    }
    emit(EditProfiletState.updated(user, false));
  }

  Future<void> updateImageState(File? image) async {
    if (state.user == null || image == null) {
      emit(EditProfiletState.error('Something went wrong uploading the image'));
      return;
    }
    emit(EditProfiletState.updated(state.user!, false, selectedImage: image));
  }

  Future<void> updateFields({
    String? name,
    String? lastName,
    String? biography,
    ImageSource? image,
  }) async {
    final user = state.mapOrNull(updated: (a) => a.user);
    if (user == null) {
      emit(EditProfiletState.error('User not found'));
      return;
    }

    // if (image != null) pickImage(image);

    emit(EditProfiletState.updated(
      user.copyWith(
        biography: biography ?? user.biography,
        name: name ?? user.name,
        lastName: lastName ?? user.lastName,
      ),
      false,
    ));
  }

  Future<String?> updateUserImage() async {
    final userId = state.user?.id;
    final image =
        state.maybeMap(updated: (u) => u.selectedImage, orElse: () => null);
    if (userId == null || image == null) {
      emit(EditProfiletState.error('Something went wrong uploading the image'));
      return null;
    }

    emit(EditProfiletState.loading());

    try {
      // Subir imagen al repositorio
      final imageUrl = await _useCase.updateUserImage(
        userId,
        image,
      );

      if (imageUrl == null) {
        emit(EditProfiletState.error('Error al subir la imagen.'));
        return null;
      }
      print('UPDATINGG USER ${state.user}');
      return imageUrl;
    } catch (e) {
      emit(EditProfiletState.error('Error: $e'));
      return null;
    }
  }
}
