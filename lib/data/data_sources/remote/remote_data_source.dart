import 'package:task/data/network/app_api.dart';
import 'package:task/data/network/requests.dart';
import 'package:task/data/responses/active_account_response.dart';
import 'package:task/data/responses/services_response.dart';
import 'package:task/data/responses/login_response.dart';
import 'package:task/data/responses/register_response.dart';
import '../../responses/active_account_email_or_phone_response.dart';

abstract class RemoteDataSource {
  Future<LoginResponse> login(LoginRequest loginRequest);
  Future<RegisterResponse> register(RegisterRequest registerRequest);
  Future<ServicesResponse> getServices();
  Future<ActiveAccountEmailOrPhoneResponse> activeEmail(
      ActiveEmailRequest activeEmailRequest);
  Future<ActiveAccountEmailOrPhoneResponse> acivePhone(
      ActivePhoneRequest activePhoneRequest);
  Future<ActiveAccountResponse> activeAccount(
      ActiveAccountRequest activeAccountRequest);
}

class RemoteDataSourceImpl implements RemoteDataSource {
  final AppApi _api;

  RemoteDataSourceImpl(this._api);

  @override
  Future<LoginResponse> login(LoginRequest loginRequest) async =>
      await _api.login(loginRequest);

  @override
  Future<RegisterResponse> register(RegisterRequest registerRequest) async =>
      await _api.register(registerRequest);

  @override
  Future<ServicesResponse> getServices() async => await _api.getServices();

  @override
  Future<ActiveAccountEmailOrPhoneResponse> acivePhone(
          ActivePhoneRequest activePhoneRequest) async =>
      await _api.activePhone(activePhoneRequest);

  @override
  Future<ActiveAccountEmailOrPhoneResponse> activeEmail(
          ActiveEmailRequest activeEmailRequest) async =>
      await _api.activeEmail(activeEmailRequest);

  @override
  Future<ActiveAccountResponse> activeAccount(
          ActiveAccountRequest activeAccountRequest) async =>
      await _api.activeAccount(activeAccountRequest);
}
