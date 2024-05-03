// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'links_bloc.dart';

@immutable
sealed class LinksEvent {}

class GetLinkAnalyticsEvent extends LinksEvent {
  final String linkId;
  GetLinkAnalyticsEvent({
    required this.linkId,
  });
}

class SaveLinkEvent extends LinksEvent {
  final String? id;
  final String url;
  final String? title;
  final String short;
  final String domain;
  final bool isBioLink;
  final String? btnLabel;

  SaveLinkEvent({
    this.id,
    required this.url,
    this.title,
    required this.short,
    required this.domain,
    required this.isBioLink,
    this.btnLabel,
  });
}

class RemoveLinkEvent extends LinksEvent {
  final String id;
  RemoveLinkEvent({
    required this.id
  });
}

class AddLinkToBioEvent extends LinksEvent {
  final ShortLink link;
  AddLinkToBioEvent({
    required this.link
  });
}
