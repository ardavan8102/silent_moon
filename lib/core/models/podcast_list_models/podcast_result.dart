import 'package:silent_moon/core/models/podcast_list_models/podcast_actions.dart';

class PodcastResponseResult {
  final int id;
  final String uuid;
  final String name;
  final String cover;
  final String slug;
  final String description;
  final int itemCount;
  final int followsCount;
  final PodcastAction action;
  final String ownerName;
  final String createdAt;
  final String updatedAt;

  PodcastResponseResult({
    required this.id,
    required this.uuid,
    required this.name,
    required this.cover,
    required this.slug,
    required this.description,
    required this.itemCount,
    required this.followsCount,
    required this.action,
    required this.ownerName,
    required this.createdAt,
    required this.updatedAt,
  });

  factory PodcastResponseResult.fromJson(Map<String, dynamic> json) {
    return PodcastResponseResult(
      id: json['id'],
      uuid: json['uuid'],
      name: json['name'],
      cover: json['cover'],
      slug: json['slug'],
      description: json['description'] ?? 'بدون توضیحات',
      itemCount: json['itemCount'] ?? 0,
      followsCount: json['follows_count'] ?? 0,
      action: PodcastAction.fromJson(json['action']),
      ownerName: json['owner_name'] == '' ? 'هنرمند ناشناس' : json['owner_name'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
    );
  }
}
