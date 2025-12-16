import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:silent_moon/consts/colors.dart';
import 'package:silent_moon/core/controllers/music_album_controller.dart';
import 'package:silent_moon/core/models/music/music_model.dart';
import 'package:silent_moon/presentation/components/cached_image.dart';
import 'package:silent_moon/presentation/components/texts/page_title.dart';

class MusicAlbumsPage extends StatelessWidget {
  MusicAlbumsPage({super.key});

  final MusicAlbumController musicAlbumController = Get.put(MusicAlbumController());

  @override
  Widget build(BuildContext context) {

    var size = MediaQuery.of(context).size;
    var textTheme = Theme.of(context).textTheme;

    return Column(
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
    
        const SizedBox(height: 30),
    
        // Musics
        Expanded(
          child: Obx(
            () => musicAlbumController.isLoading.value == false 
            ? ListView.builder(
              itemCount: musicAlbumController.musics.length,
              physics: BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                
                final music = musicAlbumController.musics[index];
            
                final musicMinutes = music.duration ~/ 60;
                final musicSeconds = (music.duration % 60).toString().padLeft(2, '0');
            
                return Container(
                  decoration: BoxDecoration(
                    color: AppSolidColors.lightBackGround,
                    borderRadius: .circular(16)
                  ),
                  width: size.width,
                  height: size.height * .1,
                  margin: const EdgeInsets.only(bottom: 20),
                  padding: const EdgeInsets.all(12),
                  child: Row(
                    spacing: 12,
                    children: [
                      
                      // image
                      CachedThumbnailImage(
                        height: size.height * .08,
                        width: size.height * .08,
                        radius: 12,
                        imageUrl: music.imageUrl
                      ),
            
            
                      // data
                      musicCardInfoTexts(music, textTheme, musicMinutes, musicSeconds),
                    ],
                  ),
                );
            
              },
            ) : const Center(child: CircularProgressIndicator())
          )
        ),
      ],
    );
  }

  Expanded musicCardInfoTexts(MusicModel music, TextTheme textTheme, int musicMinutes, String musicSeconds) {
    return Expanded(
      child: Column(
        crossAxisAlignment: .start,
        mainAxisAlignment: .center,
        spacing: 6,
        children: [
          Row(
            spacing: 12,
            mainAxisAlignment: .spaceBetween,
            children: [
              Expanded(
                child: Text(
                  music.title,
                  style: textTheme.labelSmall!.copyWith(
                    fontWeight: .bold
                  ),
                  maxLines: 1,
                  overflow: .ellipsis,
                ),
              ),

              Row(
                crossAxisAlignment: .center,
                mainAxisAlignment: .center,
                spacing: 4,
                children: [

                  Padding(
                    padding: const EdgeInsets.only(top: 6.0),
                    child: Text(
                      '$musicMinutes:$musicSeconds'
                    ),
                  ),

                  Icon(
                    CupertinoIcons.timer
                  )
                ],
              ),
            ],
          ),

          Text(
            music.artists[0]['name'],
          )
        ],
      ),
    );
  }
}