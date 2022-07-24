class RegisterRequestModel {
  String? email;
  String? password;
  String? imageUrl;

  RegisterRequestModel({this.email, this.password,this.imageUrl});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['email'] = this.email;
    data['password'] = this.password;
    data['imageUrl'] = this.imageUrl;
    return data;
  }
}
