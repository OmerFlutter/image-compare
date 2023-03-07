import 'package:image_compare/features/image_compare/domain/enums/permission_type.dart';
import 'package:image_compare/features/image_compare/domain/repositories/permission_repository.dart';
import 'package:image_compare/features/image_compare/domain/services/permission_service.dart';
import 'package:image_compare/features/image_compare/infrastructure/exceptions/gallery_permission_exception.dart';

/// A repository implementation that checks whether the application has the
/// required permissions.
class PermissionRepositoryImpl extends PermissionRepository {
  /// Thr service used for checking permissions.
  final PermissionService permissionService;

  /// Creates a new instance of [PermissionRepositoryImpl]
  /// with the specified [permissionService].
  PermissionRepositoryImpl(this.permissionService);

  @override
  Future<void> checkGalleryPermission() async {
    final isPermissionGranted =
        await permissionService.isPermissionGranted(PermissionType.gallery);

    if (!isPermissionGranted) {
      final isRequestPermissionGrented =
          await permissionService.requestPermission(PermissionType.gallery);
      if (!isRequestPermissionGrented) {
        throw const GalleryPermissionException(
          'Unable to access gallery. Required permission not granted. '
          'Fallback will be used',
        );
      }
    }
  }
}
