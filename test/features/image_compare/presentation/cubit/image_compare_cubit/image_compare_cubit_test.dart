import 'dart:async';
import 'dart:ui' as ui;

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:image_compare/features/image_compare/domain/entities/image_data/image_data.dart';
import 'package:image_compare/features/image_compare/domain/enums/image_identifier.dart';
import 'package:image_compare/features/image_compare/domain/image_result.dart';
import 'package:image_compare/features/image_compare/domain/usecases/compare_images_usecase.dart';
import 'package:image_compare/features/image_compare/presentation/cubit/image_compare_cubit/image_compare_cubit.dart';
import 'package:image_compare/features/image_compare/presentation/cubit/image_mediator.dart';
import 'package:mocktail/mocktail.dart';

class MockCompareImagesUseCase extends Mock implements CompareImagesUseCase {}

class MockImageMediator extends Mock implements ImageMediator {
  @override
  Stream<ImageData> get firstImageDataStream => MockImageDataStream();

  @override
  Stream<ImageData> get secondImageDataStream => MockImageDataStream();
}

class MockImageDataStream extends Mock implements Stream<ImageData> {
  @override
  StreamSubscription<ImageData> listen(
    void Function(ImageData event)? onData, {
    Function? onError,
    void Function()? onDone,
    bool? cancelOnError,
  }) {
    return StreamSubscriptionMock();
  }
}

class StreamSubscriptionMock extends Mock
    implements StreamSubscription<ImageData> {
  @override
  void onData(void Function(ImageData data)? handleData) {
    return;
  }
}

class FakeImage extends Fake implements ui.Image {}

void main() {
  late CompareImagesUseCase compareImagesUseCase;
  late ImageMediator imageMediator;
  late ImageCompareCubit imageCompareCubit;

  setUp(() {
    WidgetsFlutterBinding.ensureInitialized();

    compareImagesUseCase = MockCompareImagesUseCase();
    imageMediator = MockImageMediator();
    imageCompareCubit = ImageCompareCubit(
      compareImagesUseCase: compareImagesUseCase,
      imageMediator: imageMediator,
    );

    registerFallbackValue(FakeImage());
    registerFallbackValue(ImageIdentifier.firstImage);
  });

  const errorMessage = 'Error message';
  const imageSuccessResult = ImageResult.success(43.0);
  const imageErrorResult = ImageResult<double>.error(errorMessage);

  group('ImageCubit', () {
    blocTest<ImageCompareCubit, ImageCompareState>(
      'emits ImageLoading and ImageLoaded when compareImages() is succeded',
      build: () => imageCompareCubit,
      setUp: () {
        when(
          () => compareImagesUseCase.execute(
            firstImage: any(named: 'firstImage'),
            secondImage: any(named: 'secondImage'),
          ),
        ).thenAnswer((_) => Future.value(imageSuccessResult));
      },
      act: (bloc) => bloc.compareImages(),
      expect: () => [isA<ImageCompareExecuting>(), isA<ImageCompareSucceded>()],
    );

    blocTest<ImageCompareCubit, ImageCompareState>(
      'emits ImageLoading and ImageError when compareImages() is failed',
      build: () => imageCompareCubit,
      setUp: () {
        when(
          () => compareImagesUseCase.execute(
            firstImage: any(named: 'firstImage'),
            secondImage: any(named: 'secondImage'),
          ),
        ).thenAnswer((_) => Future.value(imageErrorResult));
      },
      act: (bloc) => bloc.compareImages(),
      expect: () => [isA<ImageCompareExecuting>(), isA<ImageCompareError>()],
    );
  });
}
