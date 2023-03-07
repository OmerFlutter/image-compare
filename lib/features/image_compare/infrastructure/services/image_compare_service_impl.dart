import 'dart:math' as math;
import 'dart:typed_data';
import 'dart:ui';

import 'package:image_compare/features/image_compare/domain/services/image_compare_service.dart';
import 'package:image_compare/features/image_compare/infrastructure/exceptions/invalid_byte_data_exception.dart';

const _kAlphaChannelBytes = 4;
const _kMultiplier = 2;
const _kSsimPercentageScalingFactor = 50.0;
const _kFractionDigits = 2;

/// A class that implements the [ImageCompareService] abstract class and uses
/// the Structural Similarity Index (SSIM) algorithm to compare images.
class ImageCompareServiceImpl implements ImageCompareService {
  /// Calculates the structural similarity index (SSIM) between two
  /// input images.
  ///
  /// The SSIM index is a measure of the similarity between two images.
  /// It ranges from -1 to 1, where a value of 1 indicates that the images
  /// are identical and a value of -1 indicates that the images are
  /// completely dissimilar.
  ///
  /// The SSIM index is calculated using the mean luminance, variance, and
  /// covariance of the input images, as well as two constants, c1 and c2. The
  /// constants are used to prevent division by zero and stabilize the division
  /// operation.
  ///
  /// [firstImage] and [secondImage] are the two images to compare.
  ///
  /// Returns the SSIM index as a double. The index ranges from -1 to 1 and is
  /// scaled by ssim percentage scaling factor.
  @override
  Future<double> compare(Image firstImage, Image secondImage) async {
    final firstImageMeanLuminance = await _calculateMeanLuminance(firstImage);
    final secondImageMeanLuminance = await _calculateMeanLuminance(secondImage);

    final firstImageVariance = await _calculateVariance(
      image: firstImage,
      meanLuminance: firstImageMeanLuminance,
    );
    final secondImageVariance = await _calculateVariance(
      image: secondImage,
      meanLuminance: secondImageMeanLuminance,
    );

    final covar = await _calculateCovariance(
      firstImage: firstImage,
      secondImage: secondImage,
      firstImageMeanLuminance: firstImageMeanLuminance,
      secondImageMeanLuminance: secondImageMeanLuminance,
    );

    final c1 = math.pow(0.01 * 255, 2);
    final c2 = math.pow(0.03 * 255, 2);

    final ssimIndex =
        (2 * firstImageMeanLuminance * secondImageMeanLuminance + c1) *
            (2 * covar + c2) /
            ((math.pow(firstImageMeanLuminance, 2) +
                    math.pow(secondImageMeanLuminance, 2) +
                    c1) *
                (firstImageVariance + secondImageVariance + c2));

    return double.parse(
      ((ssimIndex + 1) * _kSsimPercentageScalingFactor)
          .toStringAsFixed(_kFractionDigits),
    );
  }

  Future<double> _calculateMeanLuminance(Image image) async {
    final imageData = await _getImageByteData(image);

    double sum = 0.0;
    for (int i = 0; i < imageData.lengthInBytes; i += _kAlphaChannelBytes) {
      final pixel = imageData.getUint32(i);
      sum += _getPixelLuminance(pixel);
    }
    final mean = sum / (image.width * image.height);

    return mean;
  }

  Future<double> _calculateVariance({
    required Image image,
    required double meanLuminance,
  }) async {
    final imageData = await _getImageByteData(image);

    double sum = 0.0;
    for (int i = 0; i < imageData.lengthInBytes; i += _kAlphaChannelBytes) {
      final pixel = imageData.getUint32(i);
      final luminance = _getPixelLuminance(pixel);
      sum += math.pow(luminance - meanLuminance, _kMultiplier);
    }
    final variance = sum / (image.width * image.height - 1);

    return variance;
  }

  Future<double> _calculateCovariance({
    required Image firstImage,
    required Image secondImage,
    required double firstImageMeanLuminance,
    required double secondImageMeanLuminance,
  }) async {
    final imageData1 = await _getImageByteData(firstImage);
    final imageData2 = await _getImageByteData(secondImage);

    double sum = 0.0;
    for (int i = 0; i < imageData1.lengthInBytes; i += _kAlphaChannelBytes) {
      final firstImagePixel = imageData1.getUint32(i);
      final firstLuminance = _getPixelLuminance(firstImagePixel);

      final secondImagePixel = imageData2.getUint32(i);
      final secondLuminance = _getPixelLuminance(secondImagePixel);

      sum += (firstLuminance - firstImageMeanLuminance) *
          (secondLuminance - secondImageMeanLuminance);
    }
    final covariance = sum / (firstImage.width * firstImage.height - 1);

    return covariance;
  }

  Future<ByteData> _getImageByteData(Image image) async {
    final result = await image.toByteData();

    if (result == null) {
      throw const InvalidByteDataException(
        'Invalid byte data format. Unable to decode the binary data.',
      );
    }

    return result;
  }

  double _getPixelLuminance(int pixel) {
    final r = pixel >> 16 & 0xff;
    final g = pixel >> 8 & 0xff;
    final b = pixel & 0xff;
    final luminance = 0.2126 * r + 0.7152 * g + 0.0722 * b;

    return luminance;
  }
}
