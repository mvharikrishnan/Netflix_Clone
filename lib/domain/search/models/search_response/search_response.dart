import 'package:json_annotation/json_annotation.dart';
import 'package:netflix_clone/core/string.dart';

part 'search_response.g.dart';

@JsonSerializable()
class SearchResponse {
  @JsonKey(name: 'results')
  List<SeaerchResultData> results;

  SearchResponse({
    this.results = const [],
  });

  factory SearchResponse.fromJson(Map<String, dynamic> json) {
    return _$SearchResponseFromJson(json);
  }

  Map<String, dynamic> toJson() => _$SearchResponseToJson(this);
}

@JsonSerializable()
class SeaerchResultData {
  @JsonKey(name: 'original_title')
  String? originalTitle;

  @JsonKey(name: 'poster_path')
  String? posterPath;
  String get posterImageUrl => '$imageAppend_URL$posterPath';
  SeaerchResultData({
    this.originalTitle,
    this.posterPath,
  });

  factory SeaerchResultData.fromJson(Map<String, dynamic> json) {
    return _$SeaerchResultDataFromJson(json);
  }

  Map<String, dynamic> toJson() => _$SeaerchResultDataToJson(this);
}
