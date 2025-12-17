import 'package:flutter/material.dart';

class MeditationsPage extends StatelessWidget {
  const MeditationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SingleChildScrollView(
        physics: ClampingScrollPhysics(),
        child: Column(
          crossAxisAlignment: .start,
          children: [
            Text('Meditations')
          ],
        ),
      ),
    );
  }
}