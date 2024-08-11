import 'package:filmo/features/user/domain/entities/movies.dart';
import 'package:filmo/features/user/domain/repository/favorite_list_repository.dart';

class GetFavoriteList {
  final FavoriteListRepository favoriteListRepository;

  GetFavoriteList({required this.favoriteListRepository});
  Future<List<Movies>> call(int id) async {
    final movies = await favoriteListRepository.getFavoriteList(id);
    return movies;
  }
}
