import 'package:filmo/features/home/domain/entities/movies.dart';

abstract class NowPlayingState {}

class LoadingState extends NowPlayingState {}

class GetNowPlayingSuccess extends NowPlayingState {
  final List<Movies> movies;

  GetNowPlayingSuccess({required this.movies});
}

class GetNowPlayingFailed extends NowPlayingState {}
