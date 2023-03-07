import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:image_compare/features/image_compare/domain/entities/image_data/image_data.dart';
import 'package:image_compare/features/image_compare/domain/enums/image_identifier.dart';
import 'package:image_compare/features/image_compare/domain/image_result.dart';
import 'package:image_compare/features/image_compare/domain/usecases/pick_image_usecase.dart';
import 'package:image_compare/features/image_compare/presentation/constants/assets.dart';
import 'package:image_compare/features/image_compare/presentation/cubit/image_cubit/image_cubit.dart';
import 'package:image_compare/features/image_compare/presentation/cubit/image_mediator.dart';
import 'package:mocktail/mocktail.dart';

class MockPickImageUseCase extends Mock implements PickImageUseCase {}

class MockImageMediator extends Mock implements ImageMediator {}

class FirstImageDataStreamMock extends Mock implements Stream<ImageData> {}

void main() {
  late PickImageUseCase pickImageUseCase;
  late ImageMediator imageMediator;
  late ImageCubitParams params;
  late ImageCubit imageCubit;

  setUp(() {
    pickImageUseCase = MockPickImageUseCase();
    imageMediator = MockImageMediator();
    params = ImageCubitParams(
      initialImageAsset: Assets.firstImage,
      identifier: ImageIdentifier.firstImage,
    );
    imageCubit = ImageCubit(
      pickImageUseCase: pickImageUseCase,
      imageMediator: imageMediator,
      params: params,
    );

    registerFallbackValue(ImageIdentifier.firstImage);
  });

  final imageData = ImageData.file(
    filePath: Assets.firstImage,
    identifier: ImageIdentifier.firstImage,
  );
  const errorMessage = 'Error message';
  final imageSuccessResult = ImageResult<ImageData>.success(imageData);
  const imageErrorResult = ImageResult<ImageData>.error(errorMessage);

  group('ImageCubit', () {
    blocTest<ImageCubit, ImageState>(
      'emits ImageLoading and ImageLoaded when pickImage() is succeded',
      build: () => imageCubit,
      setUp: () {
        when(() => pickImageUseCase.execute(any()))
            .thenAnswer((_) => Future.value(imageSuccessResult));
        when(() => imageMediator.firstImageDataStream)
            .thenAnswer((_) => FirstImageDataStreamMock());
      },
      act: (bloc) => bloc.pickImage(),
      expect: () => [isA<ImageLoading>(), isA<ImageLoaded>()],
    );

    blocTest<ImageCubit, ImageState>(
      'emits ImageLoading and ImageError when pickImage() is failed',
      build: () => imageCubit,
      setUp: () {
        when(() => pickImageUseCase.execute(any()))
            .thenAnswer((_) => Future.value(imageErrorResult));
        when(() => imageMediator.firstImageDataStream)
            .thenAnswer((_) => FirstImageDataStreamMock());
      },
      act: (bloc) => bloc.pickImage(),
      expect: () => [isA<ImageLoading>(), isA<ImageError>()],
    );
  });
}
