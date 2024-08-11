import 'package:filmo/features/home/domain/entities/movies.dart';
import 'package:filmo/features/home/domain/repository/popular_repository.dart';

class GetPopularMovies {
  PopularMoviesRepository popularMoviesRepository;
  GetPopularMovies({required this.popularMoviesRepository});

  Future<List<Movies>> call() async {
    final movies = await popularMoviesRepository.getPopularMovies();
    return movies.take(20).toList();
  }
}
