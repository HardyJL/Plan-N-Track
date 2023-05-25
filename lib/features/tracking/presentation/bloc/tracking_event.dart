part of 'tracking_bloc.dart';

@immutable
abstract class TrackingEvent {}

class TrackingInitialized extends TrackingEvent {}

class TrackingDateChanged extends TrackingEvent {}

class TrackingInformationChanged extends TrackingEvent {}
