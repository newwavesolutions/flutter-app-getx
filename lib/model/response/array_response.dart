import 'package:json_annotation/json_annotation.dart';

part 'array_response.g.dart';

@JsonSerializable(genericArgumentFactories: true)
class ArrayResponse<T> {
  @JsonKey(defaultValue: 1)
  final int page;
  @JsonKey(name: "total_pages", defaultValue: 0)
  final int totalPages;
  @JsonKey(name: "total_results", defaultValue: 0)
  final int totalResults;
  @JsonKey(defaultValue: [])
  final List<T> results;

  ArrayResponse({
    this.page = 1,
    this.totalPages = 0,
    this.totalResults = 0,
    this.results = const [],
  });

  factory ArrayResponse.fromJson(Map<String, dynamic> json, T Function(Object? json) fromJsonT) => _$ArrayResponseFromJson(json, fromJsonT);

  Map<String, dynamic> toJson(Object? Function(T value) toJsonT) => _$ArrayResponseToJson(this, toJsonT);
}
