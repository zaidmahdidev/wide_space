import 'package:equatable/equatable.dart';

class LoginModel extends Equatable{

  LoginModel({this.message, this.accessToken, this.tokenType, this.name , this.status , this.userStatus});
  String? message;
  String? accessToken;
  bool? status;
  String? tokenType;
  String? name;
  int? userStatus;

/////////////////
  bool get exist => status != 0 && status != null;


  bool get notExist => !exist;




  ////////////////
  LoginModel fromJson(dynamic json) {
    return LoginModel.fromJson(json);
  }

  LoginModel.fromJson(Map<String, dynamic> json) {
    message = json['Message'];
    status = json["Status"];
    accessToken = json['access_token'];
    tokenType = json['token_type'];
    name = json['name'];
    userStatus = json['user status'];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Message'] = message;
    data["Status"] =status;
    data["token_type"] = tokenType;
    data['access_token'] = accessToken;
    data['name'] = name;
    data['user status'] = userStatus;
    return data;
  }


  @override
  // TODO: implement props
  List<Object?> get props => [accessToken,name,status,message,userStatus];


  factory LoginModel.init() {
    return LoginModel(
      tokenType: '',
      status: false,
      name: '',
      message: '',
      accessToken: '',
      userStatus: 0,
    );
  }
}