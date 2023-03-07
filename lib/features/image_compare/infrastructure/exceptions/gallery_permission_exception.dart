import 'package:image_compare/features/image_compare/infrastructure/exceptions/image_exception.dart';

/// Exception thrown when the app does not have the required permissions 
/// to access the gallery.
class GalleryPermissionException extends ImageException {
  /// Creates a new instance of [GalleryPermissionException] with the given 
  /// error [message].
  const GalleryPermissionException(String message) : super(message);

  @override
  String toString() {
    return "GalleryPermissionException: $message";
  }
}
