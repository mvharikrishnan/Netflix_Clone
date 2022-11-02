import 'package:dartz/dartz.dart';
import 'package:netflix_clone/domain/downloads/core/failures/main_failures.dart';
import 'package:netflix_clone/domain/search/models/search_response/search_response.dart';

abstract class SearchServices{
Future<Either<MainFailure,SearchResponse>> searchMovies({
  required String movieQuery,
});
}