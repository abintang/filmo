import 'dart:convert';

import 'package:filmo/core/constants/api.dart';
import 'package:filmo/core/di/dependency_injections.dart';
import 'package:filmo/features/auth/data/data_sources/auth_local_datasources.dart';
import 'package:filmo/features/user/data/model/movies_model.dart';
import 'package:http/http.dart' as http;

abstract class WatchlistRemoteDataSource {
  Future<List<MoviesModel>> getWatchlistUser(int id);
}

class WatchlistRemoteDataSourceImpl implements WatchlistRemoteDataSource {
  @override
  Future<List<MoviesModel>> getWatchlistUser(int id) async {
    String endpoint = "account/{$id}/watchlist/movies";
    final String? sessionId = await getIt<AuthLocalDataSource>().getSessionId();
    final responseWatchlist = await http.get(
      Uri.parse("${Api.baseUrl}$endpoint").replace(
        queryParameters: {
          'session_id': sessionId,
        },
      ),
      headers: {
        "Authorization": "Bearer ${Api.accessToken}",
      },
    );

    if (responseWatchlist.statusCode != 200) {
      throw Exception("Failed to get Watchlist");
    }

    final List<dynamic> data = json.decode(responseWatchlist.body)["results"];
    final List<MoviesModel> watchlistMovies =
        data.map((json) => MoviesModel.fromJson(json)).toList();
    return watchlistMovies;
  }
}
