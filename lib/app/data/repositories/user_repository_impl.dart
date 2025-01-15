import 'package:alborada_demo/app/data/data_sources/remote/user_remote_data_source.dart';
import 'package:alborada_demo/app/domain/entities/entities.dart';
import 'package:alborada_demo/app/domain/repositories/i_user_repository.dart';

class UserRepositoryImpl implements IUserRepository {
  UserRepositoryImpl(this.remotoDataSource);
  final UserRemoteDataSource remotoDataSource;

  @override
  Future<List<Event>> getEvents() async {
    try {
      return await remotoDataSource.getEvents();
    } catch (e) {
      throw Exception('Repo Error: $e');
    }
  }
}
