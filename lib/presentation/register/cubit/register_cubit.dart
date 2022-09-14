import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task/data/network/requests.dart';
import 'package:task/domain/usecases/register_usecase.dart';
import 'package:task/presentation/shared/freezed/freezed_data_classes.dart';
import '../../../app/extensions.dart';
import '../../../app/functions.dart';
import '../../../app/globals.dart';
import '../../resources/strings_manager.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  final RegisterUseCase _useCase;
  RegisterCubit(this._useCase) : super(RegisterInitialState());
  static RegisterCubit get(BuildContext context) => BlocProvider.of(context);

  RegisterObject registerObject = RegisterObject(
    name: "",
    phoneNumber: "",
    email: "",
    password: "",
    confirmPassword: "",
  );
  bool areInputsValid = false;
  String? errorName;
  String? errorPhoneNumber;
  String? errorEmail;
  String? errorPassword;
  String? errorConfirmPassword;

  Future<void> register() async {
    emit(RegisterLoadingState());
    final response = await _useCase(RegisterRequest(
      name: registerObject.name,
      phone: registerObject.phoneNumber,
      email: registerObject.email,
      password: registerObject.password,
      tokenFirebase: firebaseToken.orEmpty(),
      deviceId: deviceId.orEmpty(),
    ));
    response.fold(
      (failure) {
        emit(RegisterFailureState(failure.message));
      },
      (data) {
        log(data.data?.name ?? "");
        emit(RegisterSuccessState());
      },
    );
  }

  void setName(String userName) {
    if (userName.length >= 4) {
      registerObject = registerObject.copyWith(name: userName);
      errorName = null;
    } else {
      registerObject = registerObject.copyWith(name: "");
      errorName = AppStrings.nameInvalid;
    }
    validate();
  }

  void setPhoneNumber(String phoneNumber) {
    if (phoneNumber.length == 11) {
      registerObject = registerObject.copyWith(phoneNumber: phoneNumber);
      errorPhoneNumber = null;
    } else {
      registerObject = registerObject.copyWith(phoneNumber: "");
      errorPhoneNumber = AppStrings.phoneNumberInvalid;
    }
    validate();
  }

  void setEmail(String email) {
    if (isEmailValid(email)) {
      registerObject = registerObject.copyWith(email: email);
      errorEmail = null;
    } else {
      registerObject = registerObject.copyWith(email: "");
      errorEmail = AppStrings.emailInvalid;
    }
    validate();
  }

  void setPassword(String password) {
    if (isPasswordValid(password)) {
      registerObject = registerObject.copyWith(password: password);
      errorPassword = null;
    } else {
      registerObject = registerObject.copyWith(password: "");
      errorPassword = AppStrings.passwordInvalid;
    }
    validate();
  }

  void setConfirmPassword(String confirmPassword) {
    if (confirmPassword == registerObject.password) {
      registerObject =
          registerObject.copyWith(confirmPassword: confirmPassword);
      errorConfirmPassword = null;
    } else {
      registerObject = registerObject.copyWith(confirmPassword: "");
      errorConfirmPassword = AppStrings.confirmPasswordInvalid;
    }
    validate();
  }

  void validate() {
    areInputsValid = registerObject.name.isNotEmpty &&
        registerObject.email.isNotEmpty &&
        registerObject.password.isNotEmpty &&
        registerObject.confirmPassword.isNotEmpty;
    emit(RegisterValidateInputsState());
  }
}
