import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_compare/features/image_compare/presentation/cubit/image_compare_cubit/image_compare_cubit.dart';

/// A widget that displays the result of comparing two images.
///
/// It listens to the [ImageCompareCubit] and displays different widgets
/// based on the current [ImageCompareState].
class ImageSimilarityResult extends StatelessWidget {
  /// Creates a [ImageSimilarityResult] widget.
  const ImageSimilarityResult({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ImageCompareCubit, ImageCompareState>(
      builder: (context, state) => state.map(
        initial: (initialState) => const SizedBox(),
        executing: (executingState) => const CircularProgressIndicator(),
        succeded: (succededState) => Text(
          'Image similarity: ${succededState.result}%',
          style: const TextStyle(fontSize: 26),
        ),
        error: (errorState) => Text(
          '${errorState.message}%',
          style: const TextStyle(fontSize: 26),
        ),
      ),
    );
  }
}
