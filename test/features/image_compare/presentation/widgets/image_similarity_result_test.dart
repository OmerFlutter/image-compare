import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:image_compare/features/image_compare/presentation/cubit/image_compare_cubit/image_compare_cubit.dart';
import 'package:image_compare/features/image_compare/presentation/widgets/image_similarity_result.dart';
import 'package:mocktail/mocktail.dart';

class MockImageCompareCubit extends Mock implements ImageCompareCubit {
  @override
  Future<void> close() => Future.value();
}

class MockImageCompareStream extends Mock
    implements Stream<ImageCompareState> {}

class MockImageCompareStreamSubscription extends Mock
    implements StreamSubscription<ImageCompareState> {
  @override
  Future<void> cancel() => Future.value();
}

void main() {
  late MockImageCompareStream imageCompareStream;
  late ImageCompareCubit imageCompareCubit;

  setUp(() {
    imageCompareStream = MockImageCompareStream();
    imageCompareCubit = MockImageCompareCubit();
  });

  group('ImageSimilarityResult widget', () {
      setUp(() {
      when(() => imageCompareCubit.stream)
          .thenAnswer((_) => imageCompareStream);
      when(() => imageCompareStream.listen(any()))
          .thenAnswer((_) => MockImageCompareStreamSubscription());
    });

    testWidgets('renders a CircularProgressIndicator when in executing state',
        (WidgetTester tester) async {
      // arrange
      when(() => imageCompareCubit.state)
          .thenReturn(const ImageCompareState.executing());

      // act
      await tester.pumpWidget(_TestWidget(imageCompareCubit));

      // assert
      expect(find.byType(CircularProgressIndicator), findsOneWidget);
    });

    testWidgets(
      'renders a Text widget with the similarity percentage when '
      'in succeeded state',
      (WidgetTester tester) async {
        // arrange
        when(() => imageCompareCubit.state)
            .thenReturn(const ImageCompareState.succeded(50.0));

        // act
        await tester.pumpWidget(_TestWidget(imageCompareCubit));

        // assert
        final textFinder = find.byType(Text);

        final textWidget = textFinder.evaluate().single.widget as Text;
        final textValue = textWidget.data;

        expect(textValue, startsWith('Image similarity: '));
      },
    );

    testWidgets(
        'renders a Text widget with the error message when in error state',
        (WidgetTester tester) async {
      // arrange
      when(() => imageCompareCubit.state)
          .thenReturn(const ImageCompareState.error('Error occured'));

      // act
      await tester.pumpWidget(_TestWidget(imageCompareCubit));

      // assert
      final textFinder = find.byType(Text);

      final textWidget = textFinder.evaluate().single.widget as Text;
      final textValue = textWidget.data;

      expect(textValue, contains('Error occured'));
    });
  });
}

class _TestWidget extends StatelessWidget {
  final ImageCompareCubit imageCompareCubit;

  const _TestWidget(this.imageCompareCubit);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ImageCompareCubit>(
      create: (context) => imageCompareCubit,
      child: const MaterialApp(
        home: Scaffold(
          body: ImageSimilarityResult(),
        ),
      ),
    );
  }
}
