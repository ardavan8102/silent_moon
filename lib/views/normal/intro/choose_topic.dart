import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:silent_moon/components/button_full_width.dart';
import 'package:silent_moon/consts/colors.dart';
import 'package:silent_moon/data/topic_categories.dart';
import 'package:silent_moon/gen/assets.gen.dart';
import 'package:silent_moon/routes/routes.dart';

class ChooseTopicScreen extends StatefulWidget {
  const ChooseTopicScreen({super.key});

  @override
  State<ChooseTopicScreen> createState() => _ChooseTopicScreenState();
}

class _ChooseTopicScreenState extends State<ChooseTopicScreen> {

  // TODO : must change to saving data in storage
  final List<int> selectedTopics = [];

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var textTheme = Theme.of(context).textTheme;

    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(Assets.images.chooseTopicOverlay.path),
              fit: BoxFit.cover,
              alignment: Alignment.bottomCenter,
            ),
          ),
          padding: const EdgeInsets.all(24),
          width: size.width,
          height: size.height,
          child: Stack(
            children: [
              /// Content
              SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: size.height * .03),
                    Column(
                      spacing: 8,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('چه چیـزی شمــارو به', style: textTheme.titleLarge),
                        Text(
                          'مـاهِــ آرامــ رسونده؟',
                          style: textTheme.titleMedium!.copyWith(
                            color: AppSolidColors.primary,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(height: 12),
                        Text(
                          'عناوین موردعلاقتون رو انتخاب کنید',
                          style: textTheme.bodySmall!.copyWith(
                            color: Colors.black.withValues(alpha: .5),
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 32),

                    /// Grid view
                    StaggeredGrid.count(
                      crossAxisCount: 2,
                      mainAxisSpacing: 20,
                      crossAxisSpacing: 20,
                      children: List.generate(AppDatas.topicList.length, (index) {
                        final topic = AppDatas.topicList[index];
                        final isSelected = selectedTopics.contains(index);

                        return StaggeredGridTile.count(
                          crossAxisCellCount: 1,
                          mainAxisCellCount: topic['height'],
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                // toggle selection
                                if (isSelected) {
                                  selectedTopics.remove(index);
                                } else {
                                  selectedTopics.add(index);
                                }
                              });
                            },
                            child: AnimatedContainer(
                              duration: const Duration(milliseconds: 300),
                              decoration: BoxDecoration(
                                color: topic['color'],
                                borderRadius: BorderRadius.circular(20),
                                border: isSelected
                                    ? Border.all(
                                        color: Colors.greenAccent, width: 3)
                                    : null,
                              ),
                              child: Stack(
                                alignment: Alignment.topCenter,
                                children: [
                                  if (topic['bg_image'] != null)
                                    Positioned.fill(
                                      child: Container(
                                        decoration: BoxDecoration(
                                          image: DecorationImage(
                                            image:
                                                AssetImage(topic['bg_image']),
                                            fit: BoxFit.contain,
                                            alignment: Alignment.topCenter,
                                          ),
                                          borderRadius:
                                              const BorderRadius.vertical(
                                            top: Radius.circular(20),
                                          ),
                                        ),
                                      ),
                                    ),
                                  Positioned(
                                    top: 20,
                                    left: 0,
                                    right: 0,
                                    child: SvgPicture.asset(
                                      topic['image'],
                                      fit: BoxFit.scaleDown,
                                    ),
                                  ),
                                  Positioned(
                                    right: 16,
                                    bottom: 16,
                                    left: 0,
                                    child: Text(
                                      topic['title'],
                                      style: textTheme.labelSmall!.copyWith(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      }),
                    ),
                  ],
                ),
              ),

              /// Submit Button
              if (selectedTopics.isNotEmpty)
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: ButtonFullWidth(
                    msg: 'ادامه',
                    bgcolor: AppSolidColors.primary,
                    function: (){
                      Get.toNamed(AppRoutes.setReminders);
                    },
                    textColor: AppSolidColors.lightText
                  )
                ),
            ],
          ),
        ),
      ),
    );
  }
}