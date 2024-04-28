part of 'links_bloc.dart';

@immutable
sealed class LinksState {}

final class LinksInitial extends LinksState {}

class Loading extends LinksState {}

class Success extends LinksState {}

class Error extends LinksState {
  final String? msg;
  Error({this.msg});
}
