import 'package:flutter/material.dart';
import 'package:plan_n_track/features/shared/widgets/tracking_app_bar.dart';
import 'package:plan_n_track/features/tracking/data/food_api.dart';
import 'package:plan_n_track/features/tracking/presentation/widgets/day_selector.dart';
import 'package:plan_n_track/features/tracking/presentation/widgets/food_card.dart';

class TrackingView extends StatelessWidget {
  const TrackingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TrackingAppBar(),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
          child: Column(
            children: [
              const DaySelector(),
              const SizedBox(
                height: 24,
              ),
              const FoodCard(
                title: 'Breakfast',
                subtitle: 'Add 900 kcal',
              ),
              const FoodCard(
                title: 'Lunch',
                subtitle: 'Add 1000 kcal',
              ),
              const FoodCard(
                title: 'Dinner',
                subtitle: 'Add 1200 kcal',
              ),
              const FoodCard(
                title: 'Snacks',
                subtitle: 'Add 300 kcal',
              ),
              const SizedBox(
                height: 30,
              ),
              Container(),
              const TestBarcodeAPI(),
            ],
          ),
        ),
      ),
    );
  }
}

class TestBarcodeAPI extends StatefulWidget {
  const TestBarcodeAPI({
    super.key,
  });

  @override
  State<TestBarcodeAPI> createState() => _TestBarcodeAPIState();
}

class _TestBarcodeAPIState extends State<TestBarcodeAPI> {
  late TextEditingController _controller;

  @override
  void initState() {
    _controller = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          controller: _controller,
        ),
        const SizedBox(
          height: 24,
        ),
        ElevatedButton(
          onPressed: () {
            FoodAPI().getFoodFromBarcode(_controller.value.text);
          },
          child: const Text('Search'),
        )
      ],
    );
  }
}
