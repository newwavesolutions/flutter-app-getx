import 'package:json_annotation/json_annotation.dart';

part 'object_response.g.dart';

@JsonSerializable(genericArgumentFactories: true)
class ObjectResponse<T> {
  @JsonKey(defaultValue: "")
  final String message;
  @JsonKey()
  final T? data;

  ObjectResponse({
    this.message = "",
    this.data,
  });

  factory ObjectResponse.fromJson(Map<String, dynamic> json, T Function(Object? json) fromJsonT) => _$ObjectResponseFromJson(json, fromJsonT);

  Map<String, dynamic> toJson(Object? Function(T value) toJsonT) => _$ObjectResponseToJson(this, toJsonT);
}
