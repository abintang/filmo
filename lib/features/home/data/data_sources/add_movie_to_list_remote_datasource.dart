import 'dart:convert';
import 'dart:developer';

import 'package:filmo/core/di/dependency_injections.dart';
import 'package:filmo/features/auth/data/data_sources/auth_local_datasources.dart';
import 'package:http/http.dart' as http;
import 'package:filmo/core/constants/api.dart';

abstract class AddMovieToListRemoteDataSource {
  Future<void> addMovieToList(int accountId, int movieId, String saveType);
}

class AddMovieToListRemoteDataSourceImpl
    implements AddMovieToListRemoteDataSource {
  @override
  Future<void> addMovieToList(
      int accountId, int movieId, String saveType) async {
    final http.Response responseAddMovieToList;
    final String? sessionId = await getIt<AuthLocalDataSource>().getSessionId();

    String endpoint = "account/$accountId/$saveType";

    if (saveType == "watchlist") {
      responseAddMovieToList = await http.post(
          Uri.parse(Api.baseUrl + endpoint).replace(queryParameters: {
            'session_id': sessionId,
          }),
          headers: {
            "Authorization": "Bearer ${Api.accessToken}",
          },
          body: jsonEncode(
              {"media_type": "movie", "media_id": movieId, "watchlist": true}));
    } else {
      responseAddMovieToList = await http.post(
          Uri.parse(Api.baseUrl + endpoint).replace(queryParameters: {
            'session_id': sessionId,
          }),
          headers: {
            "Authorization": "Bearer ${Api.accessToken}",
            "Content-Type": "application/json",
          },
          body: jsonEncode(
              {"media_type": "movie", "media_id": movieId, "favorite": true}));
    }

    log("$saveType: ${responseAddMovieToList.statusCode}");
    if (responseAddMovieToList.statusCode != 200) {
      log(responseAddMovieToList.body);
      throw Exception("Failed to Add Watchlist");
    }
  }
}
