import 'package:dartz/dartz.dart';

import 'package:task/data/network/failure.dart';
import 'package:task/data/network/requests.dart';
import 'package:task/domain/models/login_model.dart';
import 'package:task/domain/repository/repository.dart';
import 'package:task/domain/usecases/base_usecase.dart';

class LoginUseCase implements BaseUseCase<LoginModel, LoginRequest> {
  final Repository _repository;
  LoginUseCase(
    this._repository,
  );

  @override
  Future<Either<Failure, LoginModel>> call(LoginRequest params) async =>
      await _repository.login(params);
}
