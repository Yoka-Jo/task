import 'package:equatable/equatable.dart';

class UserDataModel extends Equatable {
  final int id;
  final String name;
  final String phone;
  final String email;
  final String image;
  final bool isNotifiy;

  const UserDataModel({
    required this.id,
    required this.name,
    required this.phone,
    required this.email,
    required this.image,
    required this.isNotifiy,
  });

  @override
  List<Object?> get props => [
        id,
        name,
        phone,
        email,
        image,
        isNotifiy,
      ];
}
