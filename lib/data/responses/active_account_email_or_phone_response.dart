import 'package:task/app/functions.dart';

class ActiveAccountEmailOrPhoneResponse {
  final int? code;
  final String? message;
  final bool? status;
  ActiveAccountEmailOrPhoneResponse({
    required this.code,
    required this.message,
    required this.status,
  });

  factory ActiveAccountEmailOrPhoneResponse.fromJson(
      Map<String, dynamic> json) {
    return ActiveAccountEmailOrPhoneResponse(
      status: statusBool(json["status"]),
      code: json["data"] != null ? json["data"]["code"] : null,
      message: json["message"],
    );
  }
}
