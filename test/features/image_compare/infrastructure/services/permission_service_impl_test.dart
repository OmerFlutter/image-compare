import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:image_compare/features/image_compare/domain/enums/permission_type.dart';
import 'package:image_compare/features/image_compare/domain/services/permission_service.dart';
import 'package:image_compare/features/image_compare/infrastructure/services/permission_service_impl.dart';
import 'package:mocktail/mocktail.dart';
import 'package:permission_handler/permission_handler.dart';

void main() {
  late PermissionService permissionService;

  setUp(() {
    TestWidgetsFlutterBinding.ensureInitialized();

    permissionService = PermissionServiceImpl();

    registerFallbackValue(PermissionType.gallery);

    const MethodChannel('flutter.baseflow.com/permissions/methods')
        .setMockMethodCallHandler((MethodCall methodCall) async {
      switch (methodCall.method) {
        case 'requestPermissions':
          return <int, int>{
            Permission.storage.value: PermissionStatus.granted.index,
          };
        case 'checkPermissionStatus':
          return PermissionStatus.granted.index;
      }
    });
  });

  group(
    'PermissionService',
    () {
      test('isPermissionGranted should successfuly perform permission check',
          () async {
        // act
        final result =
            await permissionService.isPermissionGranted(PermissionType.gallery);
        // assert
        expect(result, true);
      });

      test('requestPermission hould successfuly request the permission',
          () async {
        // act
        final result =
            await permissionService.requestPermission(PermissionType.gallery);
        // assert
        expect(result, true);
      });
    },
  );
}
