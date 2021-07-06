import 'package:json_annotation/json_annotation.dart';

part 'notification_entity.g.dart';

@JsonSerializable()
class NotificationEntity {
  @JsonKey()
  bool isRead;
  @JsonKey()
  String id;
  @JsonKey()
  String title;
  @JsonKey()
  String message;
  @JsonKey()
  String type;

  NotificationEntity({
    this.isRead = false,
    this.id = "",
    this.title = "",
    this.message = "",
    this.type = "",
  });

  factory NotificationEntity.fromJson(Map<String, dynamic> json) => _$NotificationEntityFromJson(json);

  Map<String, dynamic> toJson() => _$NotificationEntityToJson(this);
}