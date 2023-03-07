import 'package:image_compare/features/image_compare/domain/entities/image_data/image_data.dart';
import 'package:image_compare/features/image_compare/domain/enums/image_identifier.dart';
import 'package:image_compare/features/image_compare/domain/image_result.dart';
import 'package:image_compare/features/image_compare/domain/repositories/image_picker_repository.dart';
import 'package:image_compare/features/image_compare/domain/repositories/permission_repository.dart';
import 'package:image_compare/features/image_compare/infrastructure/exceptions/image_exception.dart';
import 'package:image_compare/features/image_compare/infrastructure/exceptions/image_picker_exception.dart';
import 'package:image_picker/image_picker.dart';

/// An implementation of the [ImagePickerRepository] abstract class
/// for picking images from the gallery.
class ImagePickerRepositoryImpl implements ImagePickerRepository {
  /// Repository used for handling permissions.
  final PermissionRepository permissionRepository;

  /// The service used to pick images.
  final ImagePicker imagePickerService;

  /// Creates a new instance of [ImagePickerRepositoryImpl]
  /// with the specified [imagePickerService].
  ImagePickerRepositoryImpl({
    required this.permissionRepository,
    required this.imagePickerService,
  });

  @override
  Future<ImageResult<ImageData>> pickImage(ImageIdentifier identifier) async {
    try {
      await permissionRepository.checkGalleryPermission();

      final pickedFile = await imagePickerService.pickImage(
        source: ImageSource.gallery,
        maxHeight: 600.0,
        maxWidth: 600.0,
      );

      if (pickedFile == null) {
        throw const ImagePickerException(
          'The error occured during retrieving the image',
        );
      }

      final result = ImageData.file(
        filePath: pickedFile.path,
        identifier: identifier,
      );

      return ImageResult.success(result);
    } on ImageException catch (e) {
      return ImageResult.error(e.message);
    } catch (e) {
      return ImageResult.error(e.toString());
    }
  }
}
