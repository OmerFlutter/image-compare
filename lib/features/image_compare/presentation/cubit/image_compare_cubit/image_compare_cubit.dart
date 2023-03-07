import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:image_compare/features/image_compare/domain/entities/image_data/image_data.dart';
import 'package:image_compare/features/image_compare/domain/usecases/compare_images_usecase.dart';
import 'package:image_compare/features/image_compare/presentation/constants/assets.dart';
import 'package:image_compare/features/image_compare/presentation/cubit/image_compare_cubit/utils/image_decoder.dart';
import 'package:image_compare/features/image_compare/presentation/cubit/image_cubit/image_cubit.dart';
import 'package:image_compare/features/image_compare/presentation/cubit/image_mediator.dart';

part 'image_compare_cubit.freezed.dart';
part 'image_compare_state.dart';

/// A [Cubit] that manages the state of image comparison. The comparison
/// results are computed using the [compareImagesUseCase] and the state
/// is updated accordingly.
class ImageCompareCubit extends Cubit<ImageCompareState> {
  /// A use case for comparing two images
  final CompareImagesUseCase compareImagesUseCase;

  /// A class that mediates the exchange of image data between the
  /// [ImageCubit] and the [ImageCompareCubit].
  final ImageMediator imageMediator;

  ImageData? _firstImageData;
  ImageData? _secondImageData;

  /// Creates a new [ImageCompareCubit] instance with the provided
  /// [compareImagesUseCase] and [imageMediator].
  ImageCompareCubit({
    required this.compareImagesUseCase,
    required this.imageMediator,
  }) : super(const ImageCompareState.initial()) {
    imageMediator.firstImageDataStream.listen((imageData) {
      _firstImageData = imageData;
    });
    imageMediator.secondImageDataStream.listen((imageData) {
      _secondImageData = imageData;
    });
  }

  /// Compares the [_firstImageData] and [_secondImageData] using the
  /// [compareImagesUseCase] and updates the state accordingly.
  Future<void> compareImages() async {
    emit(const ImageCompareState.executing());

    var firstImage = await ImageDecoder.decodeFromAsset(Assets.firstImage);
    var secondImage = await ImageDecoder.decodeFromAsset(Assets.secondImage);

    final localFirstImageData = _firstImageData;
    final localSecondImageData = _secondImageData;

    if (localFirstImageData != null) {
      firstImage = await ImageDecoder.decodeFromFile(
        File(localFirstImageData.filePath),
      );
    }

    if (localSecondImageData != null) {
      secondImage = await ImageDecoder.decodeFromFile(
        File(localSecondImageData.filePath),
      );
    }

    final result = await compareImagesUseCase.execute(
      firstImage: firstImage,
      secondImage: secondImage,
    );

    result.map(
      success: (state) => emit(ImageCompareState.succeded(state.data)),
      error: (state) => emit(ImageCompareState.error(state.message)),
    );
  }

  @override
  Future<void> close() {
    imageMediator.dispose();

    return super.close();
  }
}
