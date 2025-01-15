part of 'home_cubit.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState.initial() = _Initial;
  const factory HomeState.loading() = _Loading;
  const factory HomeState.success(List<Event> events) = _Success;
  const factory HomeState.error() = _Error;
}

extension HomeStateX on HomeState {
  bool get isLoading => this is _Loading;
  List<Event> get events => switch (this) {
        _Success(:final events) => events,
        _ => [],
      };
}
