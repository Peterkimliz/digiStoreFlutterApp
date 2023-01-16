class User {
  String? id;
  String? email;
  String? username;
  String? phone;
  String? userType;
  String? profileImage;

  User(
      {this.id,
      this.email,
      this.phone,
      this.username,
      this.userType,
      this.profileImage});

  factory User.fromJson(Map<String, dynamic> json) => User(
      id: json["id"],
      email: json["email"],
      username: json["username"],
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
