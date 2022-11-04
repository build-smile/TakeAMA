// To parse this JSON data, do
//
//     final userLogin = userLoginFromJson(jsonString);

import 'dart:convert';

UserLogin userLoginFromJson(String str) => UserLogin.fromJson(json.decode(str));

String userLoginToJson(UserLogin data) => json.encode(data.toJson());

class UserLogin {
  UserLogin({
    this.message,
    this.data,
  });

  String? message;
  Profile? data;

  factory UserLogin.fromJson(Map<String, dynamic> json) => UserLogin(
        message: json["message"],
        data: Profile.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "data": data!.toJson(),
      };
}

class Profile {
  Profile({
    this.id,
    this.username,
    this.detail,
    this.email,
    this.userType,
    this.firstName,
    this.lastName,
    this.birthDay,
    this.isActive,
  });

  String? id;
  String? username;
  String? email;
  String? detail;
  String? userType;
  String? firstName;
  String? lastName;
  String? birthDay;
  String? isActive;

  factory Profile.fromJson(Map<String, dynamic> json) => Profile(
        id: json["id"],
        username: json["username"],
        detail: json["detail"],
        email: json["email"],
        userType: json["userType"],
        firstName: json["firstName"],
        lastName: json["lastName"],
        birthDay: json["birthDay"],
        isActive: json["isActive"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "username": username,
        "email": email,
        "userType": userType,
        "firstName": firstName,
        "lastName": lastName,
        "birthDay": birthDay,
        "isActive": isActive,
      };
}
