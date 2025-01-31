import 'package:alborada_demo/app/domain/entities/entities.dart';
import 'package:alborada_demo/app/domain/use_cases/user_use_cases.dart';
import 'package:bloc/bloc.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class UserCubit extends Cubit<AlboradaUser?> {
  UserCubit(this._useCase) : super(null);

  final UserUseCases _useCase;

  void setUser(User? user) {
    if (user == null) {
      emit(null);
      return;
    }
    final aUser = AlboradaUser(
      id: user.id,
      email: user.email ?? '',
      createdAt: user.createdAt,
    );
    emit(aUser);
    print(aUser);
  }

  Future<void> fetchUser(String? id) async {
    if (id == null) {
      print('NOT LOGED IN');
      return;
    }
    await _useCase.getUser(id).then((user) {
      emit(user);
    }).catchError((e) {
      print(e.toString());
    });
  }

  Future<void> emitUser(AlboradaUser user) async {
    emit(user);
  }
}
