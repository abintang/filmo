import 'package:filmo/features/auth/domain/entities/user.dart';

abstract class LoginState {}

class InitialState extends LoginState {}

class LoginSuccess extends LoginState {
  User user;
  LoginSuccess({required this.user});
}

class LoginFailed extends LoginState {}
