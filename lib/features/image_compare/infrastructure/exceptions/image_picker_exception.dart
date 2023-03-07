import 'package:image_compare/features/image_compare/infrastructure/exceptions/image_exception.dart';

/// An exception thrown when there is an error while picking an image.
class ImagePickerException extends ImageException {
  /// Creates a new [ImagePickerException] with the given [message].
  const ImagePickerException(String message) : super(message);

  @override
  String toString() {
    return "ImagePickerException: $message";
  }
}
