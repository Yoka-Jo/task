// ignore_for_file: public_member_api_docs, sort_constructors_first
enum ActiveAccountType { email, phone }

class LoginRequest {
  final String email;
  final String password;
  final String tokenFirebase;
  final String deviceId;

  LoginRequest({
    required this.email,
    required this.password,
    required this.tokenFirebase,
    required this.deviceId,
  });

  Map<String, dynamic> toJson() {
    return {
      "email": email,
      "password": password,
      "token_firebase": tokenFirebase,
      "device_id": deviceId,
    };
  }
}

class RegisterRequest {
  final String name;
  final String phone;
  final String email;
  final String password;
  final String tokenFirebase;
  final String deviceId;

  RegisterRequest({
    required this.name,
    required this.phone,
    required this.email,
    required this.password,
    required this.tokenFirebase,
    required this.deviceId,
  });

  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "phone": phone,
      "email": email,
      "password": password,
      "confirm_password": password,
      "token_firebase": tokenFirebase,
      "device_id": deviceId,
    };
  }
}

class ActivePhoneOrEmailRequest {
  final String name;
  final String phone;
  final String email;
  final String password;
  final String tokenFirebase;
  final String deviceId;

  ActivePhoneOrEmailRequest({
    required this.name,
    required this.phone,
    required this.email,
    required this.password,
    required this.tokenFirebase,
    required this.deviceId,
  });

  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "phone": phone,
      "email": email,
      "password": password,
      "token_firebase": tokenFirebase,
      "device_id": deviceId,
    };
  }
}

class ActiveEmailRequest {
  final String email;

  ActiveEmailRequest({
    required this.email,
  });

  Map<String, dynamic> toJson() {
    return {
      "email": email,
      "type": ActiveAccountType.email.name,
    };
  }
}

class ActivePhoneRequest {
  final String phone;

  ActivePhoneRequest({
    required this.phone,
  });

  Map<String, dynamic> toJson() {
    return {
      "phone": phone,
      "type": ActiveAccountType.phone.name,
    };
  }
}

class ActiveAccountRequest {
  final String phoneOrEmail;
  final String code;
  final String type;

  ActiveAccountRequest({
    required this.phoneOrEmail,
    required this.code,
    required this.type,
  });

  Map<String, dynamic> toJson() {
    return {
      "phone_or_email": phoneOrEmail,
      "code": code,
      "type": type,
    };
  }
}
