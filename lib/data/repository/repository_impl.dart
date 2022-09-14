import 'dart:developer';
import 'package:task/app/constants.dart';
import 'package:task/data/data_sources/remote/remote_data_source.dart';
import 'package:task/data/mapper/mappers.dart';
import 'package:task/data/network/error_handler.dart';
import 'package:task/data/network/requests.dart';
import 'package:task/domain/models/active_account_model.dart';
import 'package:task/domain/models/login_model.dart';
import 'package:task/data/network/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:task/domain/models/services_model.dart';
import 'package:task/domain/repository/repository.dart';
import 'package:task/presentation/resources/strings_manager.dart';

import '../../domain/models/active_account_email_or_phone_model.dart';
import '../../domain/models/register_model.dart';

class RepositoryImpl implements Repository {
  final RemoteDataSource _remoteDataSource;

  RepositoryImpl(this._remoteDataSource);

  @override
  Future<Either<Failure, LoginModel>> login(LoginRequest loginRequest) async {
    try {
      final response = await _remoteDataSource.login(loginRequest);
      if (response.status == Constants.okStatusCode) {
        return Right(response.toDomain());
      } else {
        return Left(Failure(
            code: Constants.failureStatusCode,
            message: response.message ?? AppStrings.loginError));
      }
    } catch (e) {
      return Left(ErrorHandler.handle(e).failure);
    }
  }

  @override
  Future<Either<Failure, RegisterModel>> register(
      RegisterRequest registerRequest) async {
    try {
      final response = await _remoteDataSource.register(registerRequest);
      if (response.status == Constants.okStatusCode) {
        return Right(response.toDomain());
      } else {
        return Left(Failure(
            code: Constants.failureStatusCode,
            message: response.message ?? AppStrings.registerError));
      }
    } catch (e) {
      log("errororrrrrrrrrrrrrrrrrrrrrrrr $e");
      return Left(ErrorHandler.handle(e).failure);
    }
  }

  @override
  Future<Either<Failure, ServicesModel>> getServices() async {
    try {
      final response = await _remoteDataSource.getServices();
      if (response.status == Constants.okStatusCode) {
        return Right(response.toDomain());
      } else {
        return Left(Failure(
            code: Constants.failureStatusCode,
            message: response.message ?? AppStrings.internalServerError));
      }
    } catch (e) {
      return Left(ErrorHandler.handle(e).failure);
    }
  }

  @override
  Future<Either<Failure, ActiveAccountEmailOrPhoneModel>> activeEmail(
      ActiveEmailRequest activeEmailRequest) async {
    try {
      final response = await _remoteDataSource.activeEmail(activeEmailRequest);
      if (response.status == Constants.okStatusCode) {
        return Right(response.toDomain());
      } else {
        return Left(Failure(
            code: Constants.failureStatusCode,
            message: response.message ?? AppStrings.notFoundError));
      }
    } catch (e) {
      return Left(ErrorHandler.handle(e).failure);
    }
  }

  @override
  Future<Either<Failure, ActiveAccountEmailOrPhoneModel>> activePhone(
      ActivePhoneRequest activePhoneRequest) async {
    try {
      final response = await _remoteDataSource.acivePhone(activePhoneRequest);
      if (response.status == Constants.okStatusCode) {
        return Right(response.toDomain());
      } else {
        return Left(Failure(
            code: Constants.failureStatusCode,
            message: response.message ?? AppStrings.notFoundError));
      }
    } catch (e) {
      return Left(ErrorHandler.handle(e).failure);
    }
  }

  @override
  Future<Either<Failure, ActiveAccountModel>> activeAccount(
      ActiveAccountRequest activeAccountRequest) async {
    try {
      final response =
          await _remoteDataSource.activeAccount(activeAccountRequest);
      if (response.status == Constants.okStatusCode) {
        return Right(response.toDomain());
      } else {
        return Left(Failure(
            code: Constants.failureStatusCode,
            message: response.message ?? AppStrings.notFoundError));
      }
    } catch (e) {
      log("**************************** $e");
      return Left(ErrorHandler.handle(e).failure);
    }
  }
}
