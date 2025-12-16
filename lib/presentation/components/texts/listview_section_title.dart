import 'package:flutter/material.dart';

class ListviewSectionTitle extends StatelessWidget {
  const ListviewSectionTitle({super.key, required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {

    var textTheme = Theme.of(context).textTheme;

    return Text(
      label,
      style: textTheme.titleMedium!.copyWith(
        fontWeight: .bold,
      ),
    );
  }
}