part of 'image_bloc.dart';

@immutable
sealed class ImageState {}

final class ImageInitial extends ImageState {}

final class ImageUploading extends ImageState {}

final class ImagePicking extends ImageState {}

final class ImageUploaded extends ImageState {
  final String url;
  ImageUploaded({required this.url});
}

final class ImagePicked extends ImageState {
  final File image;
  ImagePicked({required this.image});
}

final class ImageError extends ImageState {}