

class ErrorModel {
  bool status;
  String errorMessage;

  ErrorModel({
    required this.status,
    required this.errorMessage,
  });

  factory ErrorModel.fromJson(Map<String, dynamic> json) => ErrorModel(
    status: json["Status"],
    errorMessage: json["Message"],
  );

  Map<String, dynamic> toJson() => {
    "Status": status,
    "Message": errorMessage,
  };
}

