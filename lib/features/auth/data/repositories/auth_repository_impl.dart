import 'package:filmo/features/auth/data/data_sources/auth_remote_datasources.dart';
import 'package:filmo/features/auth/domain/entities/user.dart';
import 'package:filmo/features/auth/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSources remoteDataSource;

  AuthRepositoryImpl({
    required this.remoteDataSource,
  });

  @override
  Future<User> authenticateUser(String username, String password) async {
    try {
      final responseModel =
          await remoteDataSource.authenticateUser(username, password);

      return responseModel;
    } catch (e) {
      throw Exception('Unexpected error');
    }
  }

  @override
  Future<bool> isLoggedIn() {
    // TODO: implement isLoggedIn
    throw UnimplementedError();
  }
}
