import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_compare/features/image_compare/domain/enums/image_identifier.dart';
import 'package:image_compare/features/image_compare/presentation/constants/assets.dart';
import 'package:image_compare/features/image_compare/presentation/cubit/image_compare_cubit/image_compare_cubit.dart';
import 'package:image_compare/features/image_compare/presentation/cubit/image_cubit/image_cubit.dart';
import 'package:image_compare/features/image_compare/presentation/widgets/image_similarity_result.dart';
import 'package:image_compare/features/image_compare/presentation/widgets/image_widget.dart';
import 'package:image_compare/injection.dart';

/// A page widget that displays two images side by side and compares their
/// similarity using the Structural Similarity Index (SSIM) algorithm.
class ImageComparePage extends StatelessWidget {
  /// Creates a new [ImageComparePage] instance.
  const ImageComparePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Image Compare App'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              children: [
                const SizedBox(width: 40),
                Expanded(
                  child: BlocProvider(
                    create: (context) => getIt<ImageCubit>(
                      param1: ImageCubitParams(
                        initialImageAsset: Assets.firstImage,
                        identifier: ImageIdentifier.firstImage,
                      ),
                    ),
                    child: const ImageWidget(),
                  ),
                ),
                const SizedBox(width: 40),
                Expanded(
                  child: BlocProvider(
                    create: (context) => getIt<ImageCubit>(
                      param1: ImageCubitParams(
                        initialImageAsset: Assets.secondImage,
                        identifier: ImageIdentifier.secondImage,
                      ),
                    ),
                    child: const ImageWidget(),
                  ),
                ),
                const SizedBox(width: 40),
              ],
            ),
            FilledButton(
              onPressed: () =>
                  BlocProvider.of<ImageCompareCubit>(context).compareImages(),
              child: const Text(
                'Compare',
                style: TextStyle(fontSize: 26),
              ),
            ),
            const ImageSimilarityResult(),
          ],
        ),
      ),
    );
  }
}
