import 'package:json_annotation/json_annotation.dart';

part 'sign_up_param.g.dart';

@JsonSerializable()
class SignUpParam {
  @JsonKey()
  final String? email;
  @JsonKey()
  final String? name;
  @JsonKey()
  final String? password;
  @JsonKey()
  final String? phone;

  SignUpParam({
    this.email,
    this.name,
    this.password,
    this.phone,
  });

  factory SignUpParam.fromJson(Map<String, dynamic> json) => _$SignUpParamFromJson(json);

  Map<String, dynamic> toJson() => _$SignUpParamToJson(this);
}
