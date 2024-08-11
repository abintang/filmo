import 'package:filmo/features/detail_movie/data/data_source/detail_movie_remote_datasource.dart';
import 'package:filmo/features/detail_movie/domain/entities/detail_movies.dart';
import 'package:filmo/features/detail_movie/domain/repositories/detail_movies_repository.dart';

class DetailMoviesRepositoryImpl implements DetailMoviesRepository {
  final DetailMovieRemoteDataSources detailMovieRemoteDataSources;

  DetailMoviesRepositoryImpl({required this.detailMovieRemoteDataSources});

  @override
  Future<DetailMovies> getDetailMovies(int id) async {
    try {
      final responseDetailMovies =
          await detailMovieRemoteDataSources.getDetailMovies(id);
      return responseDetailMovies;
    } catch (e) {
      throw Exception('Unexpected error');
    }
  }
}
