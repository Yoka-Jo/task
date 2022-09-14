import 'package:dartz/dartz.dart';
import 'package:task/data/network/failure.dart';
import 'package:task/data/network/requests.dart';
import 'package:task/domain/models/active_account_model.dart';
import 'package:task/domain/repository/repository.dart';
import 'package:task/domain/usecases/base_usecase.dart';

class ActiveAccountUseCase
    implements BaseUseCase<ActiveAccountModel, ActiveAccountRequest> {
  final Repository _repository;
  ActiveAccountUseCase(
    this._repository,
  );

  @override
  Future<Either<Failure, ActiveAccountModel>> call(
          ActiveAccountRequest params) async =>
      await _repository.activeAccount(params);
}
