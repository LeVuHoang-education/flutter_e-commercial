import 'dart:convert';

import 'package:e_commercial_app/domain/entities/user.dart';

class UserModel {
  final int? id;
  final String email;
  final String username;
  final String phone;
  final String roleName;

  UserModel(
      {required this.email,
      required this.username,
        this.id,
      required this.phone,
      required this.roleName});

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'] as int,
      email: map['email'] as String,
      username: map['username'] as String,
      phone: map['phone'] as String,
      roleName: map['roleName'] as String,
    );
  }
}

extension UserXModel on UserModel {
  UserEntity toEntity() {
    return UserEntity(email: email, username: username, id: id, phone: phone, roleName: roleName);
  }
}
