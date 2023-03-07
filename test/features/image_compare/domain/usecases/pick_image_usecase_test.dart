import 'package:flutter_test/flutter_test.dart';
import 'package:image_compare/features/image_compare/domain/entities/image_data/image_data.dart';
import 'package:image_compare/features/image_compare/domain/enums/image_identifier.dart';
import 'package:image_compare/features/image_compare/domain/image_result.dart';
import 'package:image_compare/features/image_compare/domain/repositories/image_picker_repository.dart';
import 'package:image_compare/features/image_compare/domain/usecases/pick_image_usecase.dart';
import 'package:image_compare/features/image_compare/presentation/constants/assets.dart';
import 'package:mocktail/mocktail.dart';

class MockImagePickerRepository extends Mock implements ImagePickerRepository {}

void main() {
  late ImagePickerRepository imagePickerRepository;
  late PickImageUseCase pickImageUseCase;

  setUp(() {
    TestWidgetsFlutterBinding.ensureInitialized();

    imagePickerRepository = MockImagePickerRepository();
    pickImageUseCase = PickImageUseCase(imagePickerRepository);

    registerFallbackValue(ImageIdentifier.firstImage);
  });

  final _kPickImageResult = ImageResult.success(
    ImageData.asset(
      assetName: Assets.firstImage,
      identifier: ImageIdentifier.firstImage,
    ),
  );

  group('PickImageUseCase execute', () {
    test('should return image from gallery', () async {
      // arrange
      when(
        () => imagePickerRepository.pickImage(any()),
      ).thenAnswer((_) => Future.value(_kPickImageResult));
      // act
      final result = await pickImageUseCase.execute(ImageIdentifier.firstImage);
      // assert
      expect(result, _kPickImageResult);
      verify(
        () => imagePickerRepository.pickImage(any()),
      ).called(1);
      verifyNoMoreInteractions(imagePickerRepository);
    });
  });
}
