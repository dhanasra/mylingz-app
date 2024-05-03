part of 'bio_link_bloc.dart';

@immutable
sealed class BioLinkState {}

final class BioLinkInitial extends BioLinkState {}

final class Loading extends BioLinkState {}
final class Success extends BioLinkState {}
final class Error extends BioLinkState {}

class AnalyticsFetching extends BioLinkState {}

class AnalyticsFetched extends BioLinkState {
  final int totalClicks;
  final int todayClicks;
  final String location;
  final String device;
  final List<ChartData> chart;
  AnalyticsFetched({ required this.totalClicks, required this.todayClicks, required this.location, required this.device, required this.chart});
}