import 'package:dartz/dartz.dart';
import 'package:task/data/network/failure.dart';
import 'package:task/data/network/requests.dart';
import 'package:task/domain/repository/repository.dart';
import 'package:task/domain/usecases/base_usecase.dart';

import '../models/active_account_email_or_phone_model.dart';

class ActivePhoneUseCase
    implements BaseUseCase<ActiveAccountEmailOrPhoneModel, ActivePhoneRequest> {
  final Repository _repository;
  ActivePhoneUseCase(
    this._repository,
  );

  @override
  Future<Either<Failure, ActiveAccountEmailOrPhoneModel>> call(
          ActivePhoneRequest params) async =>
      await _repository.activePhone(params);
}
