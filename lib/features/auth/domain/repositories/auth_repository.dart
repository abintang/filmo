import 'package:filmo/features/auth/domain/entities/user.dart';

abstract class AuthRepository {
  Future<User> authenticateUser(String username, String password);
  Future<bool> isLoggedIn();
}
