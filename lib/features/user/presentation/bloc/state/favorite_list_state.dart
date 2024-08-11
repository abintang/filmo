import 'package:filmo/features/user/domain/entities/movies.dart';

abstract class FavoriteListState {}

class LoadingFavoriteState extends FavoriteListState {}

class GetFavoriteListSuccess extends FavoriteListState {
  final List<Movies> movies;
  GetFavoriteListSuccess({required this.movies});
}

class GetFavoriteListFailed extends FavoriteListState {}
