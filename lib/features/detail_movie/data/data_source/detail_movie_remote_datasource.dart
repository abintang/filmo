import 'package:filmo/features/detail_movie/data/models/detail_movies_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:filmo/core/constants/api.dart';

abstract class DetailMovieRemoteDataSources {
  Future<DetailMoviesModel> getDetailMovies(int idMovie);
}

class DetailMovieRemoteDataSourcesImpl implements DetailMovieRemoteDataSources {
  @override
  Future<DetailMoviesModel> getDetailMovies(int idMovie) async {
    final String endpoint = "movie/$idMovie";

    final responseDetailMovies = await http.get(
      Uri.parse("${Api.baseUrl}$endpoint"),
      headers: {
        "Authorization": "Bearer ${Api.accessToken}",
      },
    );

    if (responseDetailMovies.statusCode != 200) {
      throw Exception("Failed to get Detail Movies");
    }

    final responseDetailMoviesBody = json.decode(responseDetailMovies.body);
    final detailMoviesModel =
        DetailMoviesModel.fromJson(responseDetailMoviesBody);
    return detailMoviesModel;
  }
}
