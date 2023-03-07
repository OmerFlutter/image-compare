import 'package:flutter_test/flutter_test.dart';
import 'package:image_compare/features/image_compare/infrastructure/exceptions/image_exception.dart';

void main() {
  group('ImageException', () {
    test('should throw an exception with the correct message', () {
      const message = 'ImageException message';

      try {
        throw const ImageException(message);
      } on ImageException catch (e) {
        expect(e.message, equals(message));
      }
    });
  });
}
