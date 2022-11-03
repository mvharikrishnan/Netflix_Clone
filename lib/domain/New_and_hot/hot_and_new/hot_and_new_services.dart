import 'package:dartz/dartz.dart';
import 'package:netflix_clone/domain/New_and_hot/hot_and_new/hot_and_new.dart';
import 'package:netflix_clone/domain/downloads/core/failures/main_failures.dart';

abstract class HotAndNewServices {
  Future<Either<MainFailure, HotAndNew>> getHotAndNewMovieData();
   Future<Either<MainFailure, HotAndNew>> getHotAndNewTvData();
}
