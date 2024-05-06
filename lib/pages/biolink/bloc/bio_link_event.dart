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

class UpdatePromoteEvent extends BioLinkEvent {
  final bool promote;
  UpdatePromoteEvent({
    required this.promote
  });
}

class SaveContactFieldsEvent extends BioLinkEvent {
  final List<ContactFields> fields;
  SaveContactFieldsEvent({
    required this.fields
  });
}

class SaveSocialLinksEvent extends BioLinkEvent {
  final List<SocialLink> links;
  SaveSocialLinksEvent({
    required this.links
  });
}

class GetBioLinkAnalyticsEvent extends BioLinkEvent {}
