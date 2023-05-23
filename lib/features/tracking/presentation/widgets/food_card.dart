import 'dart:developer';

import 'package:flutter/material.dart';

class FoodCard extends StatelessWidget {
  const FoodCard({
    super.key,
    required this.title,
    required this.subtitle,
  });

  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        onTap: () {
          log('Add $title');
        },
        trailing: const Icon(Icons.add_circle_rounded),
        subtitle: Text(
          subtitle,
          style: Theme.of(context).textTheme.labelMedium,
        ),
        title: Text(
          title,
          style: Theme.of(context)
              .textTheme
              .titleSmall!
              .copyWith(fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
