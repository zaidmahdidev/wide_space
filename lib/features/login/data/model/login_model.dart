import 'package:equatable/equatable.dart';
import 'dart:convert';

// class LoginModel extends Equatable{
//
//   LoginModel({this.message, this.accessToken, this.tokenType, this.name , this.status , this.userStatus});
//   String? message;
//   String? accessToken;
//   bool? status;
//   String? tokenType;
//   String? name;
//   int? userStatus;
//
// /////////////////
//   bool get exist => status != 0 && status != null;
//
//
//   bool get notExist => !exist;
//
//
//
//
//   ////////////////
//   LoginModel fromJson(dynamic json) {
//     return LoginModel.fromJson(json);
//   }
//
//   LoginModel.fromJson(Map<String, dynamic> json) {
//     message = json['Message'];
//     status = json["Status"];
//     accessToken = json['access_token'];
//     tokenType = json['token_type'];
//     name = json['name'];
//     userStatus = json['user status'];
//   }
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['Message'] = message;
//     data["Status"] =status;
//     data["token_type"] = tokenType;
//     data['access_token'] = accessToken;
//     data['name'] = name;
//     data['user status'] = userStatus;
//     return data;
//   }
//
//
//   @override
//   // TODO: implement props
//   List<Object?> get props => [accessToken,name,status,message,userStatus];
//
//
//   factory LoginModel.init() {
//     return LoginModel(
//       tokenType: '',
//       status: false,
//       name: '',
//       message: '',
//       accessToken: '',
//       userStatus: 0,
//     );
//   }
// }

class LoginModel extends Equatable {
  final bool status;
  final String message;
  final Data data;

  LoginModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory LoginModel.fromRawJson(String str) =>
      LoginModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
        status: json["status"],
        message: json["message"],
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data.toJson(),
      };

  @override
  List<Object?> get props => [message, status];
}

class Data {
  final int? id;
  final String? name;
  final String? email;
  final String? phone;
  final String? image;
  final int? points;
  final int? credit;
  final String? token;

  Data({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.image,
    required this.points,
    required this.credit,
    required this.token,
  });

  factory Data.fromRawJson(String str) => Data.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        phone: json["phone"],
        image: json["image"],
        points: json["points"],
        credit: json["credit"],
        token: json["token"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "phone": phone,
        "image": image,
        "points": points,
        "credit": credit,
        "token": token,
      };

  factory Data.init() {
    return Data(
        id: 0,
        name: '',
        email: '',
        phone: '',
        image: '',
        points: 0,
        credit: 0,
        token: '');
  }
}
