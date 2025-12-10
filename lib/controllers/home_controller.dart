import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:silent_moon/data/home_podcast_slider.dart';
import 'package:silent_moon/models/slider_model.dart';

class HomeController extends GetxController {
  
  final RxList<SliderModel> slides = <SliderModel>[].obs;

  final RxBool isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    loadSlides();
  }

  Future<void> loadSlides() async {

    isLoading.value = true;

    await Future.delayed(const Duration(milliseconds: 800)); // Simulate API Loading

    final items = HomePodcastSlider.sliderItems.map((item){
      return SliderModel(
        title: item['title'],
        category: item['cat_name'],
        duration: item['time'],
        color: Color(item['color']),
      );
    }).toList();

    slides.assignAll(items);

    isLoading.value = false;

  }

  Future<void> refreshSlides() async {
    await loadSlides();
  }

}