import 'package:flutter_test/flutter_test.dart';
import 'package:plan_n_track/app.dart';
import 'package:plan_n_track/features/tracking/tracking.view.dart';

void main() {
  group('App', () {
    testWidgets('renders CounterPage', (tester) async {
      await tester.pumpWidget(const App());
      expect(find.byType(TrackingView), findsOneWidget);
    });
  });
}
