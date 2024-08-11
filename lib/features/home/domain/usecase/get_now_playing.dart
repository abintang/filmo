import 'dart:developer';

import 'package:filmo/features/home/domain/entities/movies.dart';
import 'package:filmo/features/home/domain/repository/now_playing_repository.dart';

class GetNowPlaying {
  NowPlayingRepository nowPlayingRepository;
  GetNowPlaying({required this.nowPlayingRepository});

  Future<List<Movies>> call() async {
    final movies = await nowPlayingRepository.getNowPlayinng();
    log(movies.length.toString());
    return movies.take(6).toList();
  }
}
