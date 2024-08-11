import 'package:filmo/features/user/domain/entities/movies.dart';
import 'package:json_annotation/json_annotation.dart';
part 'movies_model.g.dart';

@JsonSerializable()
class MoviesModel extends Movies {
  MoviesModel(
      {required super.id,
      required super.title,
      required super.voteCount,
      required super.rating,
      required super.imagePath,
      required super.releaseDate});

  factory MoviesModel.fromJson(Map<String, dynamic> json) =>
      _$MoviesModelFromJson(json);

  Map<String, dynamic> toJson() => _$MoviesModelToJson(this);
}
