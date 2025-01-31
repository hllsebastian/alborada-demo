import 'package:alborada_demo/app/domain/entities/entities.dart';
import 'package:alborada_demo/app/domain/use_cases/use_cases.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'alborada_page_cubit.freezed.dart';
part 'alborada_page_state.dart';

@injectable
class AlboradaPageCubit extends Cubit<AlboradaPageState> {
  AlboradaPageCubit(this._useCase) : super(AlboradaPageState.initial());
  final UserUseCases _useCase;

  Future<void> fetchUser(String id) async {
    emit(AlboradaPageState.loading());
    await _useCase.getUser(id).then((user) {
      emit(AlboradaPageState.updated(user));
    }).catchError((e) {
      emit(AlboradaPageState.error(e.toString()));
    });
  }
}
