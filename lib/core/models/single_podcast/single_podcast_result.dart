import 'package:silent_moon/core/models/single_podcast/cover_model.dart';
import 'package:silent_moon/core/models/single_podcast/podcast_category.dart';

class SinglePodcastResult {

  final int id;
  final String title;
  final List<PodcastCategory> categories;
  final PodcastCoverModel cover;
  final String description;
  final int episodeCount;
  final int followersCount;
  final String languageCode;
  final int listenerCount;
  final String emailAddress;
  final String ownerName;
  final String? ownerProfileImage;
  final String source;


  SinglePodcastResult({
    required this.id,
    required this.title,
    required this.categories,
    required this.cover,
    required this.description,
    required this.episodeCount,
    required this.followersCount,
    required this.languageCode,
    required this.listenerCount,
    required this.emailAddress,
    required this.ownerName,
    required this.ownerProfileImage,
    required this.source,
  });


  factory SinglePodcastResult.fromJson(Map<String, dynamic> json){

    return SinglePodcastResult(
      id: json['id'] ?? 1,
      title: json['title'] ?? 'بدون عنوان',
      categories: (json['categories'] as List? ?? [])
        .map(
          (category) => PodcastCategory.fromJson(category),
        ).toList(),
      cover: PodcastCoverModel.fromJson(json['cover']),
      description: json['description'] ?? '',
      episodeCount: json['episode_count'] ?? 0, 
      followersCount: json['follower_count'] ?? 0,
      languageCode: json['language'] ?? '',
      listenerCount: json['listener_count'] ?? 0,
      emailAddress: json['owner_email'] ?? '',
      ownerName: json['owner_name'] == "" ? 'هنرمند ناشناس' : json['owner_name'],
      ownerProfileImage: json['owner_profile_image'] ?? "",
      source: json['source'] ?? '',
    );

  }

}