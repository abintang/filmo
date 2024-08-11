abstract class DetailUserEvent {}

class LoadDetailUser extends DetailUserEvent {
  int id;
  LoadDetailUser({required this.id});
}
