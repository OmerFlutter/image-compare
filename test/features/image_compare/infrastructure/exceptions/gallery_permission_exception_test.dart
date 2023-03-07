import 'package:flutter_test/flutter_test.dart';
import 'package:image_compare/features/image_compare/infrastructure/exceptions/gallery_permission_exception.dart';

void main() {
  group('GalleryPermissionException', () {
    test('should throw an exception with the correct message', () {
      const message = 'GalleryPermissionException message';

      try {
        throw const GalleryPermissionException(message);
      } on GalleryPermissionException catch (e) {
        expect(e.message, equals(message));
      }
    });
  });
}
