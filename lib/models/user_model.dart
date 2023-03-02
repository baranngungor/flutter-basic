class UserModel {
  String? username, name, surname;
  UserModel({required this.username});

  UserModel.fromJson(Map<dynamic, dynamic> json) {
    username = json['username'];
    name = json['name'];
    surname = json['surname'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['username'] = username;
    data['name'] = name;
    data['surname'] = surname;
    return data;
  }
}

class LoginModel {
  String? username, password;
  LoginModel({required this.username, required this.password});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['username'] = username;
    data['password'] = password;
    return data;
  }
}
