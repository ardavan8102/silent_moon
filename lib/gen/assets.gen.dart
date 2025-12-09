// dart format width=80

/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: deprecated_member_use,directives_ordering,implicit_dynamic_list_literal,unnecessary_import

import 'package:flutter/widgets.dart';

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/birds.png
  AssetGenImage get birds => const AssetGenImage('assets/images/birds.png');

  /// File path: assets/images/choose_topic_overlay.png
  AssetGenImage get chooseTopicOverlay =>
      const AssetGenImage('assets/images/choose_topic_overlay.png');

  /// File path: assets/images/logo.png
  AssetGenImage get logo => const AssetGenImage('assets/images/logo.png');

  /// File path: assets/images/logo_text.png
  AssetGenImage get logoText =>
      const AssetGenImage('assets/images/logo_text.png');

  /// File path: assets/images/meditation.png
  AssetGenImage get meditation =>
      const AssetGenImage('assets/images/meditation.png');

  /// File path: assets/images/reduce_stress_bg.png
  AssetGenImage get reduceStressBg =>
      const AssetGenImage('assets/images/reduce_stress_bg.png');

  /// File path: assets/images/splash_background.png
  AssetGenImage get splashBackground =>
      const AssetGenImage('assets/images/splash_background.png');

  /// File path: assets/images/welcome.png
  AssetGenImage get welcome => const AssetGenImage('assets/images/welcome.png');

  /// List of all assets
  List<AssetGenImage> get values => [
    birds,
    chooseTopicOverlay,
    logo,
    logoText,
    meditation,
    reduceStressBg,
    splashBackground,
    welcome,
  ];
}

class $AssetsSvgGen {
  const $AssetsSvgGen();

  /// Directory path: assets/svg/topics
  $AssetsSvgTopicsGen get topics => const $AssetsSvgTopicsGen();
}

class $AssetsSvgTopicsGen {
  const $AssetsSvgTopicsGen();

  /// File path: assets/svg/topics/better_sleep.svg
  String get betterSleep => 'assets/svg/topics/better_sleep.svg';

  /// File path: assets/svg/topics/improve_performance.svg
  String get improvePerformance => 'assets/svg/topics/improve_performance.svg';

  /// File path: assets/svg/topics/increase_happiness.svg
  String get increaseHappiness => 'assets/svg/topics/increase_happiness.svg';

  /// File path: assets/svg/topics/personal_growth.svg
  String get personalGrowth => 'assets/svg/topics/personal_growth.svg';

  /// File path: assets/svg/topics/reduce_anxiety.svg
  String get reduceAnxiety => 'assets/svg/topics/reduce_anxiety.svg';

  /// File path: assets/svg/topics/reduce_stress.svg
  String get reduceStress => 'assets/svg/topics/reduce_stress.svg';

  /// List of all assets
  List<String> get values => [
    betterSleep,
    improvePerformance,
    increaseHappiness,
    personalGrowth,
    reduceAnxiety,
    reduceStress,
  ];
}

class Assets {
  const Assets._();

  static const $AssetsImagesGen images = $AssetsImagesGen();
  static const $AssetsSvgGen svg = $AssetsSvgGen();
}

class AssetGenImage {
  const AssetGenImage(
    this._assetName, {
    this.size,
    this.flavors = const {},
    this.animation,
  });

  final String _assetName;

  final Size? size;
  final Set<String> flavors;
  final AssetGenImageAnimation? animation;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = true,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.medium,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  ImageProvider provider({AssetBundle? bundle, String? package}) {
    return AssetImage(_assetName, bundle: bundle, package: package);
  }

  String get path => _assetName;

  String get keyName => _assetName;
}

class AssetGenImageAnimation {
  const AssetGenImageAnimation({
    required this.isAnimation,
    required this.duration,
    required this.frames,
  });

  final bool isAnimation;
  final Duration duration;
  final int frames;
}
