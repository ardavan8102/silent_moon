import 'package:flutter/material.dart';
import 'package:silent_moon/gen/assets.gen.dart';

class AppDatas {

  static final List<Map<String, dynamic>> topicList = [

    {
      'title' : 'افزایش کارایی',
      'color' : Color(0xffF05D48),
      'image' : Assets.svg.topics.improvePerformance,
      'bg_image' : null,
      'height' : 1,
    },

    {
      'title' : 'کاهش استرس',
      'color' : Color(0xff8E97FD),
      'image' : Assets.svg.topics.reduceStress,
      'bg_image' : Assets.images.reduceStressBg.path,
      'height' : 1.2,
    },

    {
      'title' : 'کاهش اضطراب',
      'color' : Color(0xffFFCF86),
      'image' : Assets.svg.topics.reduceAnxiety,
      'bg_image' : null,
      'height' : 1.2,
    },

    {
      'title' : 'افزایش شادی',
      'color' : Color(0xffFEB18F),
      'image' : Assets.svg.topics.increaseHappiness,
      'bg_image' : null,
      'height' : 1,
    },


    {
      'title' : 'خواب بهتر',
      'color' : Color(0xff3F414E),
      'image' : Assets.svg.topics.betterSleep,
      'bg_image' : null,
      'height' : 1,
    },


    {
      'title' : 'توسعه فردی',
      'color' : Color(0xff6CB28E),
      'image' : Assets.svg.topics.personalGrowth,
      'bg_image' : null,
      'height' : 1.2,
    },

  ];

}

