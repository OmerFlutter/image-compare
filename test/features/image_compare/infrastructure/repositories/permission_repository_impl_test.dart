import 'package:flutter_test/flutter_test.dart';
import 'package:image_compare/features/image_compare/domain/enums/permission_type.dart';
import 'package:image_compare/features/image_compare/domain/repositories/permission_repository.dart';
import 'package:image_compare/features/image_compare/domain/services/permission_service.dart';
import 'package:image_compare/features/image_compare/infrastructure/exceptions/gallery_permission_exception.dart';
import 'package:image_compare/features/image_compare/infrastructure/repositories/permission_repository_impl.dart';
import 'package:mocktail/mocktail.dart';

class MockPermissionService extends Mock implements PermissionService {}

void main() {
  late PermissionService permissionService;
  late PermissionRepository permissionRepository;

  setUp(() {
    TestWidgetsFlutterBinding.ensureInitialized();

    permissionService = MockPermissionService();
    permissionRepository = PermissionRepositoryImpl(permissionService);

    registerFallbackValue(PermissionType.gallery);
  });

  group('PermissionRepository checkGalleryPermission', () {
    test(
      'should complete permission check if isPermissionGranted returns true',
      () async {
        // arrange
        when(() => permissionService.isPermissionGranted(any()))
            .thenAnswer((_) => Future.value(true));
        when(() => permissionService.requestPermission(any()))
            .thenAnswer((_) => Future.value(false));
        // act
        await permissionRepository.checkGalleryPermission();
        // assert
        verify(
          () => permissionService.isPermissionGranted(any()),
        ).called(1);
        verifyNever(
          () => permissionService.requestPermission(any()),
        );
        verifyNoMoreInteractions(permissionService);
      },
    );

    test(
      'should complete permission check if requestPermission returns true',
      () async {
        // arrange
        when(() => permissionService.isPermissionGranted(any()))
            .thenAnswer((_) => Future.value(false));
        when(() => permissionService.requestPermission(any()))
            .thenAnswer((_) => Future.value(true));
        // act
        await permissionRepository.checkGalleryPermission();
        // assert
        verify(
          () => permissionService.isPermissionGranted(any()),
        ).called(1);
        verify(
          () => permissionService.requestPermission(any()),
        ).called(1);
        verifyNoMoreInteractions(permissionService);
      },
    );

    test('should return an error if permission si not granted', () async {
      // arrange
      when(() => permissionService.isPermissionGranted(any()))
          .thenAnswer((_) => Future.value(false));
      when(() => permissionService.requestPermission(any()))
          .thenAnswer((_) => Future.value(false));
      // assert
      expect(
        () async => permissionRepository.checkGalleryPermission(),
        throwsA(isA<GalleryPermissionException>()),
      );
    });
  });
}
