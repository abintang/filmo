import 'package:filmo/features/user/domain/entities/movies.dart';

abstract class WatchlistState {}

class LoadingState extends WatchlistState {}

class GetWatchlistSuccess extends WatchlistState {
  final List<Movies> movies;
  GetWatchlistSuccess({required this.movies});
}

class GetWatchlistFailed extends WatchlistState {}
