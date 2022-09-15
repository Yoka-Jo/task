import 'package:dio/dio.dart';
import 'package:task/app/constants.dart';
import 'package:task/data/network/requests.dart';
import 'package:task/data/responses/active_account_email_or_phone_response.dart';
import 'package:task/data/responses/active_account_response.dart';
import 'package:task/data/responses/services_response.dart';
import 'package:task/data/responses/login_response.dart';
import 'package:task/data/responses/register_response.dart';

abstract class AppApi {
  Future<LoginResponse> login(LoginRequest loginRequest);
  Future<RegisterResponse> register(RegisterRequest registerRequest);
  Future<ServicesResponse> getServices();
  Future<ActiveAccountEmailOrPhoneResponse> activeEmail(
      ActiveEmailRequest activeEmailRequest);
  Future<ActiveAccountEmailOrPhoneResponse> activePhone(
      ActivePhoneRequest activePhoneRequest);
  Future<ActiveAccountResponse> activeAccount(
      ActiveAccountRequest activeAccountRequest);
}

class AppApiImpl implements AppApi {
  final Dio _dio;
  AppApiImpl(this._dio);

  @override
  Future<LoginResponse> login(LoginRequest loginRequest) async {
    final response =
        await _dio.post(Constants.loginPath, data: loginRequest.toJson());
    return LoginResponse.fromJson(response.data);
  }

  @override
  Future<RegisterResponse> register(RegisterRequest registerRequest) async {
    final response =
        await _dio.post(Constants.registerPath, data: registerRequest.toJson());
    return RegisterResponse.fromJson(response.data);
  }

  @override
  Future<ServicesResponse> getServices() async {
    final response = await _dio.get(Constants.getServicesPath);
    return ServicesResponse.fromJson(response.data);
  }

  @override
  Future<ActiveAccountEmailOrPhoneResponse> activeEmail(
      ActiveEmailRequest activeEmailRequest) async {
    final response = await _dio.post(Constants.activePhoneOrEmailPath,
        data: activeEmailRequest.toJson());
    return ActiveAccountEmailOrPhoneResponse.fromJson(response.data);
  }

  @override
  Future<ActiveAccountEmailOrPhoneResponse> activePhone(
      ActivePhoneRequest activePhoneRequest) async {
    final response = await _dio.post(Constants.activePhoneOrEmailPath,
        data: activePhoneRequest.toJson());
    return ActiveAccountEmailOrPhoneResponse.fromJson(response.data);
  }

  @override
  Future<ActiveAccountResponse> activeAccount(
      ActiveAccountRequest activeAccountRequest) async {
    final response = await _dio.post(Constants.activeCodePath,
        data: activeAccountRequest.toJson());
    return ActiveAccountResponse.fromJson(response.data);
  }
}
