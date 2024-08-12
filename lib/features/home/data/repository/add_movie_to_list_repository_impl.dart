import 'package:filmo/features/home/data/data_sources/add_movie_to_list_remote_datasource.dart';
import 'package:filmo/features/home/domain/repository/add_movie_to_list_repository.dart';

class AddMovieToListRepositoryImpl implements AddMovieToListRepository {
  final AddMovieToListRemoteDataSource addMovieToListRemoteDataSource;

  AddMovieToListRepositoryImpl({required this.addMovieToListRemoteDataSource});

  @override
  Future<void> addMovieToList(
      int accountId, int movieId, String saveType) async {
    await addMovieToListRemoteDataSource.addMovieToList(
        accountId, movieId, saveType);
  }
}
