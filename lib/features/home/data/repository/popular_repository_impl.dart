import 'package:filmo/features/home/data/data_sources/popular_remote_datasources.dart';
import 'package:filmo/features/home/domain/entities/movies.dart';
import 'package:filmo/features/home/domain/repository/popular_repository.dart';

class PopularMoviesRepositoryImpl implements PopularMoviesRepository {
  final PopularRemoteDataSources popularRemoteDataSources;

  PopularMoviesRepositoryImpl({required this.popularRemoteDataSources});

  @override
  Future<List<Movies>> getPopularMovies() async {
    final getPopularMovies = await popularRemoteDataSources.getPopularMovies();

    return getPopularMovies;
  }
}
