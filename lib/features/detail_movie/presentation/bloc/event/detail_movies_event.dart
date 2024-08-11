abstract class DetailMoviesEvent {}

class LoadDetailMovies extends DetailMoviesEvent {
  int id;
  LoadDetailMovies({required this.id});
}
