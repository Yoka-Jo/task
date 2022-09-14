import 'package:equatable/equatable.dart';

import 'user_data_model.dart';

class LoginDataModel extends Equatable {
  final UserDataModel? userData;
  final String token;
  const LoginDataModel({
    required this.userData,
    required this.token,
  });

  @override
  List<Object?> get props => [userData, token];
}

class LoginModel extends Equatable {
  final LoginDataModel? data;
  final String message;
  final bool status;
  const LoginModel({
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
