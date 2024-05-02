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

class SaveButtonsEvent extends BioLinkEvent {
  final List<BioLinkButton> buttons;
  SaveButtonsEvent({
    required this.buttons
  });
}

class SaveSocialLinksEvent extends BioLinkEvent {
  final List<SocialLink> links;
  SaveSocialLinksEvent({
    required this.links
  });
}
