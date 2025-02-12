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
  Future<String?> updateUserImage(String userId, File image);
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
          .from('user_avatars/avatars')
          .createSignedUrl(imagePath, 3600);
      print('SIGNED $signedUrl');
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
    return dataSetted.first;
    // TODO: error handling
    // if (response.error != null) {
    //   throw Exception(
    //       'Error updating user profile: ${response.error!.message}');
    // }
  }

  @override
  Future<String?> updateUserImage(String userId, File image) async {
    try {
      final filePath =
          'avatars/$userId-${DateTime.now().millisecondsSinceEpoch}.jpg';
      await supaClient.storage.from('user_avatars').upload(
            filePath,
            image,
            fileOptions: FileOptions(upsert: true),
          );
      return supaClient.storage.from('user_avatars').getPublicUrl(filePath);
    } catch (e) {
      print('Error al subir imagen: $e');
    }
    return null;
  }

  String getFilePathFromUrl(String url) {
    Uri uri = Uri.parse(url);
    List<String> segments = uri.pathSegments;

    // Omitimos las 3 primeras partes de la URL y reconstruimos la ruta
    var path = segments.skip(6).join('/');
    print('PATH $path');
    return path;
  }
}
