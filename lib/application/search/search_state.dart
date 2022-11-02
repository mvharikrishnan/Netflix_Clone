part of 'search_bloc.dart';

@freezed
class SearchState with _$SearchState {
  const factory SearchState({
    required List<SeaerchResultData> searchResultList,
    required List<Downloads> idelList,
    required bool isLoading,
    required bool isError,
  }) = _SearchState;

  factory SearchState.initial() => const SearchState(
        searchResultList: [],
        idelList: [],
        isLoading: false,
        isError: false,
      );
}
