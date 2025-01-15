import 'package:alborada_demo/app/domain/entities/entities.dart';
import 'package:bloc/bloc.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class UserCubit extends Cubit<AlboradaUser?> {
  UserCubit() : super(null);

  void setUser(User user) {
    final aUser = AlboradaUser(
      id: user.id,
      email: user.email ?? '',
      createdAt: user.createdAt,
    );
    emit(aUser);
    print(aUser);
  }
}
