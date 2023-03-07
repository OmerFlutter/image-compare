import 'package:image_compare/features/image_compare/infrastructure/exceptions/image_exception.dart';

/// Exception thrown when there is invalid byte data that cannot be decoded
/// into an image.
class InvalidByteDataException extends ImageException {
  /// Creates an [InvalidByteDataException] with the given error [message].
  const InvalidByteDataException(String message) : super(message);

  @override
  String toString() {
    return "InvalidByteDataException: $message";
  }
}
