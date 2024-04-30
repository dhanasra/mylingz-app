part of 'bio_link_bloc.dart';

@immutable
sealed class BioLinkEvent {}

class SaveBasicInfoEvent extends BioLinkEvent {
  final String title;
  final String? picture;
  final String? slogan;

  SaveBasicInfoEvent({
    required this.title,
    this.picture,
    this.slogan,
  });
}
