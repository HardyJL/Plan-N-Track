part of 'tracking_bloc.dart';

@immutable
abstract class TrackingState {}

class TrackingInitial extends TrackingState {}

class TrackingLoading extends TrackingState {}

class TrackingReady extends TrackingState {}
