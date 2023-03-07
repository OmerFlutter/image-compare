import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:image_compare/features/image_compare/domain/entities/image_data/image_data.dart';
import 'package:image_compare/features/image_compare/domain/enums/image_identifier.dart';
import 'package:image_compare/features/image_compare/presentation/constants/assets.dart';
import 'package:image_compare/features/image_compare/presentation/cubit/image_cubit/image_cubit.dart';
import 'package:image_compare/features/image_compare/presentation/widgets/image_widget.dart';
import 'package:mocktail/mocktail.dart';

class MockImageCubit extends Mock implements ImageCubit {
  @override
  Future<void> close() => Future.value();
}

class MockImageStream extends Mock implements Stream<ImageState> {}

class MockImageStreamSubscription extends Mock
    implements StreamSubscription<ImageState> {
  @override
  Future<void> cancel() => Future.value();
}

void main() {
  late MockImageStream imageStream;
  late ImageCubit imageCubit;

  setUp(() {
    imageStream = MockImageStream();
    imageCubit = MockImageCubit();

    registerFallbackValue(ImageIdentifier.firstImage);
  });

  group(
    'ImageSimilarityResult widget',
    () {
      setUp(() {
        when(() => imageCubit.stream).thenAnswer((_) => imageStream);
        when(() => imageStream.listen(any()))
            .thenAnswer((_) => MockImageStreamSubscription());
      });

      final imageData = ImageData.asset(
        assetName: Assets.firstImage,
        identifier: ImageIdentifier.firstImage,
      );

      testWidgets('renders an Image when in initial state',
          (WidgetTester tester) async {
        // arrange
        when(() => imageCubit.state).thenReturn(
          ImageState.initial(imageData),
        );

        // act
        await tester.pumpWidget(_TestWidget(imageCubit));

        // assert
        expect(find.byType(Image), findsOneWidget);
      });

      testWidgets('renders a CircularProgressIndicator when in loading state',
          (WidgetTester tester) async {
        // arrange
        when(() => imageCubit.state).thenReturn(const ImageState.loading());

        // act
        await tester.pumpWidget(_TestWidget(imageCubit));

        // assert
        expect(find.byType(CircularProgressIndicator), findsOneWidget);
      });
    },
  );
}

class _TestWidget extends StatelessWidget {
  final ImageCubit imageCubit;

  const _TestWidget(this.imageCubit);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ImageCubit>(
      create: (context) => imageCubit,
      child: const MaterialApp(
        home: Scaffold(
          body: ImageWidget(),
        ),
      ),
    );
  }
}
