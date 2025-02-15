import 'dart:io';

import 'package:alborada_demo/app/domain/entities/entities.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract class UserRemoteDataSource {
  Future<AlboradaUser> getUser(String id);
  Future<List<Event>> getEvents();
  Future<AlboradaUser> updateUserProfile({
    required String userId,
    String? biography,
    String? name,
    String? lastName,
    String? imageUrl,
  });
  Future<String?> updateUserImage({
    required String userId,
    required File newimage,
    String? urlOldImage,
  });
}

class UserRemoteDataSourceImpl implements UserRemoteDataSource {
  UserRemoteDataSourceImpl(this.supaClient);
  final SupabaseClient supaClient;

  @override
  Future<AlboradaUser> getUser(String id) async {
    final response = await supaClient.from('a_users').select().eq('id', id);
    final dataSetted = response.map((json) => AlboradaUser.fromJson(json));

    String signedUrl = '';
    if (dataSetted.first.profileImage != null &&
        dataSetted.first.profileImage!.isNotEmpty) {
      final imagePath = getFilePathFromUrl(dataSetted.first.profileImage!);
      signedUrl = await supaClient.storage
          .from('user_avatars/avatars/$id')
          .createSignedUrl(imagePath, 3600);
    }
    return dataSetted.first.copyWith(profileImage: signedUrl);
  }

  @override
  Future<List<Event>> getEvents() async {
    final response = await supaClient.rest.from('event').select();
    final dataSetted = response.map((json) => Event.fromJson(json)).toList();
    return dataSetted;
  }

  @override
  Future<AlboradaUser> updateUserProfile({
    required String userId,
    String? biography,
    String? name,
    String? lastName,
    String? imageUrl,
  }) async {
    final response = await supaClient
        .from('a_users')
        .update({
          if (biography != null) 'biography': biography,
          if (name != null) 'name': name,
          if (lastName != null) 'last_name': lastName,
          if (imageUrl != null) 'profile_image_url': imageUrl,
        })
        .eq('id', userId)
        .select();
    final dataSetted = response.map((json) => AlboradaUser.fromJson(json));
    print(dataSetted.first);

    String signedUrlImage = '';
    if (imageUrl != null && imageUrl.isNotEmpty) {
      final imagePath = getFilePathFromUrl(dataSetted.first.profileImage!);
      signedUrlImage = await supaClient.storage
          .from('user_avatars/avatars/$userId')
          .createSignedUrl(imagePath, 3600);
    }
    return dataSetted.first.copyWith(profileImage: signedUrlImage);
    // TODO: error handling
    // if (response.error != null) {
    //   throw Exception(
    //       'Error updating user profile: ${response.error!.message}');
    // }
  }

  @override
  Future<String?> updateUserImage({
    required String userId,
    required File newimage,
    String? urlOldImage,
  }) async {
    try {
      final filePath =
          'avatars/$userId/profile-${DateTime.now().millisecondsSinceEpoch}.jpg';
      await supaClient.storage.from('user_avatars').upload(
            filePath,
            newimage,
            fileOptions: FileOptions(upsert: true),
          );
      final urlImage =
          supaClient.storage.from('user_avatars').getPublicUrl(filePath);
      if (urlOldImage != null && urlOldImage.isNotEmpty) {
        _deleteImage(userId, urlOldImage);
      }
      return urlImage;
    } catch (e) {
      print('Error al subir imagen: $e');
      return null;
    }
  }

  Future<List<FileObject>> _deleteImage(
      String userId, String oldFileName) async {
    try {
      final fileName = getFilePathFromUrl(oldFileName);
      final a = supaClient.storage.from('user_avatars/avatars/$fileName').url;
      print('OBJECCTT: $a');
      return await supaClient.storage
          .from('user_avatars/avatars/$fileName')
          .remove([fileName]);
    } catch (e) {
      print('OLD IMAGE ERROR: $e');
      return [];
    }
  }

  Future<String> _signedUrlImage(String id, String urlImage) async {
    final fileName = getFilePathFromUrl(urlImage);
    return await supaClient.storage
        .from('user_avatars/avatars/$id/$fileName')
        .createSignedUrl(fileName, 3600);
  }

  String getFilePathFromUrl(String url) {
    Uri uri = Uri.parse(url);
    List<String> segments = uri.pathSegments;
    return segments.skip(7).join('/');
  }
}
