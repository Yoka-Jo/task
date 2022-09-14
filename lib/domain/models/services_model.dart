import 'package:equatable/equatable.dart';

class ServicesItemModel extends Equatable {
  final int id;
  final String title;
  final String description;
  final String image;
  final String category;
  final double price;
  const ServicesItemModel({
    required this.id,
    required this.title,
    required this.description,
    required this.image,
    required this.category,
    required this.price,
  });

  @override
  List<Object?> get props => [
        id,
        title,
        description,
        image,
        category,
        price,
      ];
}

class ServicesModel extends Equatable {
  final List<ServicesItemModel> servicesList;
  final bool status;
  final String message;
  const ServicesModel({
    required this.servicesList,
    required this.status,
    required this.message,
  });

  @override
  List<Object?> get props => [
        servicesList,
        status,
        message,
      ];
}
