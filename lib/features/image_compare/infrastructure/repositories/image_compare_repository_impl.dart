import 'dart:ui';

import 'package:image_compare/features/image_compare/domain/image_result.dart';
import 'package:image_compare/features/image_compare/domain/repositories/image_compare_repository.dart';
import 'package:image_compare/features/image_compare/domain/services/image_compare_service.dart';
import 'package:image_compare/features/image_compare/infrastructure/exceptions/invalid_byte_data_exception.dart';

/// An implementation of the [ImageCompareRepository] abstract class.
class ImageCompareRepositoryImpl implements ImageCompareRepository {
  /// The service used to compare images.
  final ImageCompareService imageCompareService;

  /// Creates a new instance of [ImageCompareRepositoryImpl]
  /// with the specified [imageCompareService].
  ImageCompareRepositoryImpl(this.imageCompareService);

  @override
  Future<ImageResult<double>> compare({
    required Image firstImage,
    required Image secondImage,
  }) async {
    try {
      final result = await imageCompareService.compare(firstImage, secondImage);

      return ImageResult.success(result);
    } on InvalidByteDataException catch (e) {
      return ImageResult.error(e.message);
    } catch (e) {
      return ImageResult.error(e.toString());
    }
  }
}
