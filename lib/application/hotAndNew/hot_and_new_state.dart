part of 'hot_and_new_bloc.dart';

@freezed
class HotAndNewState with _$HotAndNewState {
  const factory HotAndNewState({
    required List<HotAndNewData> commingsoonList,
    required List<HotAndNewData> everyoneswatchingList,
    required bool isLoading,
    required bool hasError,
  }) = _Initial;

  factory HotAndNewState.initial() => const HotAndNewState(
        commingsoonList: [],
        everyoneswatchingList: [],
        hasError: false,
        isLoading: false,
      );
}
