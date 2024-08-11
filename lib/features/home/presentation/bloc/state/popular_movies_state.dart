import 'package:filmo/features/home/domain/entities/movies.dart';

abstract class PopularMoviesState {}

class LoadingPopularState extends PopularMoviesState {}

class GetPopularMoviesSuccess extends PopularMoviesState {
  final List<Movies> movies;

  GetPopularMoviesSuccess({required this.movies});
}

class GetPopularMoviesFailed extends PopularMoviesState {}
