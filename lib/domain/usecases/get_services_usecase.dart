import 'package:dartz/dartz.dart';

import 'package:task/data/network/failure.dart';
import 'package:task/domain/repository/repository.dart';
import 'package:task/domain/usecases/base_usecase.dart';

import '../models/services_model.dart';

class GetServicesUseCase implements BaseUseCase<ServicesModel, NoParams> {
  final Repository _repository;
  GetServicesUseCase(
    this._repository,
  );

  @override
  Future<Either<Failure, ServicesModel>> call(NoParams params) async =>
      await _repository.getServices();
}
