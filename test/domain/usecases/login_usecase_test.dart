import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:task/data/network/requests.dart';
import 'package:task/domain/models/login_model.dart';
import 'package:task/domain/models/user_data_model.dart';
import 'package:task/domain/repository/repository.dart';
import 'package:task/domain/usecases/base_usecase.dart';
import 'package:task/domain/usecases/login_usecase.dart';

class MockRepository extends Mock implements Repository {}

class FakeLoginRequest extends Fake implements LoginRequest {}

void main() {
  late MockRepository mockRepository;
  late LoginUseCase sut;
  late LoginRequest tLoginRequest;
  late UserDataModel tUserDataModel;
  late LoginDataModel tLoginDataModel;
  late LoginModel tLoginModel;

  setUp(() {
    registerFallbackValue(FakeLoginRequest());
    mockRepository = MockRepository();
    sut = LoginUseCase(mockRepository);
    tLoginRequest = LoginRequest(
        email: "ym8370302@gmail.com",
        password: "123456",
        tokenFirebase: "tokenFirebase",
        deviceId: "deviceId");
    tUserDataModel = const UserDataModel(
        id: 1,
        name: "name",
        phone: "01020913878",
        email: "ym8370302@gmail.com",
        image: "image",
        isNotifiy: true);
    tLoginDataModel = LoginDataModel(userData: tUserDataModel, token: "token");
    tLoginModel = LoginModel(
        data: tLoginDataModel, message: "تم تسجيل الدخول بنجاح", status: true);
  });

  test("should be subclass of UseCase claass", () async {
    expect(sut, isA<BaseUseCase>());
  });

  test("should return ActiveAccountEmailOrPhoneModel", () async {
    // arrangeg
    when(() => mockRepository.login(any()))
        .thenAnswer((_) async => Right(tLoginModel));
    //act
    final result = await sut(tLoginRequest);
    //assert
    expect(result, equals(Right(tLoginModel)));
    verify(() => mockRepository.login(tLoginRequest));
    verifyNoMoreInteractions(mockRepository);
  });
}
