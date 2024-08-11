import 'dart:developer';

import 'package:filmo/features/home/data/data_sources/now_playing_remote_datasources.dart';
import 'package:filmo/features/home/domain/entities/movies.dart';
import 'package:filmo/features/home/domain/repository/now_playing_repository.dart';

class NowPlayingRepositoryImpl implements NowPlayingRepository {
  final NowPlayingRemoteDataSources nowPlayingRemoteDataSources;

  NowPlayingRepositoryImpl({required this.nowPlayingRemoteDataSources});

  @override
  Future<List<Movies>> getNowPlayinng() async {
    final getRemoteNowPlaying =
        await nowPlayingRemoteDataSources.getNowPlayingMovies();
    log(getRemoteNowPlaying.length.toString());
    return getRemoteNowPlaying;
  }
}
