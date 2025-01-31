import 'package:alborada_demo/app/data/data_sources/remote/user_remote_data_source.dart';
import 'package:alborada_demo/app/domain/entities/entities.dart';
import 'package:alborada_demo/app/domain/repositories/i_user_repository.dart';

class UserRepositoryImpl implements IUserRepository {
  UserRepositoryImpl(this.remoteDataSource);
  final UserRemoteDataSource remoteDataSource;

  @override
  Future<AlboradaUser> getUser(String id) async {
    return await remoteDataSource.getUser(id);
  }

  @override
  Future<List<Event>> getEvents() async {
    try {
      return await remoteDataSource.getEvents();
    } catch (e) {
      throw Exception('Repo Error: $e');
    }
  }

  @override
  Future<AlboradaUser> editUserProfile({
    required String userId,
    String? biography,
    String? name,
    String? lastName,
  }) async {
    final response = await remoteDataSource.updateUserProfile(
      userId: userId,
      biography: biography,
      name: name,
      lastName: lastName,
    );
    return response;
  }
}
