import 'package:flutter_test/flutter_test.dart';
import 'package:task/data/network/dio_factory.dart';

void main() {
  late DioFactory dioFactory;

  setUp(() {
    dioFactory = DioFactory();
  });

  test(
    "dio should have proper headers ",
    () async {
      final dio = dioFactory.getDio();
      expect(
        dio.options.headers,
        {
          accept: applicationJson,
          acceptLanguage: language,
          contentType: applicationJson,
        },
      );
    },
  );

  test(
    "dio should have interceptors",
    () async {
      final dio = dioFactory.getDio();
      expect(dio.interceptors, isNotEmpty);
    },
  );
}
