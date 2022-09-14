// ignore: depend_on_referenced_packages
import 'package:freezed_annotation/freezed_annotation.dart';
part 'freezed_data_classes.freezed.dart';

@freezed
class RegisterObject with _$RegisterObject {
  factory RegisterObject({
    required String name,
    required String phoneNumber,
    required String email,
    required String password,
    required String confirmPassword,
  }) = _RegisterObject;
}

@freezed
class LoginObject with _$LoginObject {
  factory LoginObject({
    required String email,
    required String password,
  }) = _LoginObject;
}
