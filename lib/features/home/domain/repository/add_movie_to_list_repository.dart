abstract class AddMovieToListRepository {
  Future<void> addMovieToList(int accountId, int movieId, String saveType);
}
