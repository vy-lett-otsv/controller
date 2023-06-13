class UserEntity {
  String? fullName;
  String id;
  String email;
  String role;
  String gender;
  String verify;
  String phone;
  String? avatar;
  String targetStatus;
  String? zalo;
  String? message;
  String? birthday;

  String get name {
    return fullName!;
  }
  UserEntity({
    required this.id,
    required this.email,
    required this.role,
    required this.gender,
    required this.verify,
    required this.phone,
    required this.targetStatus,
    this.birthday,
    this.fullName,
    this.avatar,
    this.zalo,
    this.message,
  });

  factory UserEntity.fromJson(Map<String, dynamic> json) {
    return UserEntity(
      id: json['_id'] as String,
      email: json['email'] as String,
      birthday: json['birth'] as String?, // [TODO] API
      role: json['role'] as String,
      gender: json['gender'] as String,
      verify: json['verify'] as String,
      fullName: json['fullName'] as String,
      phone: json['phone'],
      targetStatus: "Đạt chỉ tiêu", // [TODO] API
      zalo: json['zaloUrl'],    // [TODO] API
      message: json['facebookUrl'], // [TODO] API
    );
  }

  Map<String, dynamic> toJson() => {
    "fullName": name,
    "phone": phone,
    "zaloUrl": zalo,
    "facebookUrl": message,
    "birth": birthday,
  };

}
