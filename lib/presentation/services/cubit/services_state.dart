// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'services_cubit.dart';

abstract class ServicesState {}

class ServicesInitialState extends ServicesState {}

class ServicesLoadingState extends ServicesState {}

class ServicesSuccesState extends ServicesState {}

class ServicesFailureState extends ServicesState {
  final String message;
  ServicesFailureState(
    this.message,
  );
}
