import 'package:filmo/features/user/domain/entities/movies.dart';

abstract class WatchlistRepository {
  Future<List<Movies>> getWatchlist(int id);
}
