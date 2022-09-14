import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:task/data/network/requests.dart';
import 'package:task/domain/models/active_account_model.dart';
import 'package:task/domain/models/user_data_model.dart';
import 'package:task/domain/repository/repository.dart';
import 'package:task/domain/usecases/acive_account_usecase.dart';
import 'package:task/domain/usecases/base_usecase.dart';

class MockRepository extends Mock implements Repository {}

class FakeActiveAccountRequest extends Fake implements ActiveAccountRequest {}

void main() {
  late MockRepository mockRepository;
  late ActiveAccountUseCase sut;
  late ActiveAccountDataModel tActiveAccountDataModel;
  late ActiveAccountModel tActiveAccountModel;
  late UserDataModel tUserModel;
  late ActiveAccountRequest tActiveAccountRequest;

  setUp(() {
    registerFallbackValue(FakeActiveAccountRequest());
    mockRepository = MockRepository();
    sut = ActiveAccountUseCase(mockRepository);
    tUserModel = const UserDataModel(
        id: 1,
        name: "name",
        phone: "01020913878",
        email: "ym8370302@gmail.com",
        image: "image",
        isNotifiy: true);
    tActiveAccountDataModel = ActiveAccountDataModel(
        userData: tUserModel, token: "this is some token");
    tActiveAccountModel = ActiveAccountModel(
        data: tActiveAccountDataModel, message: "message", status: true);
    tActiveAccountRequest = ActiveAccountRequest(
        phoneOrEmail: "ym8370302@gmail.com", code: "1234", type: "email");
  });

  test("should be subclass of UseCase claass", () async {
    expect(sut, isA<BaseUseCase>());
  });

  test("should return ActiveAccountModel", () async {
    // arrangeg
    when(() => mockRepository.activeAccount(any()))
        .thenAnswer((_) async => Right(tActiveAccountModel));
    //act
    final result = await sut(tActiveAccountRequest);
    //assert
    expect(result, equals(Right(tActiveAccountModel)));
    verify(() => mockRepository.activeAccount(tActiveAccountRequest));
    verifyNoMoreInteractions(mockRepository);
  });
}
