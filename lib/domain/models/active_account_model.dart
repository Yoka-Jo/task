import 'package:equatable/equatable.dart';
import 'package:task/domain/models/user_data_model.dart';

class ActiveAccountDataModel extends Equatable {
  final UserDataModel? userData;
  final String token;
  const ActiveAccountDataModel({
    required this.userData,
    required this.token,
  });

  @override
  List<Object?> get props => [userData, token];
}

class ActiveAccountModel extends Equatable {
  final ActiveAccountDataModel? data;
  final String message;
  final bool status;
  const ActiveAccountModel({
    required this.data,
    required this.message,
    required this.status,
  });

  @override
  List<Object?> get props => [
        data,
        message,
        status,
      ];
}
