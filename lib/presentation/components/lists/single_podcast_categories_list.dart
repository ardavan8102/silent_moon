import 'package:flutter/material.dart';
import 'package:silent_moon/consts/colors.dart';
import 'package:silent_moon/core/models/single_podcast/podcast_category.dart';
import 'package:silent_moon/core/models/single_podcast/single_podcast_result.dart';

class CategoriesListView extends StatelessWidget {
  const CategoriesListView({
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
    return SizedBox(
      height: size.height * .06,
      child: ListView.builder(
        scrollDirection: .horizontal,
        itemCount: podcast!.categories.length,
        itemBuilder: (context, index) {
          
          final category = podcast!.categories[index];
      
          return categoryListViewCardItem(index, category);
      
        },
      ),
    );
  }

  Container categoryListViewCardItem(int index, PodcastCategory category) {
    return Container(
      margin: index == podcast!.categories.length - 1
        ? .zero
        : const EdgeInsets.only(left: 10),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: AppSolidColors.darkBackground.withValues(alpha: .5),
        borderRadius: .circular(10),
        border: Border.all(
          width: 2,
          color: AppSolidColors.darkBackground
        )
      ),
      child: Center(
        child: Text(
          category.title!,
          style: textTheme.labelMedium!.copyWith(
            fontSize: 16,
            fontWeight: .bold,
            color: Colors.white
          ),
        ),
      )
    );
  }
}