import 'package:freezed_annotation/freezed_annotation.dart';

part 'image_result.freezed.dart';

/// A generic [ImageResult] class that represents either successful 
/// data or an error.
@freezed
class ImageResult<T> with _$ImageResult<T> {
  /// A constructor that creates a successful result with [data].
  const factory ImageResult.success(T data) = ImageResultSuccess<T>;

  /// A constructor that creates an error result with an associated [message].
  const factory ImageResult.error(String message) = ImageResultError<T>;
}
