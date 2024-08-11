import 'dart:convert';
import 'dart:developer';
import 'package:filmo/core/constants/api.dart';
import 'package:filmo/features/home/data/models/movies_model.dart';
import 'package:http/http.dart' as http;

abstract class PopularRemoteDataSources {
  Future<List<MoviesModel>> getPopularMovies();
}

class PopularRemoteDataSourcesImpl implements PopularRemoteDataSources {
  @override
  Future<List<MoviesModel>> getPopularMovies() async {
    String endpoint = "movie/popular";
    final response =
        await http.get(Uri.parse(Api.baseUrl + endpoint), headers: {
      "Authorization": "Bearer ${Api.accessToken}",
    });

    log("Get Now popular:${response.statusCode}");
    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body)["results"];
      final List<MoviesModel> popularMovies =
          data.map((json) => MoviesModel.fromJson(json)).toList();

      return popularMovies;
    } else {
      throw Exception("Failed to get Popular Movies");
    }
  }
}
