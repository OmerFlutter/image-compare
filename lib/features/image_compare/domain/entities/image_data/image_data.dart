import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:image_compare/features/image_compare/domain/enums/image_identifier.dart';

part 'image_data.freezed.dart';

/// Represents image data with a file path or asset name and an identifier.
@freezed
class ImageData with _$ImageData {
  const factory ImageData._({
    @Default('') String filePath,
    @Default('') String assetName,
    @Default(ImageIdentifier.none) ImageIdentifier identifier,
  }) = _ImageData;

  /// Creates a new instance of [ImageData] with
  /// the specified file path and identifier.
  factory ImageData.file({
    required String filePath,
    required ImageIdentifier identifier,
  }) {
    return ImageData._(filePath: filePath, identifier: identifier);
  }

  /// Creates a new instance of [ImageData] with
  /// the specified asset name and identifier.
  factory ImageData.asset({
    required String assetName,
    required ImageIdentifier identifier,
  }) {
    return ImageData._(assetName: assetName, identifier: identifier);
  }
}
