import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:task/data/network/requests.dart';
import 'package:task/domain/models/active_account_email_or_phone_model.dart';
import 'package:task/domain/repository/repository.dart';
import 'package:task/domain/usecases/active_phone_usecase.dart';
import 'package:task/domain/usecases/base_usecase.dart';

class MockRepository extends Mock implements Repository {}

class FakeActivePhoneRequest extends Fake implements ActivePhoneRequest {}

void main() {
  late MockRepository mockRepository;
  late ActivePhoneUseCase sut;
  late ActiveAccountEmailOrPhoneModel tActiveAccountEmailOrPhoneModel;
  late ActivePhoneRequest tActivePhoneRequest;

  setUp(() {
    registerFallbackValue(FakeActivePhoneRequest());
    mockRepository = MockRepository();
    sut = ActivePhoneUseCase(mockRepository);
    tActiveAccountEmailOrPhoneModel = const ActiveAccountEmailOrPhoneModel(
        code: 1234, message: "تم ارسال الكود الى الهاتف", status: true);
    tActivePhoneRequest = ActivePhoneRequest(phone: "01020913878");
  });

  test("should be subclass of UseCase claass", () async {
    expect(sut, isA<BaseUseCase>());
  });

  test("should return ActiveAccountEmailOrPhoneModel", () async {
    // arrangeg
    when(() => mockRepository.activePhone(any()))
        .thenAnswer((_) async => Right(tActiveAccountEmailOrPhoneModel));
    //act
    final result = await sut(tActivePhoneRequest);
    //assert
    expect(result, equals(Right(tActiveAccountEmailOrPhoneModel)));
    verify(() => mockRepository.activePhone(tActivePhoneRequest));
    verifyNoMoreInteractions(mockRepository);
  });
}
