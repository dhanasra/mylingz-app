part of 'bio_link_bloc.dart';

@immutable
sealed class BioLinkState {}

final class BioLinkInitial extends BioLinkState {}

final class Loading extends BioLinkState {}
final class Success extends BioLinkState {}
final class Error extends BioLinkState {}
