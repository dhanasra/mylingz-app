part of 'links_bloc.dart';

@immutable
sealed class LinksEvent {}

class SaveLinkEvent extends LinksEvent {
  final String url;
  final String? title;
  final String short;
  final String domain;
  final bool isBioLink;
  final String? btnLabel;

  SaveLinkEvent({
    required this.url,
    this.title,
    required this.short,
    required this.domain,
    required this.isBioLink,
    this.btnLabel,
  });
}
