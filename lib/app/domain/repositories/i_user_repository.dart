import 'package:alborada_demo/app/domain/entities/entities.dart';

abstract class IUserRepository {
  Future<List<Event>> getEvents();
}
