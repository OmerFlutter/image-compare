import 'package:get_it/get_it.dart';
import 'package:image_compare/features/image_compare/domain/repositories/image_compare_repository.dart';
import 'package:image_compare/features/image_compare/domain/repositories/image_picker_repository.dart';
import 'package:image_compare/features/image_compare/domain/repositories/permission_repository.dart';
import 'package:image_compare/features/image_compare/domain/services/image_compare_service.dart';
import 'package:image_compare/features/image_compare/domain/services/permission_service.dart';
import 'package:image_compare/features/image_compare/domain/usecases/compare_images_usecase.dart';
import 'package:image_compare/features/image_compare/domain/usecases/pick_image_usecase.dart';
import 'package:image_compare/features/image_compare/infrastructure/repositories/image_compare_repository_impl.dart';
import 'package:image_compare/features/image_compare/infrastructure/repositories/image_picker_repository_impl.dart';
import 'package:image_compare/features/image_compare/infrastructure/repositories/permission_repository_impl.dart';
import 'package:image_compare/features/image_compare/infrastructure/services/image_compare_service_impl.dart';
import 'package:image_compare/features/image_compare/infrastructure/services/permission_service_impl.dart';
import 'package:image_compare/features/image_compare/presentation/cubit/image_compare_cubit/image_compare_cubit.dart';
import 'package:image_compare/features/image_compare/presentation/cubit/image_cubit/image_cubit.dart';
import 'package:image_compare/features/image_compare/presentation/cubit/image_mediator.dart';
import 'package:image_picker/image_picker.dart';

/// A singleton instance of [GetIt] that manages dependency injection
/// for the app.
final getIt = GetIt.instance;

/// Initializes the app by registering all necessary dependencies with [GetIt].
void init() {
  _registerServices();
  _registerRepositories();
  _registerUseCases();
  _registerCubits();
}

void _registerServices() {
  getIt
    ..registerLazySingleton<PermissionService>(() => PermissionServiceImpl())
    ..registerLazySingleton<ImageCompareService>(
      () => ImageCompareServiceImpl(),
    )
    ..registerLazySingleton(() => ImagePicker());
}

void _registerRepositories() {
  getIt
    ..registerLazySingleton<PermissionRepository>(
      () => PermissionRepositoryImpl(getIt()),
    )
    ..registerLazySingleton<ImageCompareRepository>(
      () => ImageCompareRepositoryImpl(getIt()),
    )
    ..registerLazySingleton<ImagePickerRepository>(
      () => ImagePickerRepositoryImpl(
        permissionRepository: getIt(),
        imagePickerService: getIt(),
      ),
    );
}

void _registerUseCases() {
  getIt
    ..registerLazySingleton(() => CompareImagesUseCase(getIt()))
    ..registerLazySingleton(() => PickImageUseCase(getIt()));
}

void _registerCubits() {
  getIt
    ..registerLazySingleton(() => ImageMediator())
    ..registerFactory(
      () => ImageCompareCubit(
        compareImagesUseCase: getIt(),
        imageMediator: getIt(),
      ),
    )
    ..registerFactoryParam<ImageCubit, ImageCubitParams, void>(
      (params, _) => ImageCubit(
        pickImageUseCase: getIt(),
        imageMediator: getIt(),
        params: params,
      ),
    );
}
