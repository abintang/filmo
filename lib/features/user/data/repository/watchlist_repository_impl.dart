import 'package:filmo/features/user/data/data_sources/watchlist_remote_datasources.dart';
import 'package:filmo/features/user/domain/entities/movies.dart';
import 'package:filmo/features/user/domain/repository/watchlist_repository.dart';

class WatchlistRepositoryImpl implements WatchlistRepository {
  final WatchlistRemoteDataSource watchlistRemoteDataSource;

  WatchlistRepositoryImpl({required this.watchlistRemoteDataSource});

  @override
  Future<List<Movies>> getWatchlist(int id) async {
    try {
      final watchlistData =
          await watchlistRemoteDataSource.getWatchlistUser(id);
      return watchlistData;
    } catch (e) {
      throw Exception('Unexpected error');
    }
  }
}
