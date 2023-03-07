import 'dart:ui';

import 'package:flutter_test/flutter_test.dart';
import 'package:image_compare/features/image_compare/domain/image_result.dart';
import 'package:image_compare/features/image_compare/domain/repositories/image_compare_repository.dart';
import 'package:image_compare/features/image_compare/domain/usecases/compare_images_usecase.dart';
import 'package:image_compare/features/image_compare/presentation/constants/assets.dart';
import 'package:image_compare/features/image_compare/presentation/cubit/image_compare_cubit/utils/image_decoder.dart';
import 'package:mocktail/mocktail.dart';

class MockImageCompareRepository extends Mock
    implements ImageCompareRepository {}

class FakeImage extends Fake implements Image {}

void main() {
  late ImageCompareRepository imageCompareRepository;
  late CompareImagesUseCase compareImagesUseCase;

  setUp(() {
    TestWidgetsFlutterBinding.ensureInitialized();

    imageCompareRepository = MockImageCompareRepository();
    compareImagesUseCase = CompareImagesUseCase(imageCompareRepository);

    registerFallbackValue(FakeImage());
  });

  const _kImageCompareResult = ImageResult.success(50.0);

  group('CompareImagesUseCase execute', () {
    test('should return a comparison value', () async {
      // arrange
      when(
        () => imageCompareRepository.compare(
          firstImage: any(named: 'firstImage'),
          secondImage: any(named: 'secondImage'),
        ),
      ).thenAnswer((_) => Future.value(_kImageCompareResult));
      // act
      final firstImage = await ImageDecoder.decodeFromAsset(Assets.firstImage);
      final secondImage =
          await ImageDecoder.decodeFromAsset(Assets.secondImage);

      final result = await compareImagesUseCase.execute(
        firstImage: firstImage,
        secondImage: secondImage,
      );
      // assert
      expect(result, _kImageCompareResult);
      verify(
        () => imageCompareRepository.compare(
          firstImage: any(named: 'firstImage'),
          secondImage: any(named: 'secondImage'),
        ),
      ).called(1);
      verifyNoMoreInteractions(imageCompareRepository);
    });
  });
}
