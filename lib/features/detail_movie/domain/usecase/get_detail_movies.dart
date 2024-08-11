import 'package:filmo/features/detail_movie/domain/entities/detail_movies.dart';
import 'package:filmo/features/detail_movie/domain/repositories/detail_movies_repository.dart';

class GetDetailMovies {
  final DetailMoviesRepository detailMoviesRepository;

  GetDetailMovies({required this.detailMoviesRepository});
  Future<DetailMovies> call(int id) async {
    final movies = await detailMoviesRepository.getDetailMovies(id);
    return movies;
  }
}
