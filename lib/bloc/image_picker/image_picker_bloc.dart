import 'package:bloc/bloc.dart';
import 'package:bloc_image_picker/bloc/image_picker/image_picker_event.dart';
import 'package:bloc_image_picker/bloc/image_picker/image_picker_state.dart';
import 'package:bloc_image_picker/utils/image_picker_utils.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerBloc extends Bloc<ImagePickerEvent, ImagePickerState> {
  final ImagePickerUtils imagePickerUtils;
  ImagePickerBloc(this.imagePickerUtils) : super(const ImagePickerState()) {
    on<CameraCaptureEvent>(_cameraCaptureEvent);
    on<GalleryImagePickerEvent>(_galleryImagePickerEvent);
  }
  void _cameraCaptureEvent(
      CameraCaptureEvent event, Emitter<ImagePickerState> emit) async {
    XFile? file = await imagePickerUtils.cameraCapture();
    emit(state.copyWith(file: file));
  }

  void _galleryImagePickerEvent(
      GalleryImagePickerEvent event, Emitter<ImagePickerState> emit) async {
    final file = await imagePickerUtils.galleryImagePicker();
    emit(state.copyWith(file: file));
  }
}
