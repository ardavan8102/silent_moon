import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:silent_moon/components/home_podcasts_slider_card.dart';
import 'package:silent_moon/components/podcast_list_view_card.dart';
import 'package:silent_moon/consts/colors.dart';
import 'package:silent_moon/consts/strings.dart';
import 'package:silent_moon/controllers/podcast_controller.dart';
import 'package:silent_moon/gen/assets.gen.dart';
import 'package:silent_moon/models/podcast_model.dart';

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
          //SizedBox(height: size.height * .02),
      
          // Logo
          // Center(
          //   child: Image.asset(Assets.images.logoTextDark.path),
          // ),
      
          const SizedBox(height: 40),
          
          // Greetings Text
          greetingsTitleText(textTheme),
      
          const SizedBox(height: 28),
      
          // Cards
          homeDualAndSliderCards(size, textTheme),
      
          const SizedBox(height: 40),
      
          // Recommended Courses
          sectionListViewTitle(textTheme, AppStrings.allPodcasts),
      
          const SizedBox(height: 20),
      
          podcastListViewBuilder(size, podcastController.allPodcasts),

          const SizedBox(height: 30),

          // Biography
          sectionListViewTitle(textTheme, AppStrings.biographyTitle),
      
          const SizedBox(height: 20),
      
          podcastListViewBuilder(size, podcastController.categoryLists['biography']),

          const SizedBox(height: 30),

          // Sleep
          sectionListViewTitle(textTheme, AppStrings.sleepTitle),
      
          const SizedBox(height: 20),
      
          podcastListViewBuilder(size, podcastController.categoryLists['sleeping']),

          const SizedBox(height: 30),

          // Happiness
          sectionListViewTitle(textTheme, AppStrings.happinessTitle),
      
          const SizedBox(height: 20),
      
          podcastListViewBuilder(size, podcastController.categoryLists['happiness']),

          const SizedBox(height: 30),

          // Personal
          sectionListViewTitle(textTheme, AppStrings.personalTitle),
      
          const SizedBox(height: 20),
      
          podcastListViewBuilder(size, podcastController.categoryLists['personal']),
        ],
      ),
    );
  }

  Text sectionListViewTitle(TextTheme textTheme, String label) {
    return Text(
      label,
      style: textTheme.titleMedium!.copyWith(
        fontWeight: .bold,
      ),
    );
  }

  SizedBox podcastListViewBuilder(Size size, RxList<PodcastModel>? list) {
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
          () => podcastController.isLoading.value == false
          ? SizedBox(
            width: size.width,
            height: size.height * .14,
            child: CarouselSlider.builder(
              itemCount: podcastController.categoryLists['relaxing']!.length,
              itemBuilder: (context, index, realIndex) {
                          
                final item = podcastController.categoryLists['relaxing']![index];
                          
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

  Column greetingsTitleText(TextTheme textTheme) {
    return Column(
      spacing: 2,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text.rich(
          TextSpan(
            children: [
              TextSpan(
                text: 'خوش آمدید',
                style: textTheme.titleMedium!.copyWith(
                  fontFamily: 'Plasma',
                  fontSize: 40,
                ),
              ),

              WidgetSpan(child: SizedBox(width: 6)),

              TextSpan(
                text: 'به مـاهــ آرامــ',
                style: textTheme.titleMedium!.copyWith(
                  fontFamily: 'Plasma',
                  fontSize: 40,
                  color: AppSolidColors.primary,
                ),
              ),
            ]
          ),
        ),

        Text(
          'روزِ خوبــی رو بـراتــون آرزومنـدیمــ',
          style: textTheme.bodySmall!.copyWith(
            color: Colors.black.withValues(alpha: .5),
            fontSize: 16,
          ),
        ),
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