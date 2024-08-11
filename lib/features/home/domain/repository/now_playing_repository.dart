import 'package:filmo/features/home/domain/entities/movies.dart';

abstract class NowPlayingRepository {
  Future<List<Movies>> getNowPlayinng();
}
