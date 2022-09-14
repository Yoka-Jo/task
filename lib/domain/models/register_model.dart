import 'package:equatable/equatable.dart';
import 'package:task/domain/models/user_data_model.dart';

class RegisterModel extends Equatable {
  final UserDataModel? data;
  final bool status;
  final String message;
  const RegisterModel({
    required this.data,
    required this.status,
    required this.message,
  });

  @override
  List<Object?> get props => [
        data,
        status,
        message,
      ];
}
