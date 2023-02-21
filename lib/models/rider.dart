class Rider {
  String? id;
  String ?shopId;
  String? name;
  String? phone;
  String? email;
  DateTime? createdAt;
  DateTime? updatedAt;

  Rider({this.id,this.name,this.phone, this.shopId,this.email,this.updatedAt,this.createdAt});

  factory Rider.fromJson(Map<String ,dynamic> json)=>Rider(
   name: json["name"],
   email: json["email"],
   id: json["id"],
   shopId: json["shopId"],
   phone: json["phone"],
   createdAt: json["createdAt"],
   updatedAt: json["updatedAt"]
  );
  Map<String,dynamic>toJson()=>{
   "name":name,
   "id":id,
   "shopId":shopId,
   "phone":phone,
   "email":email,
   "createdAt":createdAt,
   "updatedt":updatedAt
  };
}
