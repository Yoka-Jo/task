import 'package:task/app/extensions.dart';
import 'package:task/data/responses/active_account_email_or_phone_response.dart';
import 'package:task/data/responses/services_response.dart';
import 'package:task/data/responses/login_response.dart';
import 'package:task/domain/models/active_account_email_or_phone_model.dart';
import 'package:task/domain/models/login_model.dart';
import 'package:task/domain/models/services_model.dart';
import '../../domain/models/active_account_model.dart';
import '../../domain/models/register_model.dart';
import '../../domain/models/user_data_model.dart';
import '../responses/active_account_response.dart';
import '../responses/register_response.dart';
import '../responses/user_data_response.dart';

//! USER DATA
extension UserDataResponseMapper on UserDataResponse? {
  UserDataModel toDomain() {
    return UserDataModel(
      id: this?.id.orZero() ?? 0,
      name: this?.name.orEmpty() ?? "",
      phone: this?.phone.orEmpty() ?? "",
      email: this?.email.orEmpty() ?? "",
      image: this?.image.orEmpty() ?? "",
      isNotifiy: this?.isNotifiy.orFalse() ?? false,
    );
  }
}

//! LOGIN
extension LoginDataResponseMapper on LoginDataResponse? {
  LoginDataModel toDomain() {
    return LoginDataModel(
        userData: this?.userData.toDomain(),
        token: this?.token.orEmpty() ?? "");
  }
}

extension LoginResponseMapper on LoginResponse? {
  LoginModel toDomain() {
    return LoginModel(
      data: this?.data.toDomain(),
      message: this?.message.orEmpty() ?? "",
      status: this?.status.orFalse() ?? false,
    );
  }
}

//! REGISTER
extension RegisterResponseMapper on RegisterResponse? {
  RegisterModel toDomain() {
    return RegisterModel(
      data: this?.data.toDomain(),
      message: this?.message.orEmpty() ?? "",
      status: this?.status.orFalse() ?? false,
    );
  }
}

//! ACTIVE ACCOUNT EMAIL OR PHONE TO SEND CODE

extension ActiveAccountEmailOrPhoneResponseMapper
    on ActiveAccountEmailOrPhoneResponse? {
  ActiveAccountEmailOrPhoneModel toDomain() {
    return ActiveAccountEmailOrPhoneModel(
      code: this?.code.orZero() ?? 0,
      message: this?.message.orEmpty() ?? "",
      status: this?.status.orFalse() as bool,
    );
  }
}

//! ACTIVE ACCOUNT RESPONSE
extension ActiveAccountDataResponseMapper on ActiveAccountDataResponse? {
  ActiveAccountDataModel toDomain() {
    return ActiveAccountDataModel(
      userData: this?.userData.toDomain(),
      token: this?.token.orEmpty() ?? "",
    );
  }
}

extension ActiveAccountResponseMapper on ActiveAccountResponse? {
  ActiveAccountModel toDomain() {
    return ActiveAccountModel(
      data: this?.data.toDomain(),
      message: this?.message.orEmpty() ?? "",
      status: this?.status.orFalse() as bool,
    );
  }
}

//! SESRVICES
extension ServicesItemResponseMapper on ServicesItemResponse? {
  ServicesItemModel toDomain() {
    return ServicesItemModel(
      id: this?.id.orZero() ?? 0,
      title: this?.title.orEmpty() ?? "",
      description: this?.description.orEmpty() ?? "",
      image: this?.image.orEmpty() ?? "",
      category: this?.category.orEmpty() ?? "",
      price: this?.price.orZero() ?? 0.0,
    );
  }
}

extension ServicesResponseMapper on ServicesResponse? {
  ServicesModel toDomain() {
    return ServicesModel(
      servicesList: this
              ?.servicesList
              ?.map((servicesItem) => servicesItem.toDomain())
              .toList() ??
          [],
      status: this?.status.orFalse() ?? false,
      message: this?.message.orEmpty() ?? "",
    );
  }
}
