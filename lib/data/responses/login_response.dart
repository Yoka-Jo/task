import 'package:task/data/responses/user_data_response.dart';

class LoginDataResponse {
  final UserDataResponse? userData;
  final String? token;
  LoginDataResponse({
    required this.userData,
    required this.token,
  });

  factory LoginDataResponse.fromJson(Map<String, dynamic> json) {
    return LoginDataResponse(
      userData: UserDataResponse.fromJson(json["user"]),
      token: json["token"],
    );
  }
}

class LoginResponse {
  final LoginDataResponse? data;
  final String? message;
  final bool? status;
  LoginResponse({
    this.data,
    this.message,
    this.status,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    return LoginResponse(
      data: json["data"] != null
          ? (json["data"] != "not_active"
              ? LoginDataResponse.fromJson(json["data"])
              : null)
          : null,
      message: json["message"],
      status: statusBool(json["status"]),
    );
  }
}
