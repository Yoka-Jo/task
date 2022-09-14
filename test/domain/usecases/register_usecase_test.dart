import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:task/data/network/requests.dart';
import 'package:task/domain/models/register_model.dart';
import 'package:task/domain/models/user_data_model.dart';
import 'package:task/domain/repository/repository.dart';
import 'package:task/domain/usecases/base_usecase.dart';
import 'package:task/domain/usecases/register_usecase.dart';

class MockRepository extends Mock implements Repository {}

class FakeRegisterRequest extends Fake implements RegisterRequest {}

void main() {
  late MockRepository mockRepository;
  late RegisterUseCase sut;
  late RegisterRequest tRegisterRequest;
  late UserDataModel tUserDataModel;
  late RegisterModel tRegisterModel;

  setUp(() {
    registerFallbackValue(FakeRegisterRequest());
    mockRepository = MockRepository();
    sut = RegisterUseCase(mockRepository);
    tRegisterRequest = RegisterRequest(
      name: "Yousef",
      phone: "01020913878",
      email: "ym8370302@gmail.com",
      password: "123456",
      tokenFirebase: "tokenFirebase",
      deviceId: "deviceId",
    );
    tUserDataModel = const UserDataModel(
        id: 1,
        name: "name",
        phone: "01020913878",
        email: "ym8370302@gmail.com",
        image: "image",
        isNotifiy: true);
    tRegisterModel = RegisterModel(
        data: tUserDataModel, status: true, message: "الرجاء تفعيل الحساب ");
  });

  test("should be subclass of UseCase claass", () async {
    expect(sut, isA<BaseUseCase>());
  });

  test("should return ActiveAccountEmailOrPhoneModel", () async {
    // arrangeg
    when(() => mockRepository.register(any()))
        .thenAnswer((_) async => Right(tRegisterModel));
    //act
    final result = await sut(tRegisterRequest);
    //assert
    expect(result, equals(Right(tRegisterModel)));
    verify(() => mockRepository.register(tRegisterRequest));
    verifyNoMoreInteractions(mockRepository);
  });
}
