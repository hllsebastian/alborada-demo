import 'dart:convert';

import 'package:alborada_demo/app/domain/entities/alborada_user.dart';
import 'package:alborada_demo/app/domain/repositories/repositories.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalStorageImpl implements ILocalStorageRepository {
  static const _userKey = 'userKey';

  @override
  Future<void> clearUserData() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('userKey');
  }

  @override
  Future<AlboradaUser?> getUserData() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final data = prefs.getString(_userKey);
      if (data == null) return null;
      final userData = jsonDecode(data) as Map<String, dynamic>;
      return AlboradaUser.fromJson(userData);
    } on Exception catch (e) {
      if (kDebugMode) {
        debugPrint(e.toString());
      }
      return null;
    }
  }

  @override
  Future<void> saveUserData(AlboradaUser user) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final userData = user.toJson();
      prefs.setString(_userKey, jsonEncode(userData));
    } on Exception catch (e) {
      if (kDebugMode) {
        debugPrint(e.toString());
      }
    }
  }
}
