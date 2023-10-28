import 'package:ecommerce_c9_str/features/signup/domain/entities/UserEntity.dart';

class UserModel extends UserEntity {
  UserModel({
    this.message,
    super.user,
    super.token,
  });

  UserModel.fromJson(dynamic json) {
    message = json['message'];
    user = json['user'] != null ? UserData.fromJson(json['user']) : null;
    token = json['token'];
  }

  String? message;
}

class UserData extends UserDataEntity {
  UserData({
    super.name,
    super.email,
    this.role,
  });

  UserData.fromJson(dynamic json) {
    name = json['name'];
    email = json['email'];
    role = json['role'];
  }

  String? role;
}
