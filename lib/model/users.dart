import 'package:flutter/cupertino.dart';
import 'package:ios_chatapp/shared/style.dart';

class User {
  final String userId;
  final String name;
  final Color color;
  final String phoneNumber;

  User({
    required this.userId,
    required this.name,
    required this.color,
    required this.phoneNumber
  });

  factory User.from(User user) {
    return User(
      userId: user.userId,
      name: user.name,
      color: user.color,
      phoneNumber: user.phoneNumber
    );
  }

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      userId: json['userId'] as String,
      name: json['name'] as String,
      color: json['color'] as Color,
      phoneNumber: json['phoneNumber'] as String
    );
  }

  factory User.initialData() {
    return User(
      userId: '',
      name: '',
      color: const Color(defaultColor),
      phoneNumber: ''
    );
  }
}
