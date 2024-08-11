import 'package:filmo/features/detail_movie/domain/entities/detail_movies.dart';

abstract class DetailMoviesState {}

class LoadingDetailMovies extends DetailMoviesState {}

class GetDetailMoviesSuccess extends DetailMoviesState {
  DetailMovies detailMovies;
  GetDetailMoviesSuccess({required this.detailMovies});
}

class GetDetailMoviesFailed extends DetailMoviesState {}
