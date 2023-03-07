import 'package:image_compare/features/image_compare/domain/enums/permission_type.dart';

/// An abstract class for handling permissions.
abstract class PermissionService {
  /// Requests permission for the specified [permission].
  ///
  /// Returns a [Future] that completes with a boolean value indicating
  /// whether the permission was granted or not.
  Future<bool> requestPermission(PermissionType permission);

  /// Checks if the specified [permission] is granted.
  ///
  /// Returns a [Future] that completes with a boolean value indicating
  /// whether the permission is granted or not.
  Future<bool> isPermissionGranted(PermissionType permission);
}
