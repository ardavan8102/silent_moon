import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:silent_moon/core/controllers/music_album_controller.dart';
import 'package:silent_moon/presentation/components/texts/page_title.dart';

class MusicAlbumsPage extends StatelessWidget {
  MusicAlbumsPage({super.key});

  final MusicAlbumController musicAlbumController = Get.find<MusicAlbumController>();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: ClampingScrollPhysics(),
      child: Column(
        crossAxisAlignment: .start,
        children: [
          
          const SizedBox(height: 20),

          // title
          PageTitleWidget(
            texts: [
              'موســیفی خـوب',
              'غــذای روحــه',
              'بهتریــن موسیقی های بــی کــلام'
            ]
          ),
        ],
      ),
    );
  }
}