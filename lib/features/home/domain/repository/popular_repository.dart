import 'package:filmo/features/home/domain/entities/movies.dart';

abstract class PopularMoviesRepository {
  Future<List<Movies>> getPopularMovies();
}
