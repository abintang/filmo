// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movies_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MoviesModel _$MoviesModelFromJson(Map<String, dynamic> json) => MoviesModel(
      id: (json['id'] as num).toInt(),
      title: json['title'] as String,
      voteCount: (json['vote_count'] as num).toDouble(),
      rating: (json['vote_average'] as num).toDouble(),
      imagePath: json['poster_path'] as String,
      releaseDate: json['release_date'] as String,
    );

Map<String, dynamic> _$MoviesModelToJson(MoviesModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'vote_count': instance.voteCount,
      'vote_average': instance.rating,
      'poster_path': instance.imagePath,
      'release_date': instance.releaseDate,
    };
