import 'package:flutter/material.dart';

class SleepHomePage extends StatelessWidget {
  const SleepHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SingleChildScrollView(
        physics: ClampingScrollPhysics(),
        child: Column(
          crossAxisAlignment: .start,
          children: [
            Text('Sleep')
          ],
        ),
      ),
    );
  }
}