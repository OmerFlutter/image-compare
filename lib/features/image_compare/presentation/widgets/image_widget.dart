import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_compare/features/image_compare/presentation/cubit/image_cubit/image_cubit.dart';

/// The border radius of the image.
const _kDefaultImageBorderRadius = 8.0;

/// The opacity of the pick image button.
const _kDefaultPickImageButtonOpacity = 0.5;

/// A widget that displays an image.
class ImageWidget extends StatelessWidget {
  /// The border radius of the image.
  final double imageBorderRadius;

  /// The opacity of the pick image button.
  final double pickImageButtonOpacity;

  /// Creates an [ImageWidget].
  const ImageWidget({
    this.imageBorderRadius = _kDefaultImageBorderRadius,
    this.pickImageButtonOpacity = _kDefaultPickImageButtonOpacity,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ImageCubit, ImageState>(
      listener: (context, state) {
        state.maybeMap(
          error: (errorState) => showDialog<AlertDialog>(
            context: context,
            builder: (_) => AlertDialog(
              title: const Text('Error Occured'),
              content: Text(errorState.message),
              actions: [
                TextButton(
                  child: const Text('OK'),
                  onPressed: () => Navigator.of(context).pop(),
                ),
              ],
            ),
          ),
          // ignore: no-empty-block
          orElse: () {},
        );
      },
      builder: (context, state) {
        return Stack(
          alignment: Alignment.center,
          children: [
            _Image(
              imageState: state,
              imageBorderRadius: imageBorderRadius,
            ),
            _PickImageButton(pickImageButtonOpacity: pickImageButtonOpacity)
          ],
        );
      },
    );
  }
}

class _Image extends StatelessWidget {
  final double imageBorderRadius;
  final ImageState imageState;

  const _Image({required this.imageState, required this.imageBorderRadius});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(imageBorderRadius),
      child: imageState.map(
        initial: (initialState) {
          return Image.asset(initialState.image.assetName);
        },
        loading: (loadingState) {
          return const CircularProgressIndicator();
        },
        imageLoaded: (imageLoadedState) {
          final image = File(imageLoadedState.file.filePath);

          return Image.file(image);
        },
        error: (errorState) {
          return Column(
            children: [
              Image.asset(errorState.fallback.assetName),
            ],
          );
        },
      ),
    );
  }
}

class _PickImageButton extends StatelessWidget {
  final double pickImageButtonOpacity;

  const _PickImageButton({required this.pickImageButtonOpacity});

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: pickImageButtonOpacity,
      child: FilledButton(
        onPressed: () => BlocProvider.of<ImageCubit>(context).pickImage(),
        child: const Text(
          'Pick Image',
          style: TextStyle(fontSize: 26),
        ),
      ),
    );
  }
}
