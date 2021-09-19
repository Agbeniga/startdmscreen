//User model
class UserModel {
  //  String? fullName;
  //  String? imageUrl;
  // bool? isOnline;
  // bool? isChecked;

  // UserModel({
  //   this.fullName,
  //   this.displayName,
  //   this.imageUrl,
  //   this.isOnline,
  //   this.isChecked= false,
  // });

  String? id;
  String? orgId;
  String? files;
  String? imageUrl;
  String? fullName;
  String? status;
  String? email;
  String? displayName;
  String? bio;
  String? pronouns;
  String? phone;
  String? timeZone;
  String? joinedAt;
  bool? isChecked;
  UserModel({
    this.id,
    this.orgId,
    this.files,
    this.imageUrl,
    this.fullName,
    this.status,
    this.email,
    this.displayName,
    this.bio,
    this.pronouns,
    this.phone,
    this.timeZone,
    this.joinedAt,
    this.isChecked= false,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserModel &&
          runtimeType == other.runtimeType &&
          fullName == other.fullName;

  @override
  int get hashCode => fullName.hashCode;

  @override
  String toString() {
    return fullName!;
  }

  Map<String, dynamic> toMap() {
    return {
      "_id": id,
      "orgId": orgId,
      // "files": files.toJson(),
      "image_url": imageUrl,
      "name": fullName,
      "status": status,
      "email": email,
      "display_name": displayName,
      "bio": bio,
      "pronouns": pronouns,
      "phone": phone,
      "time_zone": timeZone,
      "joined_at": joinedAt,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> json) {
    return UserModel(
      id: json["_id"],
      orgId: json["orgId"],
      // files: Files.fromJson(json["files"]),
      imageUrl: json["image_url"],
      fullName: json["name"],
      status: json["status"],
      email: json["email"],
      displayName: json["display_name"],
      bio: json["bio"],
      pronouns: json["pronouns"],
      phone: json["phone"],
      timeZone: json["time_zone"],
      joinedAt: json["joined_at"],
    );
  }

  Map<String, dynamic> toJson() => toMap();

  factory UserModel.fromJson(Map<String, dynamic> source) =>
      UserModel.fromMap(source);
}

//Channel model
class ChannelModel {}
