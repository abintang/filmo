import 'package:filmo/features/detail_movie/domain/entities/detail_movies.dart';

abstract class DetailMoviesRepository {
  Future<DetailMovies> getDetailMovies(int id);
}
