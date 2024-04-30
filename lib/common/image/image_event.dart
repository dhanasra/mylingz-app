part of 'image_bloc.dart';

@immutable
sealed class ImageEvent {}

class PickAndUploadImage extends ImageEvent {}

class PickImage extends ImageEvent {}