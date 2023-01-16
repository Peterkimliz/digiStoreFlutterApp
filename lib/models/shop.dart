import 'package:digi_store/models/reviews.dart';
import 'package:digi_store/models/rider.dart';

class Shop {
  Shop({
    this.id,
    this.name,
    this.userId,
    this.description,
    this.phone,
    this.upgraded,
    this.disabled,
    this.riders,
    this.reviews,
    this.subscriptionStartDate,
    this.subscriptionEndDate,
    this.longitude,
    this.latitude,

  });

  String? id;
  String? name;
  String? userId;
  String? description;
  String? phone;
  bool? upgraded;
  bool? disabled;
  List<Rider>? riders;
  List<Review>? reviews;
  dynamic subscriptionStartDate;
  dynamic subscriptionEndDate;
  double? longitude;
  double ? latitude;


  factory Shop.fromJson(Map<String, dynamic> json) => Shop(
      id: json["id"],
      name: json["name"],
      userId: json["userId"],
      description: json["description"],
      phone: json["phone"],
      upgraded: json["upgraded"],
      disabled: json["disabled"],
      riders: json["riders"] == null ? [] : List<Rider>.from(json["riders"]!.map((x) => Rider.fromJson(x))),
  reviews: json["reviews"] == null ? [] : List<Review>.from(json["reviews"]!.map((x) =>Review.fromJson(x))),
  subscriptionStartDate: json["subscriptionStartDate"],
  subscriptionEndDate: json["subscriptionEndDate"],
  longitude: json["longitude"],
  latitude: json["latitude"],

  );

  Map<String, dynamic> toJson() => {
  "id": id,
  "name": name,
  "userId": userId,
  "description": description,
  "phone": phone,
  "upgraded": upgraded,
  "disabled": disabled,
  "subscriptionStartDate": subscriptionStartDate,
  "subscriptionEndDate": subscriptionEndDate,
  "longitude": longitude,
  "latitude": latitude,
};
}