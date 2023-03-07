import 'dart:io';
import 'dart:ui' as ui;

import 'package:flutter/services.dart';

/// A class that decodes images from files and assets into [ui.Image] objects.
class ImageDecoder {
  /// Decodes an image from the specified file into a [ui.Image] object.
  ///
  /// Returns a [Future] that completes with the decoded [ui.Image] object.
  ///
  /// Throws a [FileSystemException] if the file cannot be read
  ///
  /// Parameters:
  ///
  /// - `file`: A [File] object representing the image file to decode.
  ///
  /// Returns a [Future] that completes with the decoded [ui.Image] object.
  static Future<ui.Image> decodeFromFile(File file) async {
    final buffer = await file.readAsBytes();

    return _decodeImage(buffer);
  }

  /// Decodes an image from the specified asset into a [ui.Image] object.
  ///
  /// Returns a [Future] that completes with the decoded [ui.Image] object.
  ///
  /// Parameters:
  ///
  /// - `imageAssetPath`: A [String] representing the path to the image asset 
  ///   to decode.
  ///
  /// Returns a [Future] that completes with the decoded [ui.Image] object.
  static Future<ui.Image> decodeFromAsset(String imageAssetPath) async {
    final asset = await rootBundle.load(imageAssetPath);

    return _decodeImage(asset.buffer.asUint8List());
  }

  static Future<ui.Image> _decodeImage(Uint8List list) async {
    final codec = await ui.instantiateImageCodec(
      list,
      targetWidth: 100,
      targetHeight: 100,
    );
    final image = (await codec.getNextFrame()).image;

    return image;
  }
}
