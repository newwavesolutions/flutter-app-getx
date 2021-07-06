import 'package:json_annotation/json_annotation.dart';

part 'movie_entity.g.dart';

@JsonSerializable()
class MovieEntity {
  @JsonKey()
  String? title;
  @JsonKey(name: 'poster_path')
  String? posterPath;
  @JsonKey(name: 'backdrop_path')
  String? backdropPath;
  @JsonKey(name: 'vote_average')
  double? voteAverage;
  @JsonKey()
  String? overview;
  @JsonKey(name: 'release_date')
  String? releaseDate;

  MovieEntity({
    this.title,
    this.posterPath,
    this.backdropPath,
    this.voteAverage,
    this.overview,
    this.releaseDate,
  });

  factory MovieEntity.fromJson(Map<String, dynamic> json) => _$MovieEntityFromJson(json);

  Map<String, dynamic> toJson() => _$MovieEntityToJson(this);

  @JsonKey(ignore: true)
  String get posterUrl {
    return 'https://image.tmdb.org/t/p/w185' + (posterPath ?? "");
  }
}
