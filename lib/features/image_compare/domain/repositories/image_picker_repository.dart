import 'package:image_compare/features/image_compare/domain/entities/image_data/image_data.dart';
import 'package:image_compare/features/image_compare/domain/enums/image_identifier.dart';
import 'package:image_compare/features/image_compare/domain/image_result.dart';

/// An abstract class for picking images from the gallery.
abstract class ImagePickerRepository {
  /// Prompts the user to pick an image from the gallery, 
  /// and returns the selected image as an [ImageResult] object.
  ///
  /// The [identifier] parameter is used to identify the image number 
  /// and should be an instance of the [ImageIdentifier] enum.
  ///
  /// Returns a [Future] that completes with the [ImageResult] object that 
  /// represents the result of the image picking operation. If the image picking
  /// operation was successful, the [ImageResult] object contains the 
  /// [ImageData] object. If an error occurred during the image picking 
  /// operation, the [ImageResult] object contains an error message.
  Future<ImageResult<ImageData>> pickImage(ImageIdentifier identifier);
}
