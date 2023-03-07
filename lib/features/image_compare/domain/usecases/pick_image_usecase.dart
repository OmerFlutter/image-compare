import 'package:image_compare/features/image_compare/domain/entities/image_data/image_data.dart';
import 'package:image_compare/features/image_compare/domain/enums/image_identifier.dart';
import 'package:image_compare/features/image_compare/domain/image_result.dart';
import 'package:image_compare/features/image_compare/domain/repositories/image_picker_repository.dart';

/// A use case for picking an image from a source
class PickImageUseCase {
  /// The repository used to pick the image
  final ImagePickerRepository imagePickerRepository;

  /// Constructor for creating a [PickImageUseCase] instance
  const PickImageUseCase(this.imagePickerRepository);
  
  /// Picks an image from a specified [identifier] and returns [ImageResult] 
  /// with the image data or an error
  ///
  /// [identifier] is an [ImageIdentifier] that specifies the 
  /// source of the image
  ///
  /// Returns an [ImageResult] with the [ImageData] of the picked image or 
  /// an error message if error occurs.
  Future<ImageResult<ImageData>> execute(ImageIdentifier identifier) async {
    return imagePickerRepository.pickImage(identifier);
  }
}
