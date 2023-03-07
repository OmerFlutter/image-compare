part of 'image_compare_cubit.dart';

@freezed

/// The class that represents a state of image comparison.
class ImageCompareState with _$ImageCompareState {
  /// The initial state of image comparison.
  const factory ImageCompareState.initial() = ImageCompareInitial;

  /// The state of image comparison when the comparison is being executed.
  const factory ImageCompareState.executing() = ImageCompareExecuting;

  /// The state of image comparison when the comparison has succeeded 
  /// and the [result] is available.
  const factory ImageCompareState.succeded(double result) =
      ImageCompareSucceded;

  /// The state of image comparison when an error has occurred during
  /// comparison and the error [message] is available.
  const factory ImageCompareState.error(String message) = ImageCompareError;
}
