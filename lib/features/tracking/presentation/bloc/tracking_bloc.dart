import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'tracking_event.dart';
part 'tracking_state.dart';

class TrackingBloc extends Bloc<TrackingEvent, TrackingState> {
  TrackingBloc() : super(TrackingInitial()) {
    on<TrackingInitialized>(_onTrackingInitialized);
    on<TrackingDateChanged>(_onTrackingDateChanged);
    on<TrackingInformationChanged>(_onTrackingInformationChanged);
  }

  FutureOr<void> _onTrackingDateChanged(
    TrackingDateChanged event,
    Emitter<TrackingState> emit,
  ) {
    // Impelement logic for Caching and Server interaction for the database
  }

  FutureOr<void> _onTrackingInformationChanged(
    TrackingInformationChanged event,
    Emitter<TrackingState> emit,
  ) {
    // Implement logic for adding values to the server
  }

  FutureOr<void> _onTrackingInitialized(
    TrackingInitialized event,
    Emitter<TrackingState> emit,
  ) {
    // Get initial server information ? caches
  }
}
