import 'dart:ui';

/// An abstract class that provides a method to compare two images.
abstract class ImageCompareService {
  /// Compares two images and returns a double value indicating 
  /// their similarity.
  ///
  /// The [firstImage] and [secondImage] parameters are the two 
  /// [Image] objects to compare.
  ///
  /// Returns a [Future] that completes with a [double] similarity score.
  Future<double> compare(Image firstImage, Image secondImage);
}
