import 'package:flutter_test/flutter_test.dart';
import 'package:image_compare/features/image_compare/infrastructure/exceptions/image_picker_exception.dart';

void main() {
  group('ImagePickerException', () {
    test('should throw an exception with the correct message', () {
      const message = 'ImagePickerException message';

      try {
        throw const ImagePickerException(message);
      } on ImagePickerException catch (e) {
        expect(e.message, equals(message));
      }
    });
  });
}
