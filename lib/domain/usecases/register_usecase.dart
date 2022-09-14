import 'package:dartz/dartz.dart';

import 'package:task/data/network/failure.dart';
import 'package:task/data/network/requests.dart';
import 'package:task/domain/repository/repository.dart';
import 'package:task/domain/usecases/base_usecase.dart';

import '../models/register_model.dart';

class RegisterUseCase implements BaseUseCase<RegisterModel, RegisterRequest> {
  final Repository _repository;
  RegisterUseCase(
    this._repository,
  );

  @override
  Future<Either<Failure, RegisterModel>> call(RegisterRequest params) async =>
      await _repository.register(params);
}
