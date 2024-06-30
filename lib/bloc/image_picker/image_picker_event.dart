import 'package:equatable/equatable.dart';

sealed class ImagePickerEvent extends Equatable {
  @override
  List<Object> get props => [];

}

class CameraCaptureEvent extends ImagePickerEvent{}

class GalleryImagePickerEvent extends ImagePickerEvent{}