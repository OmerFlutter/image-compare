import 'dart:ui';

import 'package:flutter_test/flutter_test.dart';
import 'package:image_compare/features/image_compare/domain/services/image_compare_service.dart';
import 'package:image_compare/features/image_compare/infrastructure/services/image_compare_service_impl.dart';
import 'package:image_compare/features/image_compare/presentation/constants/assets.dart';
import 'package:image_compare/features/image_compare/presentation/cubit/image_compare_cubit/utils/image_decoder.dart';
import 'package:mocktail/mocktail.dart';

class FakeImage extends Fake implements Image {}

void main() {
  late ImageCompareService imageCompareService;

  setUp(() {
    TestWidgetsFlutterBinding.ensureInitialized();

    imageCompareService = ImageCompareServiceImpl();

    registerFallbackValue(FakeImage());
  });

  const _kImageCompareResult = 41.83;

  group('ImageCompareService compare', () {
    test('should return a comparison value', () async {
      // act
      final firstImage = await ImageDecoder.decodeFromAsset(Assets.firstImage);
      final secondImage =
          await ImageDecoder.decodeFromAsset(Assets.secondImage);

      final result = await imageCompareService.compare(firstImage, secondImage);
      // assert
      expect(result, _kImageCompareResult);
    });
  });
}
