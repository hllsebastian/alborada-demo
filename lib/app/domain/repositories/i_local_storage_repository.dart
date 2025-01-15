import 'package:alborada_demo/app/domain/entities/entities.dart';

abstract class ILocalStorageRepository {
  Future<void> saveUserData(AlboradaUser user);
  Future<AlboradaUser?> getUserData();
  Future<void> clearUserData();
}
