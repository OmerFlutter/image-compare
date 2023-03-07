import 'dart:async';

import 'package:image_compare/features/image_compare/domain/entities/image_data/image_data.dart';
import 'package:image_compare/features/image_compare/domain/enums/image_identifier.dart';

/// A class that mediates the exchange of image data between the 
/// `ImageCubit` and the `ImageCompareCubit`. It exposes two streams 
/// ([firstImageDataStream] and [secondImageDataStream]) that can be listened to
/// in order to receive [ImageData] objects.
class ImageMediator {
  final _firstImageDataController = StreamController<ImageData>();
  final _secondImageDataController = StreamController<ImageData>();

  /// Returns a [Stream] of [ImageData] from the first image data controller.
  Stream<ImageData> get firstImageDataStream =>
      _firstImageDataController.stream;

  /// Returns a [Stream] of [ImageData] from the second image data controller.
  Stream<ImageData> get secondImageDataStream =>
      _secondImageDataController.stream;

  /// Adds the [imageData] to the appropriate stream based 
  /// on its [ImageIdentifier].
  void addImageData(ImageData imageData) {
    if (imageData.identifier == ImageIdentifier.firstImage) {
      _firstImageDataController.add(imageData);
    }

    if (imageData.identifier == ImageIdentifier.secondImage) {
      _secondImageDataController.add(imageData);
    }
  }

  /// Disposes the [StreamController] instances used to manage 
  /// the [ImageData] streams.
  void dispose() {
    _firstImageDataController.close();
    _secondImageDataController.close();
  }
}
