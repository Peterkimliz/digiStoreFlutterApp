class User {
  String? id;
  String? email;
  String? username;
  String? phone;
  String? userType;
  String? profileImage;
  List<String>?wishlist;

  User(
      {this.id,
      this.email,
      this.phone,
      this.username,
        this.wishlist,
      this.userType,
      this.profileImage});

  factory User.fromJson(Map<String, dynamic> json) => User(
      id: json["id"],
      email: json["email"],
      username: json["username"],
      wishlist: List<String>.from(json["wishlist"].map((e)=>e)),
      phone: json["phone"],
      userType: json["userType"],
      profileImage: json["profileImage"]);

  Map<String, dynamic> toJson() => {
        "id": id,
        "email": email,
        "username": username,
        "phone": phone,
        "userType": userType,
        "profileImage": profileImage
      };
}
