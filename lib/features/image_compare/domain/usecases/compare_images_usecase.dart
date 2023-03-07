import 'dart:ui';

import 'package:image_compare/features/image_compare/domain/image_result.dart';
import 'package:image_compare/features/image_compare/domain/repositories/image_compare_repository.dart';

/// A use case for comparing two images
class CompareImagesUseCase {
  /// The repository used to perform the image comparison
  final ImageCompareRepository imageCompareRepository;

  /// Constructor for creating a [CompareImagesUseCase] instance
  const CompareImagesUseCase(this.imageCompareRepository);

  /// Compares two images and returns a [ImageResult] with the similarity score
  ///
  /// [firstImage] and [secondImage] are the images to compare
  ///
  /// Returns a [ImageResult] with the similarity score between the two images
  Future<ImageResult<double>> execute({
    required Image firstImage,
    required Image secondImage,
  }) {
    return imageCompareRepository.compare(
      firstImage: firstImage,
      secondImage: secondImage,
    );
  }
}
