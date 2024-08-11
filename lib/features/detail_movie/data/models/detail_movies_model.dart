import 'package:filmo/features/detail_movie/data/models/genres_model.dart';
import 'package:filmo/features/detail_movie/domain/entities/detail_movies.dart';
import 'package:json_annotation/json_annotation.dart';
part 'detail_movies_model.g.dart';

@JsonSerializable()
class DetailMoviesModel extends DetailMovies {
  DetailMoviesModel(
      {required super.title,
      required super.imagePath,
      required super.overview,
      required super.rating,
      required super.releaseDate,
      required super.voteCount,
      required super.genres});

  factory DetailMoviesModel.fromJson(Map<String, dynamic> json) =>
      _$DetailMoviesModelFromJson(json);

  Map<String, dynamic> toJson() => _$DetailMoviesModelToJson(this);
}
