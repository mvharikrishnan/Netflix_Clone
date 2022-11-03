import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:netflix_clone/domain/New_and_hot/hot_and_new/hot_and_new.dart';
import 'package:netflix_clone/domain/New_and_hot/hot_and_new/hot_and_new_services.dart';
import 'package:netflix_clone/domain/downloads/core/failures/main_failures.dart';

part 'home_event.dart';
part 'home_state.dart';
part 'home_bloc.freezed.dart';

@injectable
class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final HotAndNewServices _homeServies;

  HomeBloc(this._homeServies) : super(HomeState.innital()) {
    //on event get home screen data
    on<GetHomeScreenData>((event, emit) async {
      //send loading to UI
      emit(state.copyWith(isLoading: true, hasError: false));

      //get data
      final _movieresult = await _homeServies.getHotAndNewMovieData();
      final _tvresult = await _homeServies.getHotAndNewTvData();

      //transform data

      final _state1 = _movieresult.fold(
        (MainFailure f) {
          return HomeState(
            stateID: DateTime.now().millisecondsSinceEpoch.toString(),
            pastyearMoviesList: [],
            trendingMovieList: [],
            tenseDramas: [],
            southIndianMovieList: [],
            trendingTvList: [],
            isLoading: false,
            hasError: true,
          );
        },
        (HotAndNew resp) {
          final past_Movie_list = resp.results;
          past_Movie_list.shuffle();

          final trending_Movie_list = resp.results;
          trending_Movie_list.shuffle();

          final tense_Movie_list = resp.results;
          tense_Movie_list.shuffle();

          final SouthIndian_Movie_list = resp.results;
          SouthIndian_Movie_list.shuffle();

          return HomeState(
            stateID: DateTime.now().millisecondsSinceEpoch.toString(),
            pastyearMoviesList: past_Movie_list,
            trendingMovieList: trending_Movie_list,
            tenseDramas: tense_Movie_list,
            southIndianMovieList: SouthIndian_Movie_list,
            trendingTvList: state.trendingTvList,
            isLoading: false,
            hasError: false,
          );
        },
      );

      emit(_state1);

      final _state2 = _tvresult.fold(
        (MainFailure f) {
          return  HomeState(
            stateID: DateTime.now().millisecondsSinceEpoch.toString(),
            pastyearMoviesList: [],
            trendingMovieList: [],
            tenseDramas: [],
            southIndianMovieList: [],
            trendingTvList: [],
            isLoading: false,
            hasError: true,
          );
        },
        (HotAndNew resp) {
          final top10List = resp.results;
          return HomeState(
            stateID: DateTime.now().millisecondsSinceEpoch.toString(),
            pastyearMoviesList: state.pastyearMoviesList,
            trendingMovieList: top10List,
            tenseDramas: state.tenseDramas,
            southIndianMovieList: state.southIndianMovieList,
            trendingTvList: top10List,
            isLoading: false,
            hasError: false,
          );
        },
      );
      emit(_state2);
      //send to UI
    });
  }
}
