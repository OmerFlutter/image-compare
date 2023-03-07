import 'package:flutter_test/flutter_test.dart';
import 'package:image_compare/features/image_compare/domain/entities/image_data/image_data.dart';
import 'package:image_compare/features/image_compare/domain/enums/image_identifier.dart';
import 'package:image_compare/features/image_compare/presentation/constants/assets.dart';

void main() {
  final assetImage = ImageData.asset(
    assetName: Assets.firstImage,
    identifier: ImageIdentifier.firstImage,
  );

  final fileImage = ImageData.file(
    filePath: 'path/to/file/image.png',
    identifier: ImageIdentifier.secondImage,
  );

  test('assetImage should be a subclass of ImageData class', () {
    // assert
    expect(assetImage, isA<ImageData>());
  });

  test('fileImage should be a subclass of ImageData class', () {
    // assert
    expect(fileImage, isA<ImageData>());
  });
}
