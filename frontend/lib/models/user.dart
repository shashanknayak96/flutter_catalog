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
  final String accesstoken;
  final String refreshtoken;

  UserResponseModel({
    required this.userId,
    required this.userName,
    required this.email,
    required this.password,
    required this.firstname,
    required this.lastname,
    required this.address,
    required this.accesstoken,
    required this.refreshtoken,
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
        accesstoken: json["accesstoken"],
        refreshtoken: json["refreshtoken"]);
  }
}
