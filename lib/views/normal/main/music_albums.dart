import 'package:flutter/material.dart';

class MusicAlbumsPage extends StatelessWidget {
  const MusicAlbumsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: ClampingScrollPhysics(),
      child: Column(
        crossAxisAlignment: .start,
        children: [
          Text('Musics')
        ],
      ),
    );
  }
}