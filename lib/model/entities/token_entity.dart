import 'package:json_annotation/json_annotation.dart';

part 'token_entity.g.dart';

@JsonSerializable()
class TokenEntity {
  @JsonKey()
  String accessToken;
  @JsonKey()
  String refreshToken;

  TokenEntity({
    this.accessToken = "",
    this.refreshToken = "",
  });

  factory TokenEntity.fromJson(Map<String, dynamic> json) => _$TokenEntityFromJson(json);

  Map<String, dynamic> toJson() => _$TokenEntityToJson(this);
}
