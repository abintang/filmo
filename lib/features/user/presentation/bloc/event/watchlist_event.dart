abstract class WatchlistEvent {}

class LoadWatchlist extends WatchlistEvent {
  int id;
  LoadWatchlist({required this.id});
}
