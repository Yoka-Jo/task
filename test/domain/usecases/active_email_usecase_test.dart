import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:task/data/network/requests.dart';
import 'package:task/domain/models/active_account_email_or_phone_model.dart';
import 'package:task/domain/repository/repository.dart';
import 'package:task/domain/usecases/active_email_usecase.dart';
import 'package:task/domain/usecases/base_usecase.dart';

class MockRepository extends Mock implements Repository {}

class FakeActiveEmailRequest extends Fake implements ActiveEmailRequest {}

void main() {
  late MockRepository mockRepository;
  late ActiveEmailUseCase sut;
  late ActiveAccountEmailOrPhoneModel tActiveAccountEmailOrPhoneModel;
  late ActiveEmailRequest tActiveEmailRequest;

  setUp(() {
    registerFallbackValue(FakeActiveEmailRequest());
    mockRepository = MockRepository();
    sut = ActiveEmailUseCase(mockRepository);
    tActiveAccountEmailOrPhoneModel = const ActiveAccountEmailOrPhoneModel(
        code: 1234, message: "تم ارسال الكود الى الهاتف", status: true);
    tActiveEmailRequest = ActiveEmailRequest(email: "ym8370302@gmail.com");
  });

  test("should be subclass of UseCase claass", () async {
    expect(sut, isA<BaseUseCase>());
  });

  test("should return ActiveAccountEmailOrPhoneModel", () async {
    // arrangeg
    when(() => mockRepository.activeEmail(any()))
        .thenAnswer((_) async => Right(tActiveAccountEmailOrPhoneModel));
    //act
    final result = await sut(tActiveEmailRequest);
    //assert
    expect(result, equals(Right(tActiveAccountEmailOrPhoneModel)));
    verify(() => mockRepository.activeEmail(tActiveEmailRequest));
    verifyNoMoreInteractions(mockRepository);
  });
}
