import 'package:flutter_test/flutter_test.dart';
import 'package:image_compare/features/image_compare/domain/entities/image_data/image_data.dart';
import 'package:image_compare/features/image_compare/domain/enums/image_identifier.dart';
import 'package:image_compare/features/image_compare/domain/repositories/image_picker_repository.dart';
import 'package:image_compare/features/image_compare/domain/repositories/permission_repository.dart';
import 'package:image_compare/features/image_compare/infrastructure/exceptions/gallery_permission_exception.dart';
import 'package:image_compare/features/image_compare/infrastructure/exceptions/image_picker_exception.dart';
import 'package:image_compare/features/image_compare/infrastructure/repositories/image_picker_repository_impl.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mocktail/mocktail.dart';

class MockPermissionRepository extends Mock implements PermissionRepository {}

class MockImagePicker extends Mock implements ImagePicker {}

void main() {
  late PermissionRepository permissionRepository;
  late ImagePicker imagePickerService;
  late ImagePickerRepository imagePickerRepository;

  setUp(() {
    TestWidgetsFlutterBinding.ensureInitialized();

    permissionRepository = MockPermissionRepository();
    imagePickerService = MockImagePicker();
    imagePickerRepository = ImagePickerRepositoryImpl(
      permissionRepository: permissionRepository,
      imagePickerService: imagePickerService,
    );

    registerFallbackValue(ImageIdentifier.firstImage);
    registerFallbackValue(ImageSource.gallery);
  });

  final _kPickedImage = XFile('path/to/file/image.png');
  const _kGalleryErrorMessage =
      'Unable to access gallery. Required permission not granted. '
      'Fallback will be used';

  const _kPickImageErrorMessage =
      'The error occured during retrieving the image';

  group('ImagePickerRepository pickImage', () {
    test('should return a comparison value', () async {
      // arrange
      when(() => permissionRepository.checkGalleryPermission())
          .thenAnswer((_) => Future.value());
      when(
        () => imagePickerService.pickImage(
          source: any(named: 'source'),
          maxWidth: any(named: 'maxWidth'),
          maxHeight: any(named: 'maxHeight'),
        ),
      ).thenAnswer((_) => Future.value(_kPickedImage));
      // act
      final result =
          await imagePickerRepository.pickImage(ImageIdentifier.firstImage);
      // assert
      result.mapOrNull(
        success: (state) => expect(
          state.data,
          ImageData.file(
            filePath: _kPickedImage.path,
            identifier: ImageIdentifier.firstImage,
          ),
        ),
      );

      verify(
        () => imagePickerService.pickImage(
          source: any(named: 'source'),
          maxWidth: any(named: 'maxWidth'),
          maxHeight: any(named: 'maxHeight'),
        ),
      ).called(1);
      verifyNoMoreInteractions(imagePickerService);
    });

    test('should return an error while checking permission', () async {
      // arrange
      when(() => permissionRepository.checkGalleryPermission())
          .thenThrow(const GalleryPermissionException(_kGalleryErrorMessage));
      when(
        () => imagePickerService.pickImage(
          source: any(named: 'source'),
          maxWidth: any(named: 'maxWidth'),
          maxHeight: any(named: 'maxHeight'),
        ),
      ).thenAnswer((_) => Future.value(_kPickedImage));
      // act
      final result =
          await imagePickerRepository.pickImage(ImageIdentifier.firstImage);
      // assert
      result.mapOrNull(
        error: (state) => expect(
          state.message,
          _kGalleryErrorMessage,
        ),
      );

      verifyNever(
        () => imagePickerService.pickImage(
          source: any(named: 'source'),
          maxWidth: any(named: 'maxWidth'),
          maxHeight: any(named: 'maxHeight'),
        ),
      );
    });

    test('should return an error while picking an image', () async {
      // arrange
      when(() => permissionRepository.checkGalleryPermission())
          .thenAnswer((_) => Future.value());
      when(
        () => imagePickerService.pickImage(
          source: any(named: 'source'),
          maxWidth: any(named: 'maxWidth'),
          maxHeight: any(named: 'maxHeight'),
        ),
      ).thenThrow(const ImagePickerException(_kPickImageErrorMessage));
      // act
      final result =
          await imagePickerRepository.pickImage(ImageIdentifier.firstImage);
      // assert
      result.mapOrNull(
        error: (state) => expect(
          state.message,
          _kPickImageErrorMessage,
        ),
      );

      verify(
        () => imagePickerService.pickImage(
          source: any(named: 'source'),
          maxWidth: any(named: 'maxWidth'),
          maxHeight: any(named: 'maxHeight'),
        ),
      ).called(1);
      verifyNoMoreInteractions(imagePickerService);
    });
  });
}
