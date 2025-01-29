import 'package:alborada_demo/app/data/data_sources/remote/user_remote_data_source.dart';
import 'package:alborada_demo/app/domain/entities/entities.dart';
import 'package:alborada_demo/app/domain/repositories/i_user_repository.dart';

class UserRepositoryImpl implements IUserRepository {
  UserRepositoryImpl(this.remoteDataSource);
  final UserRemoteDataSource remoteDataSource;

  @override
  Future<List<Event>> getEvents() async {
    try {
      return await remoteDataSource.getEvents();
    } catch (e) {
      throw Exception('Repo Error: $e');
    }
  }

  @override
  Future<void> editUserProfile(
      {required String userId,
      String? biography,
      List<String>? interests,
      int? totalPoints}) async {
    await remoteDataSource.updateUserProfile(
      userId: userId,
      biography: biography,
      interests: interests,
      totalPoints: totalPoints,
    );
  }
}
