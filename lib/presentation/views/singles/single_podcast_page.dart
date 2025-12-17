import 'dart:ui';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:silent_moon/core/controllers/fetch_episodes_controller.dart';
import 'package:silent_moon/core/controllers/podcast_single_controller.dart';
import 'package:silent_moon/core/models/single_podcast/single_podcast_result.dart';
import 'package:silent_moon/presentation/components/appbar_with_return_icon.dart';
import 'package:silent_moon/presentation/components/cards/meta_data_card_item.dart';
import 'package:silent_moon/presentation/components/containers/podcast_episode_bottom_sheet.dart';
import 'package:silent_moon/presentation/components/lists/single_podcast_categories_list.dart';
import 'package:silent_moon/services/dio_api_service.dart';

class SinglePodcastPage extends StatefulWidget {
  const SinglePodcastPage({super.key, required this.slug});

  final String slug;

  @override
  State<SinglePodcastPage> createState() => _SinglePodcastPageState();
}

class _SinglePodcastPageState extends State<SinglePodcastPage> {

  late final PodcastSingleController podcastSingleController;
  late final FetchEpisodesController episodesController;

  @override
  void initState() {
    super.initState();

    podcastSingleController = Get.put(
      PodcastSingleController(
        api: Get.find<DioApiService>(),
        slug: widget.slug
      )
    );
  }

  @override
  Widget build(BuildContext context) {

    var size = MediaQuery.of(context).size;
    var textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBarWithReturnIcon(text: 'اطلاعات پادکست'),
      body: SafeArea(
        child: Obx(
          () {
            final podcast = podcastSingleController.podcast.value;
        
            if (podcastSingleController.isLoading.value) {
              return Center(child: const CircularProgressIndicator());
            }
        
            if (podcast == null) {
              return Center(child: Text('دیتایی وجود ندارد', style: textTheme.titleLarge));
            }

            final FetchEpisodesController episodesController = Get.put(
              FetchEpisodesController(podcast.source),
              tag: podcast.id.toString()
            );
        
            return Padding(
              padding: const EdgeInsets.all(20),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    // Image & Data
                    Stack(
                      children: [
                        // image
                        Container(
                          width: size.width,
                          height: size.height * .3,
                          decoration: BoxDecoration(
                            borderRadius: .circular(16),
                            image: DecorationImage(
                              image: CachedNetworkImageProvider(podcast.cover.image),
                              fit: BoxFit.cover
                            )
                          ),
                          // dark overlay
                          foregroundDecoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                Colors.black,
                                Colors.transparent,
                              ],
                              begin: .bottomCenter,
                              end: .topCenter,
                            ),
                            borderRadius: .circular(16)
                          ),
                        ),
                      
                        // glass container
                        GlassContainerForMetaData(size: size, podcast: podcast, textTheme: textTheme),
                      ],
                    ),
                
                    const SizedBox(height: 20),
                
                    // Content
                    Column(
                      crossAxisAlignment: .start,
                      children: [
                        // meta data boxes : followers / listeners / episodes
                        Row(
                          spacing: 12,
                          children: [
                            PodcastMetaDataCardBoxWithIcon(
                              size: size,
                              textTheme: textTheme,
                              icon: CupertinoIcons.person_badge_plus_fill,
                              label: 'دنبال کننده',
                              value: podcast.followersCount.toString(),
                            ),
                    
                            PodcastMetaDataCardBoxWithIcon(
                              size: size,
                              textTheme: textTheme,
                              icon: CupertinoIcons.suit_heart_fill,
                              label: 'طرفدار',
                              value: podcast.listenerCount.toString(),
                            ),
                    
                            PodcastMetaDataCardBoxWithIcon(
                              size: size,
                              textTheme: textTheme,
                              icon: CupertinoIcons.timer_fill,
                              label: 'قسمت',
                              value: podcast.episodeCount.toString(),
                            ),
                          ],
                        ), 
                      
                        const SizedBox(height: 30),
                    
                        // categories
                        podcast.categories.isNotEmpty
                        ? Column(
                          crossAxisAlignment: .start,
                          spacing: 10,
                          children: [
                            Text(
                              'دسته بندی ها',
                              style: textTheme.titleMedium!.copyWith(
                                fontWeight: .bold
                              ),
                            ),
                            
                            CategoriesListView(
                              size: size,
                              podcast: podcast,
                              textTheme: textTheme
                            ),
                          ],
                        )
                        : const SizedBox.shrink(),
                    
                        const SizedBox(height: 30),
                    
                        // description
                        podcastDescriptionBox(textTheme, podcast),

                        const SizedBox(height: 30),

                        // Episodes
                        Column(
                          spacing: 10,
                          crossAxisAlignment: .start,
                          children: [
                            Text(
                              'قسمـت هــای پادکســت',
                              style: textTheme.titleMedium!.copyWith(
                                fontWeight: .bold
                              ),
                            ),

                            Obx(
                              () => episodesController.isLoading.value == false
                              ? SizedBox(
                                height: size.height * .4,
                                child: GridView.builder(
                                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 5,
                                    mainAxisSpacing: 10,
                                    crossAxisSpacing: 10,
                                  ),
                                  itemCount: episodesController.episodes.length,
                                  itemBuilder: (context, index) {

                                    final episode = episodesController.episodes[index];

                                    return GestureDetector(
                                      onTap: () {
                                        Get.bottomSheet(
                                          EpisodesBottomSheetContainer(
                                            size: size,
                                            episode: episode,
                                            podcast: podcastSingleController.podcast,
                                            index: index
                                          ),
                                        );
                                      },
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: Colors.grey.shade300,
                                          borderRadius: .circular(6)
                                        ),
                                        child: Center(
                                          child: Text(
                                            (index + 1).toString(),
                                            style: TextStyle(
                                              fontWeight: .bold
                                            ),
                                          ),
                                        ),
                                      ),
                                    );

                                  },
                                ),
                              )
                              : const Center(child: CircularProgressIndicator())
                            ),

                            const SizedBox(height: 30),
                          ],
                        ),

                      ],
                    ),
                  ],
                ),
              ),
            );
          }
        ),
      ),
    );
  }

  Column podcastDescriptionBox(TextTheme textTheme, SinglePodcastResult podcast) {
    return Column(
      spacing: 10,
      crossAxisAlignment: .start,
      children: [
        Text(
          'دربــاره پــادکســتــ',
          style: textTheme.titleMedium!.copyWith(
            fontWeight: .bold
          ),
        ),

        Text(
          podcast.description,
          style: textTheme.bodySmall!.copyWith(
            fontSize: 18
          ),
        ),
      ],
    );
  }
}


class GlassContainerForMetaData extends StatelessWidget {
  const GlassContainerForMetaData({
    super.key,
    required this.size,
    required this.podcast,
    required this.textTheme,
  });

  final Size size;
  final SinglePodcastResult? podcast;
  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 16,
      left: 16,
      right: 16,
      child: ClipRRect(
        borderRadius: .circular(8),
        child: BackdropFilter(
          filter: ImageFilter.blur(
            sigmaX: 12,
            sigmaY: 12
          ),
          child: Container(
            padding: EdgeInsets.fromLTRB(12, 12, 20, 12),
            height: size.height * .12,
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: .15),
              borderRadius: .circular(8),
              border: Border.all(
                width: 1,
                color: Colors.white.withValues(alpha: .5)
              ),
            ),
            child: Column(
              spacing: 6,
              crossAxisAlignment: .start,
              mainAxisAlignment: .center,
              children: [
    
                Text(
                  podcast!.title,
                  style: textTheme.labelLarge!.copyWith(
                    color: Colors.white
                  ),
                  maxLines: 1,
                  overflow: .ellipsis,
                ),
    
                Text(
                  'توسط : ${podcast!.ownerName}',
                  style: textTheme.labelSmall!.copyWith(
                    color: Colors.white.withValues(alpha: .7),
                  ),
                  maxLines: 1,
                  overflow: .ellipsis,
                ),
    
              ],
            ),
          ),
        ),
      ),
    );
  }
}