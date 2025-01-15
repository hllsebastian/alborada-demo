import 'package:alborada_demo/app/domain/entities/entities.dart';
import 'package:alborada_demo/app/domain/use_cases/use_cases.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'home_cubit.freezed.dart';
part 'home_state.dart';

@injectable
class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this.useCase) : super(HomeState.initial());

  final UserUseCases useCase;

  Future<void> fetchEvents() async {
    emit(HomeState.loading());
    final events = await useCase.getEvents();
    print(events);
    emit(HomeState.success(events));
  }
}
