import 'package:gsy_github_app_flutter/model/User.dart';


/**
 * 网络结果数据
 * Created by guoshuyu
 * Date: 2018-07-16
 */
class SignUpResponse {
  var data;
  String message;
  int code;
  Data data1;

  SignUpResponse({this.data, this.message, this.code});

  SignUpResponse.fromJson(Map<String, dynamic> json) {
    data = json['data'];
    message = json['message'];
    code = json['code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
    //  data['data1'] = User.toJson();
    }
    data['message'] = this.message;
    data['code'] = this.code;
    return data;
  }
}

class Data {
  int ID;
  String CreatedAt;
  String UpdatedAt;
  String DeletedAt;
  int gender;
  String telephone;
  String avatar;
  int role;//用户角色
  String password;
  bool active;
  int come_from;
  String token;
  String name;
  String email;

  Data(
      {this.ID,
        this.CreatedAt,
        this.UpdatedAt,
        this.DeletedAt,
        this.gender,
        this.telephone,
        this.avatar,
        this.role,
        this.password,
        this.active,
        this.come_from,
        this.token,
        this.name,
        this.email});

  Data.fromJson(Map<String, dynamic> json) {
    ID = json['ID'];
    email = json['email'];
    CreatedAt = json['CreatedAt'];
    UpdatedAt = json['UpdatedAt'];
    DeletedAt = json['DeletedAt'];
    gender = json['gender'];
    telephone = json['telephone'];
    avatar = json['avatar'];
    role = json['role'];
    password = json['password'];
    active = json['active'];
    come_from = json['come_from'];
    token = json['token'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ID'] = this.ID;
    data['email'] = this.email;
    data['CreatedAt'] = this.CreatedAt;
    data['UpdatedAt'] = this.UpdatedAt;
    data['DeletedAt'] = this.DeletedAt;
    data['gender'] = this.gender;
    data['telephone'] = this.telephone;
    data['avatar'] = this.avatar;
    data['role'] = this.role;
    data['password'] = this.password;
    data['active'] = this.active;
    data['token'] = this.token;
    data['name'] = this.name;
    return data;
  }
}