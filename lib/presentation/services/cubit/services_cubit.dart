import 'package:bloc/bloc.dart';
import 'package:task/domain/models/services_model.dart';
import 'package:task/domain/usecases/base_usecase.dart';
import 'package:task/domain/usecases/get_services_usecase.dart';

part 'services_state.dart';

class ServicesCubit extends Cubit<ServicesState> {
  final GetServicesUseCase _useCase;
  ServicesCubit(this._useCase) : super(ServicesInitialState());

  late ServicesModel services;

  Future<void> getServices() async {
    emit(ServicesLoadingState());
    final response = await _useCase(NoParams());
    response.fold((failure) {
      emit(ServicesFailureState(failure.message));
    }, (data) {
      services = data;
      emit(ServicesSuccesState());
    });
  }
}
