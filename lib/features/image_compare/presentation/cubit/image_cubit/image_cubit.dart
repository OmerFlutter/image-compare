import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:image_compare/features/image_compare/domain/entities/image_data/image_data.dart';
import 'package:image_compare/features/image_compare/domain/enums/image_identifier.dart';
import 'package:image_compare/features/image_compare/domain/usecases/pick_image_usecase.dart';
import 'package:image_compare/features/image_compare/presentation/cubit/image_compare_cubit/image_compare_cubit.dart';
import 'package:image_compare/features/image_compare/presentation/cubit/image_mediator.dart';

part 'image_cubit.freezed.dart';
part 'image_state.dart';

/// A [Cubit] that manages the state of an image.
class ImageCubit extends Cubit<ImageState> {
  /// The use case for picking an image.
  final PickImageUseCase pickImageUseCase;

  /// A class that mediates the exchange of image data between the
  /// [ImageCubit] and the [ImageCompareCubit].
  final ImageMediator imageMediator;

  /// The parameters used to create this [ImageCubit] instance.
  final ImageCubitParams params;

  /// Creates a new [ImageCubit] instance with provided [pickImageUseCase],
  /// [imageMediator] and [params].
  ImageCubit({
    required this.pickImageUseCase,
    required this.imageMediator,
    required this.params,
  }) : super(
          ImageState.initial(
            ImageData.asset(
              assetName: params.initialImageAsset,
              identifier: params.identifier,
            ),
          ),
        );

  /// Initiates the process of picking an image.
  ///
  /// This method invokes the [pickImageUseCase] to pick an image, sends the
  /// resulting [ImageData] to the [imageMediator] for processing and 
  /// updates the state accordingly.
  Future<void> pickImage() async {
    emit(const ImageState.loading());

    final image = await pickImageUseCase.execute(params.identifier);

    image.map(
      success: (state) {
        imageMediator.addImageData(state.data);
        emit(ImageLoaded(state.data));
      },
      error: (state) {
        emit(
          ImageState.error(
            fallback: ImageData.asset(
              assetName: params.initialImageAsset,
              identifier: params.identifier,
            ),
            message: state.message,
          ),
        );
      },
    );
  }

  @override
  Future<void> close() {
    imageMediator.dispose();

    return super.close();
  }
}

/// A class that encapsulates the parameters needed to create an [ImageCubit].
class ImageCubitParams {
  /// The asset path to the initial image to load.
  final String initialImageAsset;

  /// The identifier for the image.
  final ImageIdentifier identifier;

  /// Creates a new [ImageCubitParams] instance with the given parameters.
  ///
  /// The [initialImageAsset] parameter is required and specifies the asset
  /// path to the initial image to load. The [identifier] parameter is
  /// required and specifies the identifier for the image.
  ImageCubitParams({
    required this.initialImageAsset,
    required this.identifier,
  });
}
