import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_compare/features/image_compare/presentation/cubit/image_compare_cubit/image_compare_cubit.dart';
import 'package:image_compare/features/image_compare/presentation/pages/image_compare_page.dart';
import 'package:image_compare/home/home.dart';
import 'package:image_compare/injection.dart' as injection;

void main() {
  injection.init();
  runApp(const Main());
}

/// The main widget of the application, which initializes the app and 
/// sets up the home page.
class Main extends StatelessWidget {
  /// Creates a new instance of the [Main] widget.
  const Main({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => injection.getIt<ImageCompareCubit>(),
      child: MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: HomeScreen(),
        // home: const ImageComparePage(),
      ),
    );
  }
}
