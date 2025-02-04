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
    emit(EditProfiletState.loading());
    try {
      final response = await _useCase.editProfileUser(
        userId: user.id,
        biography: user.biography,
        name: user.name,
        lastName: user.lastName,
      );
      emit(EditProfiletState.updated(response, true));
      return;
    } catch (e) {
      emit(EditProfiletState.error(e.toString()));
    }
  }

  Future<void> updateState(AlboradaUser? user) async {
    if (user == null) {
      emit(EditProfiletState.error('User not found'));
      return;
    }
    emit(EditProfiletState.updated(user, false));
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

  Future<File?> pickImage(ImageSource source) async {
    final ImagePicker picker = ImagePicker();
    final XFile? pickedFile = await picker.pickImage(source: source);

    if (pickedFile != null) {
      return File(pickedFile.path);
    }
    return null;
  }
}
