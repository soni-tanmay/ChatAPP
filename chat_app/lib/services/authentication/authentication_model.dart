part of 'authentication_repo.dart';



class AuthenticationModel {
  AuthenticationModel({
    required this.status,
    required this.msg,
    required this.user,
    required this.accessToken,
    required this.refreshToken,
  });

  String status;
  String msg;
  User user;
  String accessToken;
  String refreshToken;

  AuthenticationModel copyWith({
    String? status,
    String? msg,
    User? user,
    String? accessToken,
    String? refreshToken,
  }) =>
      AuthenticationModel(
        status: status ?? this.status,
        msg: msg ?? this.msg,
        user: user ?? this.user,
        accessToken: accessToken ?? this.accessToken,
        refreshToken: refreshToken ?? this.refreshToken,
      );

  factory AuthenticationModel.fromJson(Map<String, dynamic> json) =>
      AuthenticationModel(
        status: json["status"],
        msg: json["msg"],
        user: User.fromJson(json["user"]),
        accessToken: json["accessToken"],
        refreshToken: json["refreshToken"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "msg": msg,
        "user": user.toJson(),
        "accessToken": accessToken,
        "refreshToken": refreshToken,
      };
}

class User {
  User({
    required this.id,
    required this.userName,
    required this.name,
    required this.email,
    required this.profilePic,
    this.createdAt,
    this.updateAt,
  });

  String id;
  String userName;
  String name;
  String email;
  String profilePic;
  String? createdAt;
  String? updateAt;

  User copyWith({
    String? id,
    String? userName,
    String? name,
    String? email,
    String? profilePic,
    String? createdAt,
    String? updateAt,
  }) =>
      User(
        id: id ?? this.id,
        userName: userName ?? this.userName,
        name: name ?? this.name,
        email: email ?? this.email,
        profilePic: profilePic ?? this.profilePic,
        createdAt: createdAt ?? this.createdAt,
        updateAt: updateAt ?? this.updateAt,
      );

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        userName: json["userName"],
        name: json["name"],
        email: json["email"],
        profilePic: json["profilePic"],
        createdAt: json["createdAt"],
        updateAt: json["updateAt"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "userName": userName,
        "name": name,
        "email": email,
        "profilePic": profilePic,
        "createdAt": createdAt,
        "updateAt": updateAt,
      };
}
