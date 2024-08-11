import 'package:filmo/features/user/data/data_sources/favorite_list_remote_datasources.dart';
import 'package:filmo/features/user/domain/entities/movies.dart';
import 'package:filmo/features/user/domain/repository/favorite_list_repository.dart';

class FavoriteListRepositoryImpl implements FavoriteListRepository {
  final FavoriteListRemoteDataSources favoriteListRemoteDataSources;

  FavoriteListRepositoryImpl({required this.favoriteListRemoteDataSources});

  @override
  Future<List<Movies>> getFavoriteList(int id) async {
    try {
      final getFavoriteList =
          await favoriteListRemoteDataSources.getFavoriteList(id);
      return getFavoriteList;
    } catch (e) {
      throw Exception('Unexpected error');
    }
  }
}
