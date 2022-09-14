import 'package:dartz/dartz.dart';
import 'package:task/data/network/failure.dart';
import 'package:task/data/network/requests.dart';
import 'package:task/domain/models/active_account_email_or_phone_model.dart';
import 'package:task/domain/models/active_account_model.dart';
import 'package:task/domain/models/login_model.dart';
import 'package:task/domain/models/services_model.dart';
import '../models/register_model.dart';

abstract class Repository {
  Future<Either<Failure, LoginModel>> login(LoginRequest loginRequest);
  Future<Either<Failure, RegisterModel>> register(
      RegisterRequest registerRequest);
  Future<Either<Failure, ServicesModel>> getServices();
  Future<Either<Failure, ActiveAccountEmailOrPhoneModel>> activePhone(
      ActivePhoneRequest activePhoneRequest);
  Future<Either<Failure, ActiveAccountEmailOrPhoneModel>> activeEmail(
      ActiveEmailRequest activeEmailRequest);
  Future<Either<Failure, ActiveAccountModel>> activeAccount(
      ActiveAccountRequest activeAccountRequest);
}
