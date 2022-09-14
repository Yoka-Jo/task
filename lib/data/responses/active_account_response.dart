import 'package:task/data/responses/user_data_response.dart';

class ActiveAccountDataResponse {
  final UserDataResponse? userData;
  final String? token;
  ActiveAccountDataResponse({
    required this.userData,
    required this.token,
  });

  factory ActiveAccountDataResponse.fromJson(Map<String, dynamic> json) {
    return ActiveAccountDataResponse(
      userData: UserDataResponse.fromJson(json["user"]),
      token: json["token"],
    );
  }
}

class ActiveAccountResponse {
  final ActiveAccountDataResponse? data;
  final String? message;
  final bool? status;
  ActiveAccountResponse({
    this.data,
    this.message,
    this.status,
  });

  factory ActiveAccountResponse.fromJson(Map<String, dynamic> json) {
    return ActiveAccountResponse(
      data: json["data"] != null
          ? ActiveAccountDataResponse.fromJson(json["data"])
          : null,
      message: json["message"],
      status: json["status"],
    );
  }
}

/*
{
    "data": {
        "user": {
            "id": 110,
            "name": "Yousef",
            "phone": "01020913878",
            "email": "ym8370302@gmail.com",
            "image": "https://mawasims.com.sa/storage/user/default.png",
            "is_notifiy": true
        },
        "token": "230|kfKrtwcxU6DNYOf1J0wK3YWrTOq5I3g6pHXJMF1I"
    },
    "message": "تم تفعيل الحساب بنجاح",
    "status": true
}
*/