import 'package:filmo/features/user/domain/entities/user.dart';
import 'package:filmo/features/user/domain/repository/detail_user_repository.dart';

class GetDetailUser {
  final DetailUserRepository detailUserRepository;

  GetDetailUser({required this.detailUserRepository});
  Future<User> call(int id) async {
    final user = await detailUserRepository.getDetailUser(id);
    return user;
  }
}
