import 'package:filmo/features/user/domain/entities/movies.dart';
import 'package:filmo/features/user/domain/repository/watchlist_repository.dart';

class GetWatchlist {
  final WatchlistRepository watchlistRepository;

  GetWatchlist({required this.watchlistRepository});
  Future<List<Movies>> call(int id) async {
    final movies = await watchlistRepository.getWatchlist(id);
    return movies;
  }
}
