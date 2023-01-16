import 'package:digi_store/models/categories.dart';
import 'package:digi_store/models/shop.dart';

class Product {
  Product({
    this.id,
    this.name,
    this.description,
    this.price,
    this.quantity,
    this.images,
    this.category,
    this.shop,
    this.isDeleted,
  });

  String? id;
  String? name;
  String? description;
  int? price;
  int? quantity;
  List<String>? images;
  Categories? category;
  Shop? shop;
  bool? isDeleted;

  factory Product.fromJson(Map<String, dynamic> json) => Product(
      id: json["id"],
      name: json["name"],
      description: json["description"],
      price: json["price"],
      quantity: json["quantity"],
      images: json["images"] == null ? [] : List<String>.from(json["images"]!.map((x) => x)),
  category: Categories.fromJson(json["category"]),
  shop: Shop.fromJson(json["shop"]),
  isDeleted: json["isDeleted"],
  );

  Map<String, dynamic> toJson() => {
  "id": id,
  "name": name,
  "description": description,
  "price": price,
  "quantity": quantity,
  "images": images == null ? [] : List<String>.from(images!.map((x) => x)),
  "category": category!.toJson(),
  "shop": shop!.toJson(),
  "isDeleted": isDeleted,
};
}


