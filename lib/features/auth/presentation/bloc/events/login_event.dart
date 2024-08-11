abstract class LoginEvent {}

class OnLoginApp extends LoginEvent {
  final String username;
  final String password;

  OnLoginApp({required this.username, required this.password});
}
