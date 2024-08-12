import 'package:filmo/features/home/domain/repository/add_movie_to_list_repository.dart';

class PostMovieToList {
  AddMovieToListRepository addMovieToListRepository;
  PostMovieToList({required this.addMovieToListRepository});

  Future<void> call(int accountId, int movieId, String saveType) async {
    await addMovieToListRepository.addMovieToList(accountId, movieId, saveType);
  }
}
