class LoginRequestModel {
  String? userName;
  String? password;

  LoginRequestModel({this.userName, this.password});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userName'] = this.userName;
    data['password'] = this.password;
    return data;
  }
}
