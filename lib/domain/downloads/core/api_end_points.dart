import 'package:netflix_clone/core/string.dart';
import 'package:netflix_clone/infrastructure/api_key.dart';

class ApiEndPoints{
  static const downloads = "$Kbase_url/trending/all/day?api_key=$apiKey";
  static const search = '$Kbase_url/search/movie?api_key=$apiKey';

  static const hotAndNewMovie = '$Kbase_url/discover/movie?api_key=$apiKey';
  static const hotAndNewTv = '$Kbase_url/discover/tv?api_key=$apiKey';
  //this might be need to be add in the api key of const search>> &language=en-US&query=spiderman&page=1&include_adult=false#
}