import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:task/data/data_sources/remote/remote_data_source.dart';
import 'package:task/data/network/app_api.dart';
import 'package:task/data/network/dio_factory.dart';
import 'package:task/data/repository/repository_impl.dart';
import 'package:task/domain/repository/repository.dart';
import 'package:task/domain/usecases/acive_account_usecase.dart';
import 'package:task/domain/usecases/active_email_usecase.dart';
import 'package:task/domain/usecases/active_phone_usecase.dart';
import 'package:task/domain/usecases/get_services_usecase.dart';
import 'package:task/domain/usecases/login_usecase.dart';
import 'package:task/presentation/confirm_registration_code/cubit/confirm_registration_code_cubit.dart';
import 'package:task/presentation/confirm_registration_email/cubit/confirm_registration_email_code_cubit.dart';
import 'package:task/presentation/confirm_registration_phone/cubit/confirm_registration_phone_code_cubit.dart';
import 'package:task/presentation/login/cubit/login_cubit.dart';
import 'package:task/presentation/services/cubit/services_cubit.dart';

import '../domain/usecases/register_usecase.dart';
import '../presentation/register/cubit/register_cubit.dart';

final instance = GetIt.instance;

Future<void> initAppModule() async {
  instance.registerLazySingleton<DioFactory>(() => DioFactory());

  Dio dio = instance<DioFactory>().getDio();

  instance.registerLazySingleton<AppApi>(() => AppApiImpl(dio));

  instance.registerLazySingleton<RemoteDataSource>(
      () => RemoteDataSourceImpl(instance()));

  instance.registerLazySingleton<Repository>(() => RepositoryImpl(instance()));
}

void initRegisterModule() {
  if (!GetIt.I.isRegistered<RegisterUseCase>()) {
    instance
        .registerFactory<RegisterUseCase>(() => RegisterUseCase(instance()));

    instance.registerFactory<RegisterCubit>(() => RegisterCubit(instance()));
  }
}

void initLoginModule() {
  if (!GetIt.I.isRegistered<LoginUseCase>()) {
    instance.registerFactory<LoginUseCase>(() => LoginUseCase(instance()));

    instance.registerFactory<LoginCubit>(() => LoginCubit(instance()));
  }
}

void initAciveAccountModule() {
  if (!GetIt.I.isRegistered<ActiveAccountUseCase>()) {
    instance.registerFactory<ActiveAccountUseCase>(
        () => ActiveAccountUseCase(instance()));

    instance.registerFactory<ConfirmRegistrationCodeCubit>(
        () => ConfirmRegistrationCodeCubit(instance()));
  }
}

void initActiveEmailModule() {
  if (!GetIt.I.isRegistered<ActiveEmailUseCase>()) {
    instance.registerFactory<ActiveEmailUseCase>(
        () => ActiveEmailUseCase(instance()));

    instance.registerFactory<ConfirmRegistrationEmailCubit>(
        () => ConfirmRegistrationEmailCubit(instance()));
  }
}

void initActivePhoneModule() {
  if (!GetIt.I.isRegistered<ActivePhoneUseCase>()) {
    instance.registerFactory<ActivePhoneUseCase>(
        () => ActivePhoneUseCase(instance()));

    instance.registerFactory<ConfirmRegistrationPhoneCubit>(
        () => ConfirmRegistrationPhoneCubit(instance()));
  }
}

void initGetServicesModule() {
  if (!GetIt.I.isRegistered<GetServicesUseCase>()) {
    instance.registerFactory<GetServicesUseCase>(
        () => GetServicesUseCase(instance()));

    instance.registerFactory<ServicesCubit>(() => ServicesCubit(instance()));
  }
}
