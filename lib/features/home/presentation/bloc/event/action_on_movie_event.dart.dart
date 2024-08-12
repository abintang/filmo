abstract class ActionOnMovieEvent {}

class AddListMovieEvent extends ActionOnMovieEvent {
  int accountId;
  int movieId;
  String saveType;

  AddListMovieEvent(
      {required this.accountId, required this.movieId, required this.saveType});
}
