import 'package:filmo/features/user/domain/entities/user.dart';

abstract class DetailUserState {}

class InitialState extends DetailUserState {}

class GetDetailUserSuccess extends DetailUserState {
  User user;
  GetDetailUserSuccess({required this.user});
}

class GetDetailUserFailed extends DetailUserState {}
