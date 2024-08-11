import 'package:filmo/features/user/data/data_sources/detail_user_remote_datasource.dart';
import 'package:filmo/features/user/domain/entities/user.dart';
import 'package:filmo/features/user/domain/repository/detail_user_repository.dart';

class DetailUserRepositoryImpl implements DetailUserRepository {
  final DetailUserRemoteDataSource remoteDataSource;

  DetailUserRepositoryImpl({required this.remoteDataSource});

  @override
  Future<User> getDetailUser(int id) async {
    try {
      final responseDetailUser = await remoteDataSource.getDetailUser(id);
      return responseDetailUser;
    } catch (e) {
      throw Exception('Unexpected error');
    }
  }
}
