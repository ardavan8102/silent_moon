import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:silent_moon/core/controllers/podcast_lists_by_cat_id_controller.dart';
import 'package:silent_moon/core/models/podcasts/podcast_list_models/podcast_result.dart';
import 'package:silent_moon/presentation/components/cards/home_podcasts_slider_card.dart';
import 'package:silent_moon/presentation/components/texts/listview_section_title.dart';
import 'package:silent_moon/presentation/components/texts/page_title.dart';
import 'package:silent_moon/presentation/components/cards/podcast_list_view_card.dart';
import 'package:silent_moon/consts/strings.dart';
import 'package:silent_moon/core/controllers/newest_podcast_controller.dart';
import 'package:silent_moon/gen/assets.gen.dart';
import 'package:silent_moon/services/dio_api_service.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final PodcastController podcastController = Get.find<PodcastController>();
  

  @override
  Widget build(BuildContext context) {

    var size = MediaQuery.of(context).size;
    var textTheme = Theme.of(context).textTheme;

    
    return SingleChildScrollView(
      physics: ClampingScrollPhysics(),
      child: Column(
        crossAxisAlignment: .start,
        children: [
      
          const SizedBox(height: 20),
          
          // Greetings Text
          PageTitleWidget(texts: [
            'خوش آمدید',
            'به مـاهــ آرامــ',
            'روزِ خوبــی رو بـراتــون آرزومنـدیمــ',
          ]),
      
          const SizedBox(height: 28),
      
          // Cards
          homeDualAndSliderCards(size, textTheme),
      
          const SizedBox(height: 40), // Spacer
      
          // Recommended Courses
          ListviewSectionTitle(label: AppStrings.newestPodcasts),
      
          const SizedBox(height: 20),
      
          newestPodcastListViewBuilder(size, podcastController.newestPodcasts),

          const SizedBox(height: 30), // Spacer

          // 634
          ListviewSectionTitle(label: 'کســـب و کــار'),
      
          const SizedBox(height: 20),
      
          podcastListViewBuilderWithCatId(size, 634),

          const SizedBox(height: 30), // Spacer

          // 637
          ListviewSectionTitle(label: 'شعــر و داستـــان'),
      
          const SizedBox(height: 20),
      
          podcastListViewBuilderWithCatId(size, 637),

          const SizedBox(height: 30), // Spacer


          // 643
          ListviewSectionTitle(label: 'ورزشـــ و سلامــتـــ'),
      
          const SizedBox(height: 20),
      
          podcastListViewBuilderWithCatId(size, 643),

        ],
      ),
    );
  }


  SizedBox podcastListViewBuilderWithCatId(Size size, int catId) {

    final controller = Get.put(
      PodcastListsByCatIdController(Get.find<DioApiService>(), catId),
      tag: 'cat_$catId'
    );

    return SizedBox(
      width: size.width,
      height: size.height * .3,
      child: Obx(
        () => ListView.builder(
          itemCount: controller.podcasts.length,
          scrollDirection: .horizontal,
          itemBuilder: (context, index) {
            final item = controller.podcasts[index];
            return Padding(
              padding: index == 0
                ? const EdgeInsetsGeometry.only(left: 10)
                : index == controller.podcasts.length - 1
                  ? const EdgeInsetsGeometry.only(right: 10)
                  : const EdgeInsets.only(right: 10, left: 10),
              child: PodcastListViewCard(podcast: item),
            );
          },
        ),
      ),
    );
  }

  SizedBox newestPodcastListViewBuilder(Size size, RxList<PodcastResponseResult>? list) {
    return SizedBox(
      width: size.width,
      height: size.height * .3,
      child: Obx(
        () => ListView.builder(
          itemCount: list!.length > 8 
            ? 8
            : list.length,
          scrollDirection: .horizontal,
          itemBuilder: (context, index) {
            final item = list[index];
            return Padding(
              padding: index == 0
                ? const EdgeInsetsGeometry.only(left: 10)
                : index == list.length - 1
                  ? const EdgeInsetsGeometry.only(right: 10)
                  : const EdgeInsets.only(right: 10, left: 10),
              child: PodcastListViewCard(podcast: item),
            );
          },
        ),
      ),
    );
  }

  Column homeDualAndSliderCards(Size size, TextTheme textTheme) {
    return Column(
      children: [
        // Dual Cards in a Row
        SizedBox(
          height: size.height * .28,
          child: Row(
            spacing: 20,
            children: [
              welcomeCategoryBannerCard(
                size,
                textTheme,
                const Color(0xffFFC97E),
                Assets.images.banners.relaxationBanner.path,
                'آرامـش بخــش',
                'موسیقــی',
                '3-5 دقیقه',
                const Color(0xff3F414E),
                const Color(0xffffffff),
                const Color(0xff000000),
              ),

              welcomeCategoryBannerCard(
                size,
                textTheme,
                const Color(0xff8E97FD),
                Assets.images.banners.basicsBanner.path,
                'شـروع تـازه',
                'آموزشــی',
                '5-10 دقیقه',
                const Color(0xffEBEAEC),
                const Color(0xff3F414E),
                const Color(0xffffffff)
              ),
            ],
          ),
        ),

        const SizedBox(height: 30),

        // Horizontal Card Slider
        Obx(
          () => podcastController.loading.value == false
          ? SizedBox(
            width: size.width,
            height: size.height * .14,
            child: CarouselSlider.builder(
              itemCount: podcastController.newestPodcasts.length,
              itemBuilder: (context, index, realIndex) {
                          
                final item = podcastController.newestPodcasts[index];
                          
                return HomePodcastsSliderCard(item: item);
                          
              },
              options: CarouselOptions(
                viewportFraction: 1,
                enlargeCenterPage: true,
              ),
            ),
          ) : const Center(child: CircularProgressIndicator()),
        )
      ],
    );
  }

  Expanded welcomeCategoryBannerCard(
    Size size,
    TextTheme textTheme,
    Color bgcolor,
    String image,
    String title,
    String category,
    String time,
    Color buttonBgColor,
    Color buttonTextColor,
    Color normalTextsColor,
  ) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          color: bgcolor,
          borderRadius: .circular(16),
          image: DecorationImage(
            image: AssetImage(image),
            fit: .scaleDown,
            alignment: .topRight
          )
        ),
        height: double.infinity,
        width: size.width / 1.5,
        child: Stack(
          alignment: .center,
          children: [

            // Title & Category
            Positioned(
              right: 16,
              child: Column(
                crossAxisAlignment: .start,
                children: [
                  Text(
                    title,
                    style: textTheme.titleMedium!.copyWith(
                      fontSize: 16,
                      fontWeight: .bold,
                      color: normalTextsColor,
                    ),
                  ),
                  Text(
                    category,
                    style: textTheme.labelSmall!.copyWith(
                      fontSize: 14,
                      color: normalTextsColor,
                    ),
                  )
                ],
              ),
            ),


            // Time Length & Button
            Positioned(
              bottom: 16,
              right: 16,
              left: 16,
              child: Column(
                spacing: 8,
                crossAxisAlignment: .start,
                children: [
                  Text(
                    time,
                    style: textTheme.labelSmall!.copyWith(
                      fontSize: 14,
                      color: normalTextsColor,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(8),
                    alignment: .center,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: buttonBgColor,
                      borderRadius: .circular(8)
                    ),
                    child: Text(
                      'شروع',
                      style: textTheme.labelSmall!.copyWith(
                        color: buttonTextColor
                      ),
                    )
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}