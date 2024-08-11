import 'package:filmo/features/auth/domain/entities/user.dart';
import 'package:filmo/features/auth/domain/repositories/auth_repository.dart';

class AuthUser {
  final AuthRepository authRepository;
  AuthUser({required this.authRepository});
  Future<User> call(String username, String password) async {
    final user = await authRepository.authenticateUser(username, password);
    return user;
  }
}
