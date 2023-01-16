class Categories {
  String? name;
  String? id;
  String? image;

  Categories({this.id, this.name, this.image});

  factory Categories.fromJson(Map<String, dynamic> json) => Categories(
        name: json["name"],
        id: json["id"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {"id": id, "name": name, "image": image};
}
