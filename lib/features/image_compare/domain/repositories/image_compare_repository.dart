import 'dart:ui';

import 'package:image_compare/features/image_compare/domain/image_result.dart';

/// An abstract class that defines the contract for an image
/// comparison repository.
///
/// This repository provides a method to compare two images and returns
/// an [ImageResult] that indicates the result of the comparison operation.
abstract class ImageCompareRepository {
  /// Compares two images and returns an [ImageResult] that indicates
  /// the result of the comparison operation.
  ///
  /// The [firstImage] and [secondImage] parameters are the images to
  /// be compared.
  ///
  /// Returns a [Future] that completes with the [ImageResult] object that
  /// represents the result of the comparison operation. If the comparison
  /// operation was successful, the [ImageResult] object contains the comparison
  /// result. If an error occurred during the comparison operation, the
  /// [ImageResult] object contains an error message.
  Future<ImageResult<double>> compare({
    required Image firstImage,
    required Image secondImage,
  });
}
