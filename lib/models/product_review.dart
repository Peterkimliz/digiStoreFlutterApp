import 'package:digi_store/models/user.dart';

class ProductReview {
  String? id;
  String? review;
  int? rating;
  User? user;
  String? productId;
  String? createdAt;
  String? updatedAt;

  ProductReview(
      {this.id,
      this.rating,
      this.review,
      this.user,
      this.updatedAt,
      this.createdAt,
      this.productId});

  factory ProductReview.fromJson(Map<String, dynamic> json) => ProductReview(
      user: User.fromJson(json["userId"]),
      id: json["id"],
      rating: json["rating"],
      review: json["review"],
      productId: json["productId"],
      createdAt: json["createdAt"],
      updatedAt: json["updatedAt"]);
}
