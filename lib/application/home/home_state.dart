part of 'home_bloc.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState({
    required String stateID,
    required List<HotAndNewData> pastyearMoviesList,
    required List<HotAndNewData> trendingMovieList,
    required List<HotAndNewData> tenseDramas,
    required List<HotAndNewData> southIndianMovieList,
    required List<HotAndNewData> trendingTvList,
    required bool isLoading,
    required bool hasError,
  }) = _Initial;

  factory HomeState.innital() => const HomeState(
        stateID: '0',
        pastyearMoviesList: [],
        trendingMovieList: [],
        tenseDramas: [],
        southIndianMovieList: [],
        trendingTvList: [],
        isLoading: false,
        hasError: false,
      );
}
