import 'package:image_compare/features/image_compare/infrastructure/exceptions/gallery_permission_exception.dart';

/// An abstract class that defines a repository for handling permissions.
abstract class PermissionRepository {
  /// Checks whether the application has the required permissions to 
  /// access the gallery.
  ///
  /// This method should be called before attempting to access the gallery to 
  /// ensure that the application has the necessary permissions.
  /// 
  /// Throws a [GalleryPermissionException] if the required permission 
  /// is not granted.
  ///
  /// May return a [Future] that completes with no result when 
  /// the permission check is complete.
  Future<void> checkGalleryPermission();
}
