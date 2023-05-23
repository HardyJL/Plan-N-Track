import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DaySelector extends StatefulWidget {
  const DaySelector({
    super.key,
  });

  @override
  State<DaySelector> createState() => _DaySelectorState();
}

class _DaySelectorState extends State<DaySelector> {
  late DateTime _selectedDate;

  @override
  void initState() {
    _selectedDate = DateTime.now().copyWith(hour: 12, minute: 0);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 12),
          child: IconButton(
            onPressed: () {
              setState(() {
                _selectedDate = _selectedDate.add(const Duration(days: -1));
              });
            },
            icon: const Icon(
              Icons.arrow_circle_left_rounded,
              size: 36,
            ),
          ),
        ),
        InkWell(
          onTap: () {
            setState(() {
              _selectedDate = DateTime.now().copyWith(hour: 12, minute: 0);
            });
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 8),
            child: Text(
              DateFormat(
                'dd MMMM yyyy',
                Localizations.localeOf(context).languageCode,
              ).format(_selectedDate),
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 12),
          child: IconButton(
            onPressed: () {
              setState(() {
                _selectedDate = _selectedDate.add(const Duration(days: 1));
              });
            },
            icon: const Icon(
              Icons.arrow_circle_right_rounded,
              size: 36,
            ),
          ),
        ),
      ],
    );
  }
}
