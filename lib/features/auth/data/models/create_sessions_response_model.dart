import 'package:json_annotation/json_annotation.dart';
part 'create_sessions_response_model.g.dart';

@JsonSerializable()
class CreateSessionsResponseModel {
  @JsonKey(name: "session_id")
  final String sessionId;

  CreateSessionsResponseModel({required this.sessionId});

  factory CreateSessionsResponseModel.fromJson(Map<String, dynamic> json) =>
      _$CreateSessionsResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$CreateSessionsResponseModelToJson(this);
}
