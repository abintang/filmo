import 'dart:convert';
import 'dart:developer';
import 'package:filmo/core/constants/api.dart';
import 'package:filmo/features/home/data/models/movies_model.dart';
import 'package:http/http.dart' as http;

abstract class NowPlayingRemoteDataSources {
  Future<List<MoviesModel>> getNowPlayingMovies();
}

class NowPlayingRemoteDataSourcesImpl implements NowPlayingRemoteDataSources {
  @override
  Future<List<MoviesModel>> getNowPlayingMovies() async {
    String endpoint = "movie/now_playing";
    final response =
        await http.get(Uri.parse(Api.baseUrl + endpoint), headers: {
      "Authorization": "Bearer ${Api.accessToken}",
    });

    log("Get Now Playing:${response.statusCode}");
    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body)["results"];
      final List<MoviesModel> nowPlayingMovies =
          data.map((json) => MoviesModel.fromJson(json)).toList();

      return nowPlayingMovies;
    } else {
      throw Exception("Failed to get Now Playing Movies");
    }
  }
}
