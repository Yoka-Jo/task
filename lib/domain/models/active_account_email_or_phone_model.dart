import 'package:equatable/equatable.dart';

class ActiveAccountEmailOrPhoneModel extends Equatable {
  final int code;
  final String message;
  final bool status;
  const ActiveAccountEmailOrPhoneModel({
    required this.code,
    required this.message,
    required this.status,
  });

  @override
  List<Object?> get props => [code, message, status];
}
