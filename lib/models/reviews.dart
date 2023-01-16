class Review {
  String? id;
  String? review;
  int? rating;
  String? userId;
  String? shopId;
  DateTime? createdAt;
  DateTime? updatedAt;

  Review({this.id,this.shopId,this.review,this.rating,this.userId,this.createdAt,this.updatedAt});

  factory Review.fromJson(Map<String,dynamic>json)=>Review(
    id: json["id"],
    review: json["review"],
    rating: json["rating"],
    userId: json["userId"],
    shopId: json["shopId"],
    createdAt: json["createdAt"],
    updatedAt: json["updatedAt"],
  );

  Map<String,dynamic>toJson()=>{
    "id":id,
    "review":review,
    "rating":rating,
    "userId":userId,
    "shopId":shopId,
    "createdAt":createdAt,
    "updatedAt":updatedAt,

  };
}
