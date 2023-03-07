import 'dart:ui';

import 'package:flutter_test/flutter_test.dart';
import 'package:image_compare/features/image_compare/domain/repositories/image_compare_repository.dart';
import 'package:image_compare/features/image_compare/domain/services/image_compare_service.dart';
import 'package:image_compare/features/image_compare/infrastructure/exceptions/invalid_byte_data_exception.dart';
import 'package:image_compare/features/image_compare/infrastructure/repositories/image_compare_repository_impl.dart';
import 'package:image_compare/features/image_compare/presentation/constants/assets.dart';
import 'package:image_compare/features/image_compare/presentation/cubit/image_compare_cubit/utils/image_decoder.dart';
import 'package:mocktail/mocktail.dart';

class MockImageCompareService extends Mock implements ImageCompareService {}

class FakeImage extends Fake implements Image {}

void main() {
  late ImageCompareService imageCompareService;
  late ImageCompareRepository imageCompareRepository;

  setUp(() {
    TestWidgetsFlutterBinding.ensureInitialized();

    imageCompareService = MockImageCompareService();
    imageCompareRepository = ImageCompareRepositoryImpl(imageCompareService);

    registerFallbackValue(FakeImage());
  });

  const _kImageCompareResult = 50.0;
  const _kErrorMessage =
      'Invalid byte data format. Unable to decode the binary data.';

  group('ImageCompareRepository compare', () {
    test('should return a comparison value', () async {
      // arrange
      when(
        () => imageCompareService.compare(any(), any()),
      ).thenAnswer((_) => Future.value(_kImageCompareResult));
      // act
      final firstImage = await ImageDecoder.decodeFromAsset(Assets.firstImage);
      final secondImage =
          await ImageDecoder.decodeFromAsset(Assets.secondImage);

      final result = await imageCompareRepository.compare(
        firstImage: firstImage,
        secondImage: secondImage,
      );
      // assert
      result.mapOrNull(
        success: (state) => expect(state.data, _kImageCompareResult),
      );

      verify(
        () => imageCompareService.compare(any(), any()),
      ).called(1);
      verifyNoMoreInteractions(imageCompareService);
    });

    test('should return an error', () async {
      // arrange
      when(
        () => imageCompareService.compare(any(), any()),
      ).thenThrow(const InvalidByteDataException(_kErrorMessage));
      // act
      final firstImage = await ImageDecoder.decodeFromAsset(Assets.firstImage);
      final secondImage =
          await ImageDecoder.decodeFromAsset(Assets.secondImage);

      final result = await imageCompareRepository.compare(
        firstImage: firstImage,
        secondImage: secondImage,
      );
      // assert
      result.mapOrNull(
        error: (state) => expect(state.message, _kErrorMessage),
      );

      verify(
        () => imageCompareService.compare(any(), any()),
      ).called(1);
      verifyNoMoreInteractions(imageCompareService);
    });
  });
}
