abstract class FavoriteListEvent {}

class LoadFavoriteList extends FavoriteListEvent {
  int id;
  LoadFavoriteList({required this.id});
}
