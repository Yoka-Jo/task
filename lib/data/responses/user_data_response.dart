class UserDataResponse {
  final int? id;
  final String? name;
  final String? phone;
  final String? email;
  final String? image;
  final bool? isNotifiy;

  UserDataResponse({
    required this.id,
    required this.name,
    required this.phone,
    required this.email,
    required this.image,
    required this.isNotifiy,
  });

  factory UserDataResponse.fromJson(Map<String, dynamic> json) {
    return UserDataResponse(
      id: json['id'],
      name: json['name'],
      phone: json['phone'],
      email: json['email'],
      image: json['image'],
      isNotifiy: json['is_notifiy'],
    );
  }
}
