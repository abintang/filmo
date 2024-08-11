import 'package:filmo/features/user/domain/entities/user.dart';

abstract class DetailUserRepository {
  Future<User> getDetailUser(int id);
}
