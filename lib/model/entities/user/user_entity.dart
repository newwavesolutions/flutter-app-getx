import 'package:json_annotation/json_annotation.dart';

part 'user_entity.g.dart';

@JsonSerializable()
class UserEntity {
  @JsonKey()
  int? id;
  @JsonKey()
  String? username;
  @JsonKey()
  DateTime? birthday;
  @JsonKey()
  String? avatarUrl;

  UserEntity({
    this.id,
    this.username,
    this.birthday,
    this.avatarUrl,
  });

  factory UserEntity.mockData() {
    return UserEntity(
      id: 12345678,
      username: "Newwave",
      birthday: DateTime.now(),
      avatarUrl: "https://i.imgur.com/geqAiJG.jpg",
    );
  }
}
