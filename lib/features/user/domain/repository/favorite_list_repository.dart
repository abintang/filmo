import 'package:filmo/features/user/domain/entities/movies.dart';

abstract class FavoriteListRepository {
  Future<List<Movies>> getFavoriteList(int id);
}
