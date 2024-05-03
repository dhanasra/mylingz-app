part of 'links_bloc.dart';

@immutable
sealed class LinksState {}

final class LinksInitial extends LinksState {}

class Loading extends LinksState {}

class AnalyticsFetching extends LinksState {}

class AnalyticsFetched extends LinksState {
  final int totalClicks;
  final int todayClicks;
  final String location;
  final String device;
  final List<ChartData> chart;
  AnalyticsFetched({ required this.totalClicks, required this.todayClicks, required this.location, required this.device, required this.chart});
}

class Success extends LinksState {}

class Deleted extends LinksState {}
class Error extends LinksState {
  final String? msg;
  Error({this.msg});
}
