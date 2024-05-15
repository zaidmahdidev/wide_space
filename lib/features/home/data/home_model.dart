class HomeModel {
  int id;
  String name;
  String phoneNumber;
  dynamic totalQuantity;
  dynamic quiantitySpent;
  dynamic theRemainingQuiantity;
  int totalStations;

  HomeModel({
    required this.id,
    required this.name,
    required this.phoneNumber,
    required this.totalQuantity,
    required this.quiantitySpent,
    required this.theRemainingQuiantity,
    required this.totalStations,
  });

  factory HomeModel.fromJson(Map<String, dynamic> json) => HomeModel(
    id: json["id"],
    name: json["name"],
    phoneNumber: json["phone_number"],
    totalQuantity: json["total_quantity"],
    quiantitySpent: json["Quiantity spent"]?.toDouble(),
    theRemainingQuiantity: json["The remaining quiantity"]?.toDouble(),
    totalStations: json["total_stations"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "phone_number": phoneNumber,
    "total_quantity": totalQuantity,
    "Quiantity spent": quiantitySpent,
    "The remaining quiantity": theRemainingQuiantity,
    "total_stations": totalStations,
  };
}

