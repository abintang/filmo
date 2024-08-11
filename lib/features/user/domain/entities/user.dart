import 'package:json_annotation/json_annotation.dart';

class User {
  final int id;
  final String username;
  final String name;
  @JsonKey(includeFromJson: false)
  final String nameShown;

  User({required this.id, required this.username, required this.name})
      : nameShown = (name == "") ? "Mysterious Cat" : name;
}
