import 'package:alborada_demo/app/domain/entities/entities.dart';
import 'package:alborada_demo/app/domain/use_cases/use_cases.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'onboarding_cubit.freezed.dart';
part 'onboarding_state.dart';

@injectable
class OnboardingCubit extends Cubit<OnboardingState> {
  OnboardingCubit(this.useCase) : super(OnboardingState.initial());

  final AuthAndLoginUseCases useCase;

  Future<void> createUser(AlboradaUser user) async {
    final response = useCase.createUser(user);
    print(response);
  }
}
