import 'package:dartz/dartz.dart';

import 'package:task/data/network/failure.dart';
import 'package:task/data/network/requests.dart';
import 'package:task/domain/models/active_account_email_or_phone_model.dart';
import 'package:task/domain/repository/repository.dart';
import 'package:task/domain/usecases/base_usecase.dart';

class ActiveEmailUseCase
    implements BaseUseCase<ActiveAccountEmailOrPhoneModel, ActiveEmailRequest> {
  final Repository _repository;
  ActiveEmailUseCase(
    this._repository,
  );

  @override
  Future<Either<Failure, ActiveAccountEmailOrPhoneModel>> call(
          ActiveEmailRequest params) async =>
      await _repository.activeEmail(params);
}
