import 'package:silent_moon/core/models/single_podcast/background_model.dart';

class PodcastCoverModel {

  PodcastBackgroundModel background;
  String image;

  PodcastCoverModel({
    required this.background,
    required this.image
  });

  factory PodcastCoverModel.fromJson(Map<String, dynamic> json){

    return PodcastCoverModel(
      background: PodcastBackgroundModel.fromJson(json['background']),
      image: json['image']
    );

  }

}