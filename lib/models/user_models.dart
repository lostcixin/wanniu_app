class UserRegisterModel {
  String username;
  String mobile;
  String token;

  UserRegisterModel({this.username, this.mobile, this.token});

  UserRegisterModel.fromJson(Map<String, dynamic> json) {
    username = json['username'];
    mobile = json['mobile'];
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['username'] = this.username;
    data['mobile'] = this.mobile;
    data['token'] = this.token;
    return data;
  }
}
