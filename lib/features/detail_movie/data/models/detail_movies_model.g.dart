// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'detail_movies_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DetailMoviesModel _$DetailMoviesModelFromJson(Map<String, dynamic> json) =>
    DetailMoviesModel(
      title: json['title'] as String,
      imagePath: json['poster_path'] as String,
      overview: json['overview'] as String,
      rating: (json['vote_average'] as num).toDouble(),
      releaseDate: json['release_date'] as String,
      voteCount: (json['vote_count'] as num).toDouble(),
      genres: (json['genres'] as List<dynamic>)
          .map((e) => GenresModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DetailMoviesModelToJson(DetailMoviesModel instance) =>
    <String, dynamic>{
      'title': instance.title,
      'vote_count': instance.voteCount,
      'vote_average': instance.rating,
      'poster_path': instance.imagePath,
      'release_date': instance.releaseDate,
      'overview': instance.overview,
      'genres': instance.genres,
    };
