import 'package:json_annotation/json_annotation.dart';
part 'request_token_response_model.g.dart';

@JsonSerializable()
class RequestTokenResponseModel {
  @JsonKey(name: "request_token")
  final String requestToken;

  RequestTokenResponseModel({required this.requestToken});

  factory RequestTokenResponseModel.fromJson(Map<String, dynamic> json) =>
      _$RequestTokenResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$RequestTokenResponseModelToJson(this);
}
