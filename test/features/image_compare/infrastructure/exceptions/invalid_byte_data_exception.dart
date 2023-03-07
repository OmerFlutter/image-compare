import 'package:flutter_test/flutter_test.dart';
import 'package:image_compare/features/image_compare/infrastructure/exceptions/invalid_byte_data_exception.dart';

void main() {
  group('InvalidByteDataException', () {
    test('should throw an exception with the correct message', () {
      const message = 'InvalidByteDataException message';

      try {
        throw const InvalidByteDataException(message);
      } on InvalidByteDataException catch (e) {
        expect(e.message, equals(message));
      }
    });
  });
}
