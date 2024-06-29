import 'dart:developer';
import 'dart:io';
import 'dart:typed_data';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_compare/features/image_compare/presentation/cubit/image_compare_cubit/image_compare_cubit.dart';
import 'package:image_compare/features/image_compare/presentation/widgets/image_similarity_result.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as path;

class HomeScreen extends StatefulWidget {
  @override
  _ImageScannerState createState() => _ImageScannerState();
}

class _ImageScannerState extends State<HomeScreen> {
  @override
  void initState() {
    manageData();
    super.initState();
  }

  List<File> imagesFound = [];
  List<String> tabs = [];

  bool checkFileType(String filePath) {
    if (filePath.toLowerCase().contains('thumbnails') ||
        filePath.toLowerCase().contains('trash')) {
      return false;
    }
    if (filePath.endsWith('.jpg') || filePath.endsWith('.jpeg')) {
      return true;
    } else if (filePath.endsWith('.png')) {
      return true;
    } else {
      return false;
    }
  }

  List<List<File>> gallery = [];

  Future<void> getAllFilePaths({required Directory directory}) async {
    imagesFound = [];
    try {
      String path = directory.path;

      path = path.split('Android/data/image_compare.image_compare/files').first;
      final Directory downloadDirectory = Directory(path);

      if (downloadDirectory.existsSync()) {
        final List<FileSystemEntity> files = downloadDirectory.listSync();
        if (downloadDirectory.statSync().modeString().contains('r') &&
            files.isNotEmpty) {
          for (final FileSystemEntity file in files) {
            if (file is File) {
              if (checkFileType(file.path)) {
                imagesFound.add(file);
              }
            } else {
              if (imagesFound.isNotEmpty) {
                final String fileName = imagesFound.last.path
                    .replaceAll("/${imagesFound.last.path.split('/').last}", '')
                    .split('/')
                    .last;

                final String finalFileName =
                    int.tryParse(fileName) != null ? "Gallery" : fileName;

                final int existingTabIndex = tabs.indexOf(finalFileName);
                if (existingTabIndex == -1) {
                  tabs.add(finalFileName);
                  gallery.add(imagesFound);
                } else {
                  List<File> tempFiles = gallery[existingTabIndex];
                  tempFiles = tempFiles + imagesFound;
                  gallery[existingTabIndex] = tempFiles;
                }
              }
              await getAllFilePaths(directory: Directory(file.path));
            }
          }
        } else {
          log('The directory is not readable or empty.');
        }
      } else {
        log('The directory does not exist.');
      }
    } catch (e, st) {
      log('Error: $e');
    }
  }

  Future<bool> requestPermission(Permission permission) async {
    final AndroidDeviceInfo build = await DeviceInfoPlugin().androidInfo;
    if (build.version.sdkInt >= 30) {
      final re = await Permission.manageExternalStorage.request();

      return re.isGranted;
    } else {
      if (await permission.isGranted) {
        return true;
      } else {
        final result = await permission.request();

        return result.isGranted;
      }
    }
  }

  Future<void> manageData() async {
    log('Coming here');
    if (await requestPermission(Permission.storage)) {
      try {
        final Directory? directory = await getExternalStorageDirectory();
        if (directory != null) {
          await getAllFilePaths(directory: directory);
          log('Final number of files: ${imagesFound.length}');
          if (context.mounted) {
            await BlocProvider.of<ImageCompareCubit>(context).compareImages(
              firster: imagesFound.first.path,
              seconder: imagesFound.last.path,
            );
          }
          setState(() {
            //nothing here
          });
        }
      } catch (e) {
        log('This is error: $e');
      }
    } else {
      const snackBar = SnackBar(content: Text('Allow access to storage'));
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: gallery.length,
      child: Scaffold(
        appBar: AppBar(
          title: const ImageSimilarityResult(),
          bottom: TabBar(
            isScrollable: true,
            tabs: List.generate(
              tabs.length,
              (index) => Text("${tabs[index]}(${gallery[index].length})"),
            ),
          ),
        ),
        body: TabBarView(
          children: List.generate(gallery.length, (folderIndex) {
            return GridView.builder(
              itemCount: gallery[folderIndex].length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3, // Number of columns
                crossAxisSpacing: 10.0, // Horizontal space between items
                mainAxisSpacing: 10.0, // Vertical space between items
              ),
              itemBuilder: (context, index) {
                return FutureBuilder(
                  future: gallery[folderIndex][index].readAsBytes(),
                  builder: (context, state) {
                    if (state.hasData) {
                      final imageData = state.data!;

                      return DecoratedBox(
                        decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Image.memory(imageData),
                      );
                    } else {
                      return const Center(child: CircularProgressIndicator());
                    }
                  },
                );
              },
            );
          }),
        ),
      ),
    );
  }
}
