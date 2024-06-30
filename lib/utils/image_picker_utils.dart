import 'package:image_picker/image_picker.dart';

class ImagePickerUtils {
  final ImagePicker imagePicker = ImagePicker();

  Future<XFile?> cameraCapture() async {
    return await imagePicker.pickImage(source: ImageSource.camera);
  }

    Future<XFile?> galleryImagePicker() async {
    return await imagePicker.pickImage(source: ImageSource.gallery);
  }
}
