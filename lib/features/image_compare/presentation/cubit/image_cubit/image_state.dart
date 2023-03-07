part of 'image_cubit.dart';

/// A class that represents the various states an image can be in.
@freezed
class ImageState with _$ImageState {
  /// Represents the initial state of an image. It contains the [image]
  /// that was initially loaded.
  const factory ImageState.initial(ImageData image) = ImageInitial;

  /// Represents the loading state of an image.
  const factory ImageState.loading() = ImageLoading;

  /// Represents the state of an image after it has been successfully loaded. 
  /// It contains the [file] that was loaded.
  const factory ImageState.imageLoaded(ImageData file) = ImageLoaded;

  /// Represents the error state of an image. It contains a [fallback] image 
  /// that can be displayed as a placeholder, and an error [message] 
  /// that describes the issue.
  const factory ImageState.error({
    required ImageData fallback,
    required String message,
  }) = ImageError;
}
