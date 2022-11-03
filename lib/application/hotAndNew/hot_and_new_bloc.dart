import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:netflix_clone/domain/New_and_hot/hot_and_new/hot_and_new.dart';
import 'package:netflix_clone/domain/New_and_hot/hot_and_new/hot_and_new_services.dart';
import 'package:netflix_clone/domain/downloads/core/failures/main_failures.dart';

part 'hot_and_new_event.dart';
part 'hot_and_new_state.dart';
part 'hot_and_new_bloc.freezed.dart';

@injectable
class HotAndNewBloc extends Bloc<HotAndNewEvent, HotAndNewState> {
  final HotAndNewServices _hotANdNewService;
  HotAndNewBloc(this._hotANdNewService) : super(HotAndNewState.initial()) {
    //getting hot and new movie data
    on<LoadDataInCommingSoon>((event, emit) async {
      //send loading to Ui
      emit(
        const HotAndNewState(
          commingsoonList: [],
          everyoneswatchingList: [],
          isLoading: true,
          hasError: false,
        ),
      );
      //get data from remote
      final _result = await _hotANdNewService.getHotAndNewMovieData();

      //data to state
      final newState = _result.fold(
        (MainFailure f) {
          return const HotAndNewState(
            commingsoonList: [],
            everyoneswatchingList: [],
            isLoading: false,
            hasError: true,
          );
        },
        (HotAndNew resp) {
          return HotAndNewState(
            commingsoonList: resp.results,
            everyoneswatchingList: state.everyoneswatchingList,
            isLoading: false,
            hasError: false,
          );
        },
      );
      emit(newState);
    });

    //get hot and new tv data
    on<LoadDataInEveryonesWatching>((event, emit)async {
       //send loading to Ui
      emit(
        const HotAndNewState(
          commingsoonList: [],
          everyoneswatchingList: [],
          isLoading: true,
          hasError: false,
        ),
      );
      //get data from remote
      final _result = await _hotANdNewService.getHotAndNewTvData();

      //data to state
      final newState = _result.fold(
        (MainFailure f) {
          return const HotAndNewState(
            commingsoonList: [],
            everyoneswatchingList: [],
            isLoading: false,
            hasError: true,
          );
        },
        (HotAndNew resp) {
          return HotAndNewState(
            commingsoonList: state.commingsoonList,
            everyoneswatchingList: resp.results,
            isLoading: false,
            hasError: false,
          );
        },
      );
      emit(newState);
    });
  }
}
