import 'dart:convert';

import 'package:filmo/core/constants/api.dart';
import 'package:filmo/core/di/dependency_injections.dart';
import 'package:filmo/features/auth/data/data_sources/auth_local_datasources.dart';
import 'package:filmo/features/user/data/model/movies_model.dart';
import 'package:http/http.dart' as http;

abstract class FavoriteListRemoteDataSources {
  Future<List<MoviesModel>> getFavoriteList(int id);
}

class FavoriteListRemoteDataSourcesImpl
    implements FavoriteListRemoteDataSources {
  @override
  Future<List<MoviesModel>> getFavoriteList(int id) async {
    String endpoint = "account/{$id}/favorite/movies";
    final String? sessionId = await getIt<AuthLocalDataSource>().getSessionId();
    final responseFavoriteList = await http.get(
      Uri.parse("${Api.baseUrl}$endpoint").replace(
        queryParameters: {
          'session_id': sessionId,
        },
      ),
      headers: {
        "Authorization": "Bearer ${Api.accessToken}",
      },
    );

    if (responseFavoriteList.statusCode != 200) {
      throw Exception("Failed to get Favorite List");
    }

    final List<dynamic> data =
        json.decode(responseFavoriteList.body)["results"];
    final List<MoviesModel> favoriteListMovies =
        data.map((json) => MoviesModel.fromJson(json)).toList();
    return favoriteListMovies;
  }
}
