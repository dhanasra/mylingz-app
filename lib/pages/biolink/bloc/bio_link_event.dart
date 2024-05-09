// ignore_for_file: public_member_api_docs, sort_constructors_first
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

class GetFormMessagesEvent extends BioLinkEvent {}

class DeleteMessagesEvent extends BioLinkEvent {
  final String messageId;
  DeleteMessagesEvent({
    required this.messageId,
  }); 
}

class GetBioLinkAnalyticsEvent extends BioLinkEvent {}

class SaveDesignEvent extends BioLinkEvent {
  final BioLinkDesign design;
  SaveDesignEvent({
    required this.design,
  }); 
}
