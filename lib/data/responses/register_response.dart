import 'package:task/data/responses/user_data_response.dart';

import '../../app/functions.dart';

class RegisterResponse {
  final UserDataResponse? data;
  final String? message;
  final bool? status;
  RegisterResponse({
    this.data,
    this.message,
    this.status,
  });

  factory RegisterResponse.fromJson(Map<String, dynamic> json) {
    return RegisterResponse(
      data:
          json["data"] != null ? UserDataResponse.fromJson(json["data"]) : null,
      message: json["message"],
      status: statusBool(json["status"]),
    );
  }
}
