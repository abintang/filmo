import 'package:filmo/core/usecase/usecase.dart';
import 'package:json_annotation/json_annotation.dart';

class Movies {
  int id;
  String title;
  @JsonKey(name: "vote_count")
  double voteCount;
  @JsonKey(name: "vote_average")
  double rating;
  @JsonKey(name: "poster_path")
  String imagePath;
  @JsonKey(name: "release_date")
  String releaseDate;
  @JsonKey(includeFromJson: false)
  String ellipsizeTitle;
  @JsonKey(includeFromJson: false)
  String ratingLen;

  Movies(
      {required this.id,
      required this.title,
      required this.voteCount,
      required this.rating,
      required this.imagePath,
      required this.releaseDate})
      : ellipsizeTitle = GetEllipsizeString().ellipsizeString(title, 14),
        ratingLen = GetEllipsizeString().limitRating(rating);
}
