import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:netflix_clone/domain/downloads/core/failures/main_failures.dart';
import 'package:netflix_clone/domain/downloads/models/downloadsModel.dart';
import 'package:netflix_clone/domain/downloads/models/i_downloads_repo.dart';
import 'package:netflix_clone/domain/search/models/search_response/search_response.dart';
import 'package:netflix_clone/domain/search/search_services.dart';

part 'search_event.dart';
part 'search_state.dart';
part 'search_bloc.freezed.dart';

@injectable
class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final IDownloadsRepo _downloadsServices;
  final SearchServices _searchServies;
  SearchBloc(this._downloadsServices, this._searchServies)
      : super(SearchState.initial()) {
    /*
  idile State
  */
    on<Initialize>((event, emit) async {
      if (state.idelList.isNotEmpty) {
        emit(
          SearchState(
            searchResultList: [],
            idelList: state.idelList,
            isLoading: true,
            isError: false,
          ),
        );
      }
      emit(
        const SearchState(
          searchResultList: [],
          idelList: [],
          isLoading: true,
          isError: false,
        ),
      );
      //get trending and show to Ui
      final _result = await _downloadsServices.getDownloadsImages();
      final _state = _result.fold(
        (MainFailure f) {
          return const SearchState(
            searchResultList: [],
            idelList: [],
            isLoading: false,
            isError: true,
          );
        },
        (List<Downloads> list) {
          return SearchState(
            searchResultList: [],
            idelList: list,
            isLoading: false,
            isError: false,
          );
        },
      );
      emit(_state);
    });

    /*
  Search result state
  */
    on<SearchMovie>((event, emit) async {
      // call search movie to api and show to UI
      log('Searching for ${event.movieQuery}');
      emit(
        const SearchState(
          searchResultList: [],
          idelList: [],
          isLoading: true,
          isError: false,
        ),
      );
      final _result =
          await _searchServies.searchMovies(movieQuery: event.movieQuery);
      final _state = _result.fold(
        (MainFailure f) {
          return const SearchState(
            searchResultList: [],
            idelList: [],
            isLoading: false,
            isError: true,
          );
        },
        (SearchResponse r) {
          return SearchState(
            searchResultList: r.results,
            idelList: [],
            isLoading: false,
            isError: false,
          );
        },
      );
      emit(_state);
    });
  }
}
