import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:task/domain/models/services_model.dart';
import 'package:task/domain/repository/repository.dart';
import 'package:task/domain/usecases/base_usecase.dart';
import 'package:task/domain/usecases/get_services_usecase.dart';

class MockRepository extends Mock implements Repository {}

void main() {
  late MockRepository mockRepository;
  late GetServicesUseCase sut;
  late ServicesItemModel tServicesItemModel;
  late ServicesModel tServicesModel;

  setUp(() {
    mockRepository = MockRepository();
    sut = GetServicesUseCase(mockRepository);
    tServicesItemModel = const ServicesItemModel(
        id: 1,
        title: "تنظيف الواجهات الزجاجية",
        description:
            "نظراً لأن تنظيف الواجهات الـزجاجـيـة للمـبـانـي والشـركات لا يمكن أن يتم بـدون الاستعانة بمتخصـصيـن لوجود الـكـثـيـر من المخاطـر ولحاجته لعمالة مـدربة على العمل في الارتفاعات الكبيرة من خـلال الرافعات المعـدة خصيصاً لهـذا الغرض لذلك نقدم لكم خـدمة تنظيف الواجـهـات الــزجـــاجــية بمنتهى الدقة والجودة.",
        image: "https://mawasims.com.sa/storage/service/news-service.png",
        category: "نظافة مباني",
        price: 1);
    tServicesModel = ServicesModel(
        servicesList: [tServicesItemModel], message: "success", status: true);
  });

  test("should be subclass of UseCase claass", () async {
    expect(sut, isA<BaseUseCase>());
  });

  test("should return ServicesModel", () async {
    // arrangeg
    when(() => mockRepository.getServices())
        .thenAnswer((_) async => Right(tServicesModel));
    //act
    final result = await sut(NoParams());
    //assert
    expect(result, equals(Right(tServicesModel)));
    verify(() => mockRepository.getServices());
    verifyNoMoreInteractions(mockRepository);
  });
}
