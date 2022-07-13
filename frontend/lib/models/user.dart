class UserRegisterModel {
  final String name;
  final String email;
  final String password;

  UserRegisterModel({
    required this.name,
    required this.email,
    required this.password,
  });
}

class UserLoginModel {
  final String email;
  final String password;

  UserLoginModel({
    required this.email,
    required this.password,
  });
}

class UserResponseModel {
  final String userId;
  final String userName;
  final String email;
  final String password;
  final String firstname;
  final String lastname;
  final String address;
  String accessToken;
  String refreshToken;

  UserResponseModel({
    required this.userId,
    required this.userName,
    required this.email,
    required this.password,
    required this.firstname,
    required this.lastname,
    required this.address,
    required this.accessToken,
    required this.refreshToken,
  });

  factory UserResponseModel.toJson(Map<String, dynamic> json) {
    return UserResponseModel(
        userId: json["userId"],
        userName: json["userName"],
        email: json["email"],
        password: json["password"],
        firstname: json["firstname"],
        lastname: json["lastname"],
        address: json["address"],
        accessToken: json["accessToken"],
        refreshToken: json["refreshToken"]);
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data["userId"] = userId;
    data["userName"] = userName;
    data["email"] = email;
    data["password"] = password;
    data["firstname"] = firstname;
    data["lastname"] = lastname;
    data["address"] = address;
    data["accessToken"] = accessToken;
    data["refreshToken"] = refreshToken;

    return data;
  }
}
