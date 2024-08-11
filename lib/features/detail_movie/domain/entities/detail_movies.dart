import 'package:filmo/core/usecase/usecase.dart';
import 'package:filmo/features/detail_movie/data/models/genres_model.dart';
import 'package:json_annotation/json_annotation.dart';

class DetailMovies {
  String title;
  @JsonKey(name: "vote_count")
  double voteCount;
  @JsonKey(name: "vote_average")
  double rating;
  @JsonKey(name: "poster_path")
  String imagePath;
  @JsonKey(name: "release_date")
  String releaseDate;
  String overview;
  List<GenresModel> genres;
  @JsonKey(includeFromJson: false)
  String ratingLen;

  DetailMovies(
      {required this.title,
      required this.imagePath,
      required this.overview,
      required this.rating,
      required this.releaseDate,
      required this.voteCount,
      required this.genres})
      : ratingLen = GetEllipsizeString().limitRating(rating);
}
