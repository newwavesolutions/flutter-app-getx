import 'package:flutter_app/model/entities/index.dart';
import 'package:flutter_app/model/enums/load_status.dart';
import 'package:get/get.dart';

class ProfileTabState {
  Rxn<UserEntity> user = Rxn<UserEntity>();

  final signOutStatus = LoadStatus.initial.obs;

  ProfileTabState() {}
}
