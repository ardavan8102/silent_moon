import 'package:flutter/material.dart';

class EmptyImageStateContainer extends StatelessWidget {
  const EmptyImageStateContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 8, left: 8),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Colors.black,
            Colors.transparent
          ],
          begin: .bottomRight,
          end: .topLeft,
        ),
        borderRadius: BorderRadius.circular(16)
      ),
      child: Align(
        alignment: .topLeft,
        child: Icon(
          Icons.image_not_supported_outlined,
          color: Colors.white,
          size: 50
        ),
      ),
    );
  }
}