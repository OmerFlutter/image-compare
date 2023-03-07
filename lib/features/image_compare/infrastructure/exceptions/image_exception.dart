/// An exception that is thrown when an error occurs during 
/// image-related operations.
class ImageException implements Exception {
  /// The error message associated with the exception.
  final String message;

  /// Creates a new instance of the [ImageException] class with 
  /// the specified [message].
  const ImageException(this.message) : super();

  @override
  String toString() {
    return "ImageException: $message";
  }
}
