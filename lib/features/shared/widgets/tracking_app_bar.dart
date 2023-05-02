import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TrackingAppBar extends StatelessWidget implements PreferredSizeWidget {
  const TrackingAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).primaryColor;
    return AppBar(
      centerTitle: true,
      title: Text(
        'Lapsus Calami',
        style: GoogleFonts.pacifico(
          color: color,
        ),
      ),
      leading: IconButton(
        icon: Icon(
          Icons.table_rows_rounded,
          color: color,
        ),
        onPressed: () {
          log('Menu pressed');
        },
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.add_circle_rounded,
            color: color,
          ),
        ),
        const SizedBox(
          width: 8,
        )
      ],
    );
  }

  @override
  Size get preferredSize => const Size(double.infinity, kToolbarHeight);
}
