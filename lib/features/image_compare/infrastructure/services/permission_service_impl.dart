import 'package:image_compare/features/image_compare/domain/enums/permission_type.dart';
import 'package:image_compare/features/image_compare/domain/services/permission_service.dart';
import 'package:permission_handler/permission_handler.dart';

/// A concrete implementation of the [PermissionService] abstract class.
///
/// Uses the [Permission] package to handle permissions.
class PermissionServiceImpl extends PermissionService {
  @override
  Future<bool> requestPermission(PermissionType permission) async {
    switch (permission) {
      case PermissionType.gallery:
        final status = await Permission.storage.request();

        return status.isGranted;
    }
  }

  @override
  Future<bool> isPermissionGranted(PermissionType permission) async {
    switch (permission) {
      case PermissionType.gallery:
        final status = await Permission.storage.status;

        return status.isGranted;
    }
  }
}
